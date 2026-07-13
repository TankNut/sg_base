AddCSLuaFile()
DEFINE_BASECLASS("sg_base")

SWEP.Base = "sg_base"

-- Set these as you normally would
SWEP.Primary.Ammo = ""
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false

SWEP.Secondary.Ammo = ""
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false

-- Firemode related
SWEP.Firemode = 0 -- 0 = full-auto, 1 = semi-auto, anything higher is burst fire
SWEP.ForceBurst = false -- If doing burst fire, force the player to keep firing
SWEP.AutoBurst = false -- If doing burst fire, let the weapon start a new burst without requiring the player to re-engage their fire button

SWEP.PumpAction = false -- Forces the weapon to play a pump animation between shots

-- Actual firing related
SWEP.AmmoCost = 1 -- Amount of ammo it takes out of the clip when firing
SWEP.Count = 1 -- How many bullets are fired
SWEP.Damage = 11

-- Delays
SWEP.Delay = 60 / 800 -- Can be overwritten through SWEP:GetDelay(), a value of -1 will use the animation delay instead
SWEP.BurstDelay = nil -- Ditto, if set this is used at the end of a burst instead of the normal delay

-- Reloading
SWEP.LoopingReload = false -- Your shotgun reloads, uses ReloadSingle
SWEP.UseReloadStart = true -- Used in conjunction with LoopingReload
SWEP.UseReloadFinish = true -- Used in conjunction with LoopingReload

SWEP.ReloadAmount = math.huge -- How much ammo can be reloaded per action

include("sh_attack.lua")
include("sh_reload.lua")

function SWEP:SetupDataTables()
	BaseClass.SetupDataTables(self)

	-- Firemode is a NetworkVar so we can freely edit it on the fly, e.g. toggling it with a right click
	self:NetworkVar("Int", "Firemode")

	-- Attack related
	self:NetworkVar("Int", "AttackCount")
	self:NetworkVar("Float", "AttackDuration")

	self:NetworkVar("Bool", "CanAttack")
	self:NetworkVar("Bool", "HasAttacked")

	self:NetworkVar("Bool", "ShouldPump")

	-- Reloading related
	self:NetworkVar("Float", "FinishReload")
	self:NetworkVar("Bool", "FirstReload")
	self:NetworkVar("Bool", "CancelReload")

	if SERVER then
		self:SetFiremode(self.Firemode)
	end
end

function SWEP:Think()
	self:UpdateReload()
	self:UpdateAttack()

	BaseClass.Think(self)
end
