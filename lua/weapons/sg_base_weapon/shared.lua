AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

SWEP.Base = "weapon_base"
SWEP.RenderGroup = RENDERGROUP_BOTH

SWEP.HoldType = "normal"

SWEP.AnimationRates = {}

include("cl_sck.lua")

include("sh_animations.lua")
include("sh_attachments.lua")
include("sh_holdtypes.lua")
include("sh_movement.lua")
include("sh_traits.lua")

function SWEP:Initialize()
	self:SetHoldType(self:GetTargetHoldType())
	self:SetDeploySpeed(math.huge)

	self:InitAnimations()

	if CLIENT then
		self.BaseViewModelFOV = self.ViewModelFOV

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

	-- Happens way early so we can set up our NetworkVars
	self:InitTraits(true)
end

function SWEP:Deploy()
	self:SetNextPrimaryFire(CurTime() + self:PlayAnimation("Deploy"))

	return true
end

function SWEP:OnReloaded()
	self:SetWeaponHoldType(self:GetHoldType())

	self:InitTraits()
	self:InitAnimations()

	if CLIENT then
		self.BaseViewModelFOV = self.ViewModelFOV

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

	if GetPredictionPlayer():IsValid() then
		self:PredictionThink()
	end
end

function SWEP:PredictionThink()
	self:UpdateAnimations()
end

local eventBlacklist = {
	[15] = true, -- AE_CL_PLAYSOUND
	[21] = true, -- AE_MUZZLEFLASH
	[22] = true, -- AE_NPC_MUZZLEFLASH
	[5001] = true, -- CL_EVENT_MUZZLEFLASH0
	[5003] = true -- CL_EVENT_NPC_MUZZLEFLASH0
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
