AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Aerosol AR"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to become an artist."
SWEP.Purpose = "For attempting to be artistic with your Graffitti in an extremely violent fashion."

SWEP.Slot = 3

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.ClipSize = 50
SWEP.Primary.DefaultClip = 250

-- HoldType
SWEP.HoldType = "smg"

-- Firemode
SWEP.Firemode = 0

-- Balance
SWEP.AmmoCost = 1
SWEP.Count = 1
SWEP.Damage = 15

SWEP.Accuracy = 24
SWEP.Range = 800

SWEP.Delay = 0.075

-- Recoil
SWEP.Recoil = {
	Min = Angle(0.7, -0.3),
	Max = Angle(0.8, 0.3)
}

SWEP.RecoilAdd = 0.75
SWEP.ViewPunch = 0.5
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")
include("sh_animations.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_Aerosol.Single1")
	self:EmitSound("Weapon_SG_Aerosol.Single2")
end

function SWEP:OnReloadAnimation()
	self:EmitSound("Weapon_SMG1.Reload")
end

sound.Add({
	name = "Weapon_SG_Aerosol.Single1",
	channel = CHAN_WEAPON,
	volume = 0.8,
	level = sg.LEVEL_GUNFIRE,
	pitch = {95, 100},
	sound = ")weapons/ak47/ak47-1.wav"
})

sound.Add({
	name = "Weapon_SG_Aerosol.Single2",
	channel = CHAN_ITEM,
	volume = 0.8,
	level = sg.LEVEL_GUNFIRE,
	pitch = {80, 85},
	sound = ")weapons/smg1/smg1_fire1.wav"
})
