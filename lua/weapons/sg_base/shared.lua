AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

SWEP.Base = "weapon_base"
SWEP.RenderGroup = RENDERGROUP_BOTH

SWEP.HoldType = "normal"

include("cl_sck.lua")

include("sh_animations.lua")
include("sh_holdtypes.lua")

function SWEP:Initialize()
	self:SetHoldType(self:GetTargetHoldType())
	self:SetDeploySpeed(1)

	self:InitAnimations()

	if CLIENT then
		self.InitialViewModelFOV = self.ViewModelFOV

		self.CSEnts = {}
		self:InitSCK()
	end
end

function SWEP:SetupDataTables()
	self:NetworkVar("String", "AnimationName")

	-- What cycle were we last at?
	self:NetworkVar("Float", "LastCycle")

	-- Start/end of the current animation
	self:NetworkVar("Float", "AnimationStart")
	self:NetworkVar("Float", "AnimationEnd")
end

function SWEP:OnReloaded()
	self:SetWeaponHoldType(self:GetHoldType())
	self:InitAnimations()

	if CLIENT then
		self:InitSCK()
	end
end

function SWEP:OnRemove()
	if CLIENT then
		self:ClearCSEnts()
	end
end

function SWEP:Think()
	self:UpdateHoldType()
	self:UpdateAnimations()
end

local eventBlacklist = {
	[15] = true -- AE_CL_PLAYSOUND
}

function SWEP:FireAnimationEvent(pos, ang, event, name)
	if eventBlacklist[event] then
		return true
	end
end

-- Helper functions
function SWEP:ConCommand(str)
	local ply = self:GetOwner()

	if not ply:IsPlayer() then
		return
	end

	ply:ConCommand(str)
end

function SWEP:GetViewModel(index)
	return self:GetOwner():GetViewModel(index)
end
