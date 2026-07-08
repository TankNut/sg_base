AddCSLuaFile()
DEFINE_BASECLASS("sg_base")

SWEP.Base = "sg_base"

SWEP.Primary.Ammo = "XBowBolt"
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1

SWEP.Secondary.Ammo = ""
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false

SWEP.Firemode = 0 -- 0 = full-auto, 1 = semi-auto, anything higher is burst fire
SWEP.ForceBurst = false -- If doing burst fire, force the player to keep firing
SWEP.AutoBurst = false -- If doing burst fire, let the weapon start a new burst without requiring the player to re-engage their fire button

SWEP.AmmoCost = 1 -- Amount of ammo it takes out of the clip when firing
SWEP.Count = 1 -- How many bullets are fired
SWEP.Damage = 11

SWEP.Delay = 60 / 800 -- Can be overwritten through SWEP:GetDelay(), a value of -1 will use the animation delay instead
SWEP.BurstDelay = nil -- Ditto, if set this is used at the end of a burst instead of the normal delay

include("sh_attack.lua")
include("sh_helpers.lua")

function SWEP:SetupDataTables()
	BaseClass.SetupDataTables(self)

	-- Firemode is a NetworkVar so we can freely edit it on the fly, e.g. toggling it with a right click
	self:NetworkVar("Int", "Firemode")

	self:NetworkVar("Int", "AttackCount")
	self:NetworkVar("Float", "AttackDuration")

	self:NetworkVar("Bool", "CanAttack")
	self:NetworkVar("Bool", "HasAttacked")

	if SERVER then
		self:SetFiremode(self.PrimaryConfig.Firemode)
	end
end

function SWEP:Think()
	self:UpdateAttack()

	BaseClass.Think(self)
end
