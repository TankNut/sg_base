AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

SWEP.Base = "weapon_base"

SWEP.Animations = {
	Draw = ACT_VM_DRAW,

	Deploy = ACT_VM_DRAW,
	Idle = ACT_VM_IDLE,

	Primary = ACT_VM_PRIMARYATTACK,
	Secondary = ACT_VM_SECONDARYATTACK,

	Reload = ACT_VM_RELOAD,
	ReloadEmpty = ACT_VM_RELOAD,

	ReloadStart = ACT_VM_RELOAD,
	ReloadSingle = ACT_VM_RELOAD_INSERT,
	ReloadFinish = ACT_VM_RELOAD_END
}

include("cl_sck.lua")

include("sh_animations.lua")
include("sh_holdtypes.lua")

function SWEP:Initialize()
	self:SetHoldType(self:GetTargetHoldType())
	self:SetDeploySpeed(1)

	if CLIENT then
		self:InitSCK()
	end
end

function SWEP:SetupDataTables()
	self:NetworkVar("Float", "NextIdle")
end

function SWEP:OnReloaded()
	if CLIENT then
		self:InitSCK()
	end
end

function SWEP:Think()
	self:UpdateHoldType()
end
