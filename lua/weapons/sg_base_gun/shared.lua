AddCSLuaFile()
DEFINE_BASECLASS("sg_base_weapon")

SWEP.Base = "sg_base_weapon"

-- Set these as you normally would
SWEP.Primary.Ammo = ""
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false

SWEP.Secondary.Ammo = ""
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false

-- Firemode
SWEP.Firemode = 0 -- 0 = full-auto, 1 = semi-auto, anything higher is burst fire
SWEP.AutoBurst = false -- If doing burst fire, let the weapon start a new burst without requiring the player to re-engage their fire button

SWEP.PumpAction = false -- Forces the weapon to play a pump animation between shots

-- Balance
SWEP.AmmoCost = 1 -- Amount of ammo it takes out of the clip when firing

SWEP.Count = 1 -- How many bullets are fired
SWEP.Damage = 11 -- Can be overwritten with SWEP:GetDamage
SWEP.Force = sg.FORCE_DEFAULT -- Check sh_enums.lua

SWEP.Range = 0 -- Distance to hit a roughly torso-sized target at, SWEP:GetRange for override

SWEP.Delay = 60 / 800 -- Can be overwritten through SWEP:GetDelay(), a value of -1 will use the animation delay instead
SWEP.BurstDelay = nil -- Ditto, if set this is used at the end of a burst instead of the normal delay

-- Traits
SWEP.Traits = {} -- See the list of traits and their options in lua/sg/traits

-- Recoil
SWEP.Recoil = { -- Can also be a single angle, but that's for direct use (alt-fire modes) more than anything
	x = {1, 1},
	y = {1, 1}
}

SWEP.ViewPunch = 0.4 -- Multiplier for the amount of offset that gets added to the player's view directly
SWEP.RecoilFlip = true -- Lets the recoil flip horizontally
SWEP.BurstRecoil = nil -- Multiplier when the weapon is in a burst

-- Reloading
SWEP.LoopingReload = false -- Your shotgun reloads, uses ReloadSingle
SWEP.UseReloadStart = true -- Used in conjunction with LoopingReload
SWEP.UseReloadFinish = true -- Used in conjunction with LoopingReload

SWEP.ReloadAmount = math.huge -- How much ammo can be reloaded per action
SWEP.PartialReloads = true -- Whether the weapon can be reloaded with less than SWEP.ReloadAmount available

-- Effects
SWEP.Tracer = 1 -- 1 tracer per X bullets
SWEP.TracerName = "sg_e_tracer" -- tracer effect
SWEP.TracerConfig = {} -- Used to configure the tracer effect

SWEP.MuzzleEffect = "" -- Muzzle effect
SWEP.MuzzleConfig = {} -- Used to configure the muzzle effect

if CLIENT then
	-- This should go into sh_model.lua
	SWEP.ViewModelOffset = Vector()
end

include("cl_hud.lua")
include("sh_attack.lua")
include("sh_effects.lua")
include("sh_recoil.lua")
include("sh_reload.lua")
include("sh_view.lua")

function SWEP:SetupDataTables()
	BaseClass.SetupDataTables(self)

	-- Firemode is a NetworkVar so we can freely edit it on the fly, e.g. toggling it with a right click
	self:NetworkVar("Int", "Firemode")

	-- Attack related
	self:NetworkVar("Int", "AttackCount")
	self:NetworkVar("Float", "FireDuration")
	self:NetworkVar("Float", "LastAttack")

	self:NetworkVar("Bool", "CanAttack")
	self:NetworkVar("Bool", "HasAttacked")

	self:NetworkVar("Bool", "ShouldPump")

	-- Reloading related
	self:NetworkVar("Float", "FinishReload")
	self:NetworkVar("Bool", "FirstReload")
	self:NetworkVar("Bool", "LastReload")
	self:NetworkVar("Bool", "CancelReload")

	-- Misc
	self:NetworkVar("Int", "TracerNum")

	if SERVER then
		self:SetFiremode(self.Firemode)
	end
end

function SWEP:Holster()
	if self:IsReloading() then
		self:AbortReload()
	end

	return true
end

function SWEP:UpdatePump()
	if not self:GetShouldPump() or self:IsReloading() then
		return
	end

	if self:GetNextPrimaryFire() <= CurTime() then
		self:SetNextPrimaryFire(CurTime() + self:PlayAnimation("Pump"))
		self:SetShouldPump(false)
	end
end

function SWEP:PredictionThink()
	self:RunHooks("Think")

	self:UpdateReload()
	self:UpdatePump()
	self:UpdateAttack()

	BaseClass.PredictionThink(self)
end

if CLIENT then
	function SWEP:HUDShouldDraw(hud)
		return self:RunHooks("HUDShouldDraw", nil, hud)
	end

	function SWEP:ConfigureTracer(effect)
		for k, v in pairs(self.TracerConfig) do
			if k == "BaseClass" then
				continue
			end

			effect[k] = v
		end
	end
end
