AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

if SERVER then
	return
end

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

local errorColor = Color(255, 100, 100)

function SWEP:ThrowSCKError(err)
	MsgC(errorColor, string.format("[SCK Error] %s", err), "\n")
end

function SWEP:CreateCSEnt(mdl)
	local ent = ClientsideModel(mdl, RENDERGROUP_OTHER)
	ent.RenderGroup = RENDERGROUP_OTHER

	table.insert(self.CSEnts, ent)

	return ent
end

function SWEP:ClearCSEnts()
	for _, ent in ipairs(self.CSEnts) do
		if ent:IsValid() then
			ent:Remove()
		end
	end

	self.CSEnts = {}
end

local SCKTypes = {}

local function addSCKType(name, data)
	SCKTypes[name] = data
end

local scaleMatrix = Matrix()

addSCKType("Model", {
	Init = function(self, tab, element)
		element.pos = Vector(element.pos)
		element.pos.y = -element.pos.y

		element.angle = Angle(element.angle)
		element.angle.p = -element.angle.p

		local mdl = element.model

		-- Check if we're creating a valid model
		if not mdl or string.GetExtensionFromFilename(mdl) != "mdl" or not file.Exists(mdl, "GAME") then
			self:ThrowSCKError(string.format("Invalid model: \"%s\" (path not found)", mdl))
			return
		end

		local ent = element._entity

		-- If we're re-initializing the table, check if we actually have to recreate the model
		if IsValid(ent) then
			if ent:GetModel() == mdl then
				return
			end

			ent:Remove()
		end

		ent = self:CreateCSEnt(mdl)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:SetParent(self)
		ent:SetNoDraw(true)

		element._entity = ent
	end,
	Render = function(self, tab, element, ent, flags, rendergroups)
		local csent = element._entity

		if not IsValid(ent) or not IsValid(csent) then
			return
		end

		if rendergroups and not rendergroups[csent:GetRenderGroup()] then
			return
		end

		local matrix = self:GetBoneOrientation(tab, element, ent)
		if not matrix then return end

		local pos = matrix:GetTranslation()
		local ang = matrix:GetAngles()

		if self.ViewModelFlip and ent:GetClass() == "viewmodel" then
			ang.r = -ang.r
		end

		csent:SetPos(pos)
		csent:SetAngles(ang)

		-- Re-using a single matrix here for optimization
		if element.size then
			scaleMatrix:Identity()
			scaleMatrix:SetScale(element.size)

			csent:EnableMatrix("RenderMultiply", scaleMatrix)
		end

		local parent = element.bonemerge and ent or self

		if csent:GetParent() != parent then
			csent:SetParent(parent)
		end

		if csent:IsEffectActive(EF_BONEMERGE) != tobool(element.bonemerge) then
			if element.bonemerge then
				csent:AddEffects(EF_BONEMERGE)
			else
				csent:RemoveEffects(EF_BONEMERGE)
			end
		end

		if element.skin != ent:GetSkin() then
			csent:SetSkin(element.skin)
		end

		for id, index in pairs(element.bodygroup) do
			if csent:GetBodygroup(id) != index then
				csent:SetBodygroup(id, index)
			end
		end

		-- Not using render.MaterialOverride here because we'd have to cache the IMaterial object somehow and that's a lot of extra work
		if element._material != element.material then
			element._material = element.material
			csent:SetMaterial(element.material)
		end

		if element.suppresslightning then
			render.SuppressEngineLighting(true)
		end

		render.SetColorModulation(element.color.r / 255, element.color.g / 255, element.color.b / 255)
		render.SetBlend(element.color.a / 255)

		local mode = element.color.a < 255 and RENDERMODE_TRANSCOLOR or RENDERMODE_NORMAL

		if csent:GetRenderMode() != mode then
			csent:SetRenderMode(mode)
		end

		if element.inversed then
			render.CullMode(MATERIAL_CULLMODE_CW)
		end

		if element.clipplanes then
			render.EnableClipping(true)

			for _, clip in ipairs(element.clipplanes) do
				local clipAng = Angle(ang)
				local clipPos = csent:GetPos()

				clipPos:Add(ang:Forward() * clip.pos.x)
				clipPos:Add(ang:Right() * clip.pos.y)
				clipPos:Add(ang:Up() * clip.pos.z)

				clipAng:RotateAroundAxis(clipAng:Up(), clip.angle.y)
				clipAng:RotateAroundAxis(clipAng:Right(), clip.angle.p)
				clipAng:RotateAroundAxis(clipAng:Forward(), clip.angle.r)

				render.PushCustomClipPlane(clipAng:Up(), clipAng:Up():Dot(clipPos))
			end
		end

		csent:DrawModel(flags)

		if element.nocull then
			render.CullMode(element.inversed and MATERIAL_CULLMODE_CCW or MATERIAL_CULLMODE_CW)
			csent:DrawModel(flags)
		end

		if element.clipplanes then
			for i = 1, #element.clipplanes do
				render.PopCustomClipPlane()
			end

			render.EnableClipping(false)
		end

		-- All of this is just restoring to the default gmod state, so we don't actually have to check if anything changed
		render.CullMode(MATERIAL_CULLMODE_CCW)

		render.SetBlend(1)
		render.SetColorModulation(1, 1, 1)

		render.SuppressEngineLighting(false)
	end
})

