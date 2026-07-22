AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

SWEP.Base = "weapon_base"

SWEP.HoldType = "normal"

SWEP.Animations = {
	Draw = ACT_VM_DRAW,

	Deploy = ACT_VM_DRAW,
	Idle = ACT_VM_IDLE,

	Primary = ACT_VM_PRIMARYATTACK,
	Secondary = ACT_VM_SECONDARYATTACK,
	Pump = ACT_SHOTGUN_PUMP,

	Reload = ACT_VM_RELOAD,
	ReloadStart = ACT_SHOTGUN_RELOAD_START,
	ReloadSingle = ACT_VM_RELOAD,
	ReloadFinish = ACT_SHOTGUN_RELOAD_FINISH
}

include("cl_sck.lua")

include("sh_animations.lua")
include("sh_holdtypes.lua")

function SWEP:Initialize()
	self:SetHoldType(self:GetTargetHoldType())
	self:SetDeploySpeed(1)

	if CLIENT then
		self.CSEnts = {}
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

function SWEP:OnRemove()
	if CLIENT then
		self:ClearCSEnts()
	end
end

function SWEP:Think()
	self:UpdateHoldType()

	if self:GetNextIdle() <= CurTime() then
		self:PlayAnimation("Idle")
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
