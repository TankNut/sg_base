AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Greaser"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger and make everything dirty."
SWEP.Purpose = "For giving things that are excessively clean a fine coat of grease and bullet holes."

SWEP.Slot = 2

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.ClipSize = 50
SWEP.Primary.DefaultClip = 175

-- HoldType
SWEP.HoldType = "smg"

-- Firemode
SWEP.Firemode = 0

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 17.5
SWEP.Force = sg.FORCE_DEFAULT

SWEP.Range = 400

SWEP.Delay = 0.1

-- Traits
SWEP.Traits = {
	sg.Trait("RecoilAdd", {Add = 0.75})
}

-- Recoil
SWEP.Recoil = {
	x = {0.4, 0.45},
	y = {-0.35, 0.35}
}

SWEP.ViewPunch = 0.75
SWEP.RecoilFlip = false

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")
include("sh_animations.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_Greaser.Single1")
	self:EmitSound("Weapon_SG_Greaser.Single2")
end

function SWEP:OnReloadAnimation()
	self:EmitSound("Weapon_SMG1.Reload")
end

sound.Add({
	name = "Weapon_SG_Greaser.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {140, 155},
	sound = ")weapons/p90/p90-1.wav"
})

sound.Add({
	name = "Weapon_SG_Greaser.Single2",
	channel = CHAN_ITEM,
	volume = .35,
	level = sg.LEVEL_GUNFIRE,
	pitch = {170, 180},
	sound = ")weapons/smg1/smg1_fire1.wav"
})
