AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

SWEP.Base = "weapon_base"
SWEP.RenderGroup = RENDERGROUP_BOTH

SWEP.HoldType = "normal"

SWEP.AnimationRates = {}

include("cl_sck.lua")

include("sh_animations.lua")
include("sh_holdtypes.lua")
include("sh_traits.lua")

function SWEP:Initialize()
	self:SetHoldType(self:GetTargetHoldType())
	self:SetDeploySpeed(1)

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
	self:SetNextPrimaryFire(0)

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
	[15] = true -- AE_CL_PLAYSOUND
}

function SWEP:FireAnimationEvent(pos, ang, event, name)
	if eventBlacklist[event] then
		return true
	end
end

function SWEP:StartCommand(ply, cmd) self:RunHooks("StartCommand", nil, ply, cmd) end
function SWEP:SetupMove(ply, mv, cmd) self:RunHooks("SetupMove", nil, ply, mv, cmd) end
function SWEP:Move(ply, mv) self:RunHooks("Move", nil, ply, mv) end

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
