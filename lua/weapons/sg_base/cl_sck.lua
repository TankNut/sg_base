AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

if SERVER then
	return
end

local developerMode = sg.DeveloperMode

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true


function SWEP:CreateCSEnt(mdl)
	local ent = ClientsideModel(mdl, RENDERGROUP_OTHER)
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

local shouldFlip = false
local scaleMatrix = Matrix()

local function fixPos(pos)
	pos = Vector(pos)
	pos.y = -pos.y

	return pos
end

local function fixAng(ang)
	ang = Angle(ang)
	ang.p = -ang.p

	return ang
end

-- Fix for a discrepancy between the old and new positioning logic
local function fixPositions(element)
	if element.pos then element.pos = fixPos(element.pos) end
	if element.pos2 then element.pos2 = fixPos(element.pos2) end

	if element.angle then element.angle = fixAng(element.angle) end
	if element.angle2 then element.angle2 = fixAng(element.angle2) end
end

local badShaders = {
	["LightmappedGeneric"] = true
}

addSCKType("Model", {
	Init = function(self, tab, element)
		fixPositions(element)

		-- Check if we're creating a valid model
		if not element.model or string.GetExtensionFromFilename(element.model) != "mdl" or not file.Exists(element.model, "GAME") then
			sg.ThrowError("Cannot add %s: File not found (%s)", element, element.model)
			return
		end

		-- Check for bad materials
		if #element.material > 0 then
			local shader = Material(element.material):GetShader()

			if badShaders[shader] then
				sg.ThrowError("Clearing %s.material: Bad shader (%s)", element, shader)

				element.material = ""
			end
		end

		local ent = self:CreateCSEnt(element.model)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:SetParent(self)
		ent:SetNoDraw(true)

		element._entity = ent
	end,
	Render = function(self, tab, element, ent, flags, rendergroups)
		local csent = element._entity
		if not IsValid(csent) then return end

		if rendergroups and not rendergroups[csent:GetRenderGroup()] then
			return
		end

		local matrix = self:GetBoneOrientation(tab, element, ent)
		if not matrix then return end

		local pos = matrix:GetTranslation()
		local ang = matrix:GetAngles()

		if shouldFlip then ang.r = -ang.r end

		csent:SetPos(pos)
		csent:SetAngles(ang)

		-- Re-using a single matrix here for optimization
		if element.size != element._size then
			scaleMatrix:Identity()
			scaleMatrix:SetScale(element.size)

			element._size = Vector(element.size)

			csent:EnableMatrix("RenderMultiply", scaleMatrix)
		end

		local parent = element.bonemerge and ent or self

		if csent:GetParent() != parent then
			csent:SetParent(parent)
		end

		if csent:IsEffectActive(EF_BONEMERGE) != element.bonemerge then
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

		if element.inverted then
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
			render.CullMode(element.inverted and MATERIAL_CULLMODE_CCW or MATERIAL_CULLMODE_CW)
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

addSCKType("ClipPlane", {
	Init = function(self, tab, element)
		local parent = tab[element.rel]

		if not parent or parent.type != "Model" then
			sg.ThrowError("Cannot add %s: Parent is missing or not a model", element)

			return
		end

		element.pos = Vector(element.pos)
		element.angle = Angle(element.angle)

		parent.clipplanes = parent.clipplanes or {}
		parent.clipcount = parent.clipcount or 0

		if parent.clipcount >= 2 then
			sg.ThrowError("Cannot add %s: Maximum clip limit reached (2)", element)

			return
		end

		table.insert(parent.clipplanes, element)

		parent.clipcount = parent.clipcount + 1
	end,
	Render = function(self, ent, tab, element)
	end
})

addSCKType("Sprite", {
	Init = function(self, tab, element)
		if element.quad then
			element.angle = element.angle or angle_zero
		end

		fixPositions(element)

		local mat = Material(element.sprite)

		-- Check if the material we're using exists
		if mat:IsError() then
			self:ThrowError("Cannot add %s: Base material is invalid", element)

			return
		end

		local materialName = mat:GetName() .. "-sck-"
		local materialParameters = {
			-- This fixes a potential issue where the sprite material name doesn't match the sprite texture name
			["$basetexture"] = mat:GetTexture("$basetexture"):GetName()
		}

		-- Allow for setting a number of extra sprite keys
		for _, key in ipairs({"nocull", "additive", "vertexalpha", "vertexcolor", "ignorez"}) do
			local value = tobool(element[key]) and 1 or 0

			materialParameters["$" .. key] = value
			materialName = materialName .. value
		end

		element._material = CreateMaterial(materialName, "UnlitGeneric", materialParameters)
	end,
	Render = function(self, tab, element, ent, flags, rendergroups)
		-- Don't render during worldmodel opaque pass
		if rendergroups and bit.band(flags, STUDIO_TRANSPARENCY) == 0 then return end
		if not element._material then return end

		local matrix = self:GetBoneOrientation(tab, element, ent)
		if not matrix then return end

		render.SetMaterial(element._material)

		if element.quad then
			render.DrawQuadEasy(matrix:GetTranslation(), matrix:GetForward(), element.size.x, element.size.y, element.color, matrix:GetAngles().r + 180)
		else
			render.DrawSprite(matrix:GetTranslation(), element.size.x, element.size.y, element.color)
		end
	end
})

local forward = Color(255, 0, 0)
local right =   Color(0, 255, 0)
local up =      Color(0, 0, 255)

addSCKType("Quad", {
	Init = function(self, tab, element)
		element.draw_func = self[element.draw_func]
	end,
	Render = function(self, tab, element, ent, flags, rendergroups)
		local matrix = self:GetBoneOrientation(tab, element, ent)
		local pos, ang = matrix:GetTranslation(), matrix:GetAngles()

		if developerMode:GetBool() then
			render.DrawLine(pos - ang:Up(), pos + ang:Up(), forward)
			render.DrawLine(pos - ang:Forward(), pos + ang:Forward(), right)
			render.DrawLine(pos - ang:Right(), pos + ang:Right(), up)
		end

		if not element.draw_func then
			return
		end

		cam.Start3D2D(pos, ang, element.size)
			element.draw_func(self, element, ent, flags, rendergroups)
		cam.End3D2D()
	end
})

addSCKType("Laser", {
	Init = function(self, tab, element)
		fixPositions(element)

		element.pixvis = util.GetPixelVisibleHandle()
	end,
	Render = function(self, tab, element, ent, flags, rendergroups)
		-- Don't render during worldmodel opaque pass
		if rendergroups and bit.band(flags, STUDIO_TRANSPARENCY) == 0 then
			return
		end

		local matrix = self:GetBoneOrientation(tab, element, ent)
		sg.DrawLaser(matrix:GetTranslation(), matrix:GetForward(), element.length, element.width, element.color, element.brightness, element.pixvis)
	end
})

addSCKType("Spotlight", {
	Init = function(self, tab, element)
		fixPositions(element)

		element.pixvis = util.GetPixelVisibleHandle()
	end,
	Render = function(self, tab, element, ent, flags, rendergroups)
		-- Don't render during worldmodel opaque pass
		if rendergroups and bit.band(flags, STUDIO_TRANSPARENCY) == 0 then
			return
		end

		local matrix = self:GetBoneOrientation(tab, element, ent)
		sg.DrawSpotlight(matrix:GetTranslation(), matrix:GetForward(), element.length, element.width, element.color, element.pixvis)
	end
})

local nan = Vector(1 / 0, 1 / 0, 1 / 0)
local vector_one = Vector(1, 1, 1)

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
		matrix:SetScale(vector_one)
	end

	if element.pos then matrix:Translate(element.pos) end
	if element.angle then matrix:Rotate(element.angle) end

	-- For easy manipulation through code
	if element.pos2 then matrix:Translate(element.pos2) end
	if element.angle2 then matrix:Rotate(element.angle2) end

	element._matrix = matrix

	return matrix
end

-- New bone system to replace the old one SCK uses, should be more performant since we're not recreating the entire bone setup every time we update
function SWEP:RebuildBoneCache(vm)
	self.BoneCache = nil

	if table.Count(self.ViewModelBoneMods) == 0 then
		return
	end

	vm:SetupBones()

	local mods = self.ViewModelBoneMods
	local cache = {}

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

	self.BoneCache = cache
end

function SWEP:ApplyBoneMods(vm)
	local cache = self.BoneCache
	if not cache then return end

	for i = 0, #cache do
		local bone = cache[i]
		local scale = bone.hide and nan or bone.scale

		if scale != vector_one then
			vm:ManipulateBoneScale(i, scale)
		end

		if bone.angle != angle_zero then
			vm:ManipulateBoneAngles(i, bone.angle)
		end

		if bone.pos != vector_origin then
			vm:ManipulateBonePosition(i, bone.pos)
		end
	end

	vm:SetupBones()
end

function SWEP:ResetBoneMods(vm)
	local cache = self.BoneCache
	if not cache then return end

	for i = 0, #cache do
		local bone = cache[i]
		local scale = bone.hide and nan or bone.scale

		if scale != vector_one then
			vm:ManipulateBoneScale(i, vector_one)
		end

		if bone.angle != angle_zero then
			vm:ManipulateBoneAngles(i, angle_zero)
		end

		if bone.pos != vector_origin then
			vm:ManipulateBonePosition(i, vector_origin)
		end
	end
end

local defaultRenderOrder = {
	["Quad"] = -10,
	["Laser"] = -10,
	["Spotlight"] = -10,
	["Sprite"] = -5
}

local meta = {
	__tostring = function(self)
		return string.format("SCK_%s[%s]", self.type, self.name)
	end
}

function SWEP:InitSCKElements(tab)
	local renderorder = {}

	for name, element in pairs(tab) do
		setmetatable(element, meta)

		element.renderorder = element.renderorder or defaultRenderOrder[element.type] or 0
		element.name = name

		local def = SCKTypes[element.type]

		if def then
			def.Init(self, tab, element)
			table.insert(renderorder, element)
		else
			sg.ThrowError("Skipping unimplemented SCK type: " .. element.type)
		end
	end

	table.sort(renderorder, function(a, b)
		return a.renderorder > b.renderorder
	end)

	self.RenderOrder[tab] = renderorder
end

function SWEP:InitPostSCK()
end

function SWEP:InitSCK()
	self:ClearCSEnts()

	local tab = weapons.Get(self:GetClass())

	self.RenderOrder = {}

	self.VElements = tab.VElements or {}
	self.WElements = tab.WElements or {}

	self.ViewModelBoneMods = tab.ViewModelBoneMods or {}
	self.InvalidateBoneMods = true

	self:InitSCKElements(self.VElements)
	self:InitSCKElements(self.WElements)

	self:InitPostSCK()
end

function SWEP:UpdateSCK()
end

local lastSCKUpdate = 0

function SWEP:DrawSCKElements(tab, ent, flags, rendergroups)
	local frame = FrameNumber()

	if lastSCKUpdate != frame then
		self:UpdateSCK()
		lastSCKUpdate = frame
	end

	shouldFlip = self.ViewModelFlip and ent:GetClass() == "viewmodel"

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

local nullMaterial = Material("null")

function SWEP:PreDrawViewModel(vm, _, ply, flags)
	if self.InvalidateBoneMods then
		self:RebuildBoneCache(vm)
		self.InvalidateBoneMods = false
	end

	-- By applying here...
	self:ApplyBoneMods(vm)

	if not self.ShowViewModel then
		render.MaterialOverride(nullMaterial)
	end
end

function SWEP:PostDrawViewModel(vm, _, ply, flags)
	if not self.ShowViewModel then
		render.MaterialOverride(nil)
		ply:GetHands():DrawModel()
	end

	self:DrawSCKElements(self.VElements, vm, flags)

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
