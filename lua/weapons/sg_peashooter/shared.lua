AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Pea Shooter"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to fire small pellets made of iron at high speeds into whatever you might be pointing at."
SWEP.Purpose = "For (silently) annoying your target to death with small (but painful) pellets."

SWEP.Slot = 2

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.ClipSize = 33
SWEP.Primary.DefaultClip = 198

-- HoldType
SWEP.HoldType = "smg"

-- Firemode
SWEP.Firemode = 3
SWEP.ForceBurst = true
SWEP.AutoBurst = true

-- Balance
SWEP.AmmoCost = 1
SWEP.Count = 1
SWEP.Damage = 10

SWEP.Spread = nil -- Not Yet Implemented

SWEP.Delay = 60 / 800
SWEP.BurstDelay = SWEP.Delay * 4

-- Recoil
SWEP.Recoil = {
	Min = Angle(0.25, 0.2),
	Max = Angle(0.35, 0.3)
}

SWEP.RecoilAdd = 0.08
SWEP.ViewPunch = 0.4
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

-- Misc
SWEP.Animations = {
	Reload = {Sound = "Weapon_SMG1.Reload"}
}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_PeaShooter.Single1")
	self:EmitSound("Weapon_SG_PeaShooter.Single2")
end

-- Changed the level to 105, that's the default for gunshots and makes it audible at range
sound.Add({
	name = "Weapon_SG_PeaShooter.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = 105,
	pitch = {180, 190},
	sound = "^weapons/ar1/ar1_dist1.wav"
})

sound.Add({
	name = "Weapon_SG_PeaShooter.Single2",
	channel = CHAN_ITEM,
	volume = 1,
	level = 105,
	pitch = {200, 210},
	sound = ")weapons/pistol/pistol_fire2.wav"
})
