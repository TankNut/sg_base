AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

if SERVER then
	return
end

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

local nan = Vector(1 / 0, 1 / 0, 1 / 0)
local vector_one = Vector(1, 1, 1)

function SWEP:BuildBoneCache(vm)
	self.BoneCache = {}

	vm:SetupBones()

	for i = 0, vm:GetBoneCount() - 1 do
		self.BoneCache[i] = {
			parent = vm:GetBoneParent(i)
		}
	end
end

function SWEP:GetBoneScale(vm, index)
	local bone = self.BoneCache[index]

	if bone.frame == FrameNumber() then
		return bone.scale
	end

	bone.frame = FrameNumber()

	local mod = self.ViewModelBoneMods[vm:GetBoneName(index)]

	if mod then
		local proxy = mod._proxy

		bone.scale = proxy.hide and nan or Vector(proxy.scale)
	else
		bone.scale = Vector(1, 1, 1)
	end

	if bone.scale != nan and bone.parent != -1 then
		bone.scale:Mul(self:GetBoneScale(vm, bone.parent))
	end

	return bone.scale
end

function SWEP:ApplyBoneMods(vm)
	for i = 0, vm:GetBoneCount() - 1 do
		local mod = self.ViewModelBoneMods[vm:GetBoneName(i)]
		local scale = self:GetBoneScale(vm, i)

		if scale != vector_one then
			vm:ManipulateBoneScale(i, scale)
		end

		if mod then
			local proxy = mod._proxy

			if proxy.angle != angle_zero then
				vm:ManipulateBoneAngles(i, proxy.angle)
			end

			if proxy.pos != vector_origin then
				vm:ManipulateBonePosition(i, proxy.pos)
			end
		end
	end

	vm:SetupBones()
end

function SWEP:ResetBoneMods(vm)
	for i = 0, vm:GetBoneCount() - 1 do
		local scale = self:GetBoneScale(vm, i)

		if scale != vector_one then
			vm:ManipulateBoneScale(i, vector_one)
		end

		if vm:GetManipulateBoneAngles(i) != angle_zero then
			vm:ManipulateBoneAngles(i, angle_zero)
		end

		if vm:GetManipulateBonePosition(i) != vector_origin then
			vm:ManipulateBonePosition(i, vector_origin)
		end
	end
end

function SWEP:InitSCKElements(elements)
	self.RenderOrder[elements] = sg.SCK.InitElements(self, elements)
end

function SWEP:InitBoneMods(tab)
	for name, element in pairs(tab) do
		 -- Animation proxy
		element._proxy = setmetatable({}, {__index = element})
	end
end

function SWEP:InitSCK()
	self:ClearCSEnts()

	local tab = weapons.Get(self:GetClass())

	self.RenderOrder = {}

	self.VElements = tab.VElements or {}
	self.WElements = tab.WElements or {}

	self.ViewModelBoneMods = tab.ViewModelBoneMods or {}

	self:InitSCKElements(self.VElements)
	self:InitSCKElements(self.WElements)

	self:InitBoneMods(self.ViewModelBoneMods)

	self:RunHooks("InitSCK")
end

function SWEP:DrawSCKElements(tab, ent, flags, rendergroups, lod)
	local frame = FrameNumber()
	local entTable = self:GetTable()

	if entTable.LastSCKUpdate != frame then
		self:ApplySCKAnimations()
		self:RunHooks("UpdateSCK")
		self:UpdateSCK()

		entTable.LastSCKUpdate = frame
	end

	for _, element in ipairs(entTable.RenderOrder[tab]) do
		sg.SCK.DrawElement(self, tab, element, ent, flags, rendergroups, lod)
	end

	render.UpdateRefractTexture()
end

function SWEP:UpdateSCK()
end

local nullMaterial = Material("null")

function SWEP:PreDrawViewModel(vm, _, ply, flags)
	if self:RunHooks("ShouldHideViewModel") then
		return true
	end

	if not self.BoneCache then
		self:BuildBoneCache(vm)
	end

	-- By applying here...
	self:ApplyBoneMods(vm)

	if not self.ShowViewModel then
		render.MaterialOverride(nullMaterial)
	end
end

local opaque = {
	[RENDERGROUP_OPAQUE] = true,
	[RENDERGROUP_BOTH] = true
}

local translucent = {
	[RENDERGROUP_TRANSLUCENT] = true,
	[RENDERGROUP_BOTH] = true
}

function SWEP:PostDrawViewModel(vm, _, ply, flags)
	if not self.ShowViewModel then
		render.MaterialOverride(nil)
		ply:GetHands():DrawModel()
	end

	self:DrawSCKElements(self.VElements, vm, STUDIO_RENDER + STUDIO_TWOPASS, opaque)
	self:DrawSCKElements(self.VElements, vm, flags, translucent)

	-- ... and resetting here, we avoid ever running into issues where bones leak into other viewmodels
	self:ResetBoneMods(vm)
end

local null = Material("null")

function SWEP:DrawWorldModel(flags, isTranslucent)
	if not self.ShowWorldModel then
		render.MaterialOverride(null)
	end

	self:DrawModel(flags)

	render.MaterialOverride(nil)

	local rendergroups = isTranslucent and translucent or opaque
	local lod = ScrH() / render.ComputePixelDiameterOfSphere(self:GetPos(), 250)

	self:DrawSCKElements(self.WElements, self, flags, rendergroups, lod)
end

function SWEP:DrawWorldModelTranslucent(flags)
	self:DrawWorldModel(flags, true)
end