local spriteFlags = bit.bor(STUDIO_TRANSPARENCY, STUDIO_TWOPASS)

addSCKType("Sprite", {
	Init = function(self, tab, element)
		element.pos = Vector(element.pos)
		element.pos.y = -element.pos.y

		local mat = element.sprite

		-- Check if the material we're using exists
		if not mat or not file.Exists("materials/" .. mat .. ".vmt", "GAME") then
			self:ThrowSCKError(string.format("Invalid sprite: \"%s\" (path not found)", mat))

			return
		end

		local materialName = mat .. "-sck-"
		local materialParameters = {
			-- This fixes a potential issue where the sprite material name doesn't match the sprite texture name
			["$basetexture"] = Material(mat):GetTexture("$basetexture"):GetName()
		}

		-- Allow for setting a number of extra sprite keys
		for _, key in ipairs({"nocull", "additive", "vertexalpha", "vertexcolor", "ignorez"}) do
			local value = tobool(element[key]) and 1 or 0

			materialParameters["$" .. key] = value
			materialName = materialName .. value
		end

		-- Don't have to recreate the material if it already exists with the correct parameters
		if element._cachedMaterialName == materialName then
			return
		end

		element._cachedMaterialName = materialName
		element._material = CreateMaterial(materialName, "UnlitGeneric", materialParameters)
	end,
	Render = function(self, tab, element, ent, flags)
		if flags and not bit.band(flags, spriteFlags) then return end
		if not element._material then return end

		local matrix = self:GetBoneOrientation(tab, element, ent)
		if not matrix then return end

		render.SetMaterial(element._material)
		render.DrawSprite(matrix:GetTranslation(), element.size.x, element.size.y, element.color or color_white)
	end
})

addSCKType("ClipPlane", {
	Init = function(self, tab, element)
		local parent = tab[element.rel]

		if not parent or parent.type != "Model" then
			self:ThrowSCKError("Cannot add clip plane: rel is missing or not a model")

			return
		end

		element.pos = Vector(element.pos)
		element.angle = Angle(element.angle)

		parent.clipplanes = parent.clipplanes or {}
		parent.clipcount = parent.clipcount or 0

		if parent.clipcount >= 2 then
			self:ThrowSCKError("Cannot add clip plane: Maximum limit reached (2)")

			return
		end

		table.insert(parent.clipplanes, element)

		parent.clipcount = parent.clipcount + 1
	end,
	Render = function(self, ent, tab, element)
	end
})

function SWEP:GetBoneOrientation(lookup, element, ent)
	if element._frame == FrameNumber() then
		return element._matrix
	end

	element._frame = FrameNumber()

	local parent = lookup[element.rel]
	local matrix

	if parent then
		matrix = Matrix(self:GetBoneOrientation(lookup, parent, ent))
	else
		local bone = ent:LookupBone(element.bone or "ValveBiped.Bip01_R_Hand")

		if not bone then
			return
		end

		matrix = ent:GetBoneMatrix(bone)
	end

	if element.pos then matrix:Translate(element.pos) end
	if element.angle then matrix:Rotate(element.angle) end

	element._matrix = matrix

	return matrix
end

-- New bone system to replace the old one SCK uses, should be more performant since we're not recreating the entire bone setup every time we update
function SWEP:RebuildBoneCache(vm)
	vm:SetupBones()

	table.Empty(self.BoneCache)

	if table.Count(self.ViewModelBoneMods) == 0 then
		return
	end

	local mods = self.ViewModelBoneMods
	local cache = self.BoneCache

	for i = 0, vm:GetBoneCount() - 1 do
		local name = vm:GetBoneName(i)
		local boneMod = mods[name]

		if boneMod then
			cache[i] = {
				pos = boneMod.pos or Vector(),
				angle = boneMod.angle or Angle(),
				scale = boneMod.scale or Vector(1, 1, 1),
				hide = boneMod.hide
			}
		else
			cache[i] = {
				pos = Vector(0, 0, 0),
				angle = Angle(0, 0, 0),
				scale = Vector(1, 1, 1)
			}
		end
	end

	-- Child bones don't scale based on their parents by default, so we do that manually here
	for index, bone in pairs(cache) do
		local parent = vm:GetBoneParent(index)

		while parent >= 0 do
			if cache[parent].hide then
				bone.hide = true
			end

			bone.scale:Mul(cache[parent].scale)
			parent = vm:GetBoneParent(parent)
		end
	end
