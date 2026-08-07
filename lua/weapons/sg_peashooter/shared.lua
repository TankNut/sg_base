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
SWEP.Damage = 15.5

SWEP.Range = 750

SWEP.Delay = 0.08
SWEP.BurstDelay = SWEP.Delay * 2

-- Traits
SWEP.Traits = {
	sg.Trait("RecoilAdd", {Add = 0.8})
}

-- Recoil
SWEP.Recoil = {
	x = {0.25, 0.35},
	y = {-0.2, 0.2}
}

SWEP.ViewPunch = 0.4
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_PeaShooter.Single1")
	self:EmitSound("Weapon_SG_PeaShooter.Single2")
end

function SWEP:OnReloadAnimation()
	self:EmitSound("Weapon_SMG1.Reload")
end

-- Changed the level to 105, that's the default for gunshots and makes it audible at range
sound.Add({
	name = "Weapon_SG_PeaShooter.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {180, 195},
	sound = "^weapons/ar1/ar1_dist1.wav"
})

sound.Add({
	name = "Weapon_SG_PeaShooter.Single2",
	channel = CHAN_ITEM,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {200, 215},
	sound = ")weapons/pistol/pistol_fire2.wav"
})