end

local nan = Vector(1 / 0, 1 / 0, 1 / 0)

function SWEP:ApplyBoneMods(vm)
	if table.Count(self.BoneCache) == 0 then
		return
	end

	for index, bone in pairs(self.BoneCache) do
		local scale = bone.hide and nan or bone.scale

		if vm:GetManipulateBoneScale(index) != scale then
			vm:ManipulateBoneScale(index, scale)
		end

		if vm:GetManipulateBoneAngles(index) != bone.angle then
			vm:ManipulateBoneAngles(index, bone.angle)
		end

		if vm:GetManipulateBonePosition(index) != bone.pos then
			vm:ManipulateBonePosition(index, bone.pos)
		end
	end

	vm:SetupBones()
end

local vector_one = Vector(1, 1, 1)

function SWEP:ResetBoneMods(vm)
	for i = 0, vm:GetBoneCount() - 1 do
		vm:ManipulateBoneScale(i, vector_one)
		vm:ManipulateBoneAngles(i, angle_zero)
		vm:ManipulateBonePosition(i, vector_origin)
	end

	vm:SetupBones()
end

function SWEP:InitSCKElements(tab)
	local renderorder = {}

	for name, element in pairs(tab) do
		element.renderorder = element.renderorder or 0
		element.name = name

		local def = SCKTypes[element.type]

		if def then
			def.Init(self, tab, element)
			table.insert(renderorder, element)
		else
			self:ThrowSCKError(string.format("Unimplemented SCK type: %s", element.type))
		end
	end

	table.sort(renderorder, function(a, b)
		return a.renderorder > b.renderorder
	end)

	self.RenderOrder[tab] = renderorder
end

function SWEP:InitSCK()
	self:ClearCSEnts()

	local tab = weapons.Get(self:GetClass())

	self.RenderOrder = {}

	self.VElements = tab.VElements or {}
	self.WElements = tab.WElements or {}

	self.ViewModelBoneMods = tab.ViewModelBoneMods or {}
	self.InvalidateBoneMods = true
	self.BoneCache = {}

	self:InitSCKElements(self.VElements)
	self:InitSCKElements(self.WElements)
end

function SWEP:DrawSCKElements(tab, ent, flags, rendergroups)
	for _, element in ipairs(self.RenderOrder[tab]) do
		if element.hide then
			continue
		end

		local def = SCKTypes[element.type]

		if def then
			def.Render(self, tab, element, ent, flags, rendergroups)
			render.UpdateRefractTexture()
		end
	end
end

local _flags

function SWEP:PreDrawViewModel(vm, _, ply, flags)
	if self.InvalidateBoneMods then
		self:RebuildBoneCache(vm)
		self.InvalidateBoneMods = false
	end

	-- By applying here...
	self:ApplyBoneMods(vm)

	if not self.ShowViewModel then
		-- We can't use the render.MaterialOverride method here because that would affect viewmodel hands as well
		vm:SetMaterial("null")
	end

	-- Since the flags aren't available in the normal PostDrawViewModel hook, we store them locally here
	_flags = flags
end

function SWEP:PostDrawViewModel(vm, _, ply)
	vm:SetMaterial("")

	self:DrawSCKElements(self.VElements, vm, _flags)

	-- ... and resetting here, we avoid ever running into issues where bones leak into other viewmodels
	self:ResetBoneMods(vm)
end

local null = Material("null")

local opaque = {
	[RENDERGROUP_OPAQUE] = true,
	[RENDERGROUP_BOTH] = true
}

local translucent = {
	[RENDERGROUP_TRANSLUCENT] = true,
	[RENDERGROUP_BOTH] = true
}

function SWEP:DrawWorldModel(flags, isTranslucent)
	if not self.ShowWorldModel then
		render.MaterialOverride(null)
	end

	self:DrawModel(flags)

	render.MaterialOverride(nil)

	local rendergroups = isTranslucent and translucent or opaque

	self:DrawSCKElements(self.WElements, self, flags, rendergroups)
end

function SWEP:DrawWorldModelTranslucent(flags)
	self:DrawWorldModel(flags, true)
end
