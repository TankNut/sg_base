AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

SWEP.PrintName = "The Straight Razor"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to shave your face."
SWEP.Purpose = "To use an old, rusted revolver with a disgusting looking blade to shave that hideous moustache you have."

SWEP.Slot = 1

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "357"
SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 32

-- HoldType
SWEP.HoldType = "revolver"

-- Firemode
SWEP.Firemode = 1

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 75
SWEP.Force = sg.FORCE_DEFAULT

SWEP.Range = 900

SWEP.Delay = 0.8

-- Traits
SWEP.Traits = {
	sg.Trait("RecoilAdd", {Add = 0.5})
}

-- Recoil
SWEP.Recoil = {
	x = {3, 5},
	y = {0.05, 0.25}
}

SWEP.ViewPunch = 0.8
SWEP.RecoilFlip = true
-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")
include("sh_animations.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_StraightRazor.Single1")
	self:EmitSound("Weapon_SG_StraightRazor.Single2")
end

sound.Add({
	name = "Weapon_SG_StraightRazor.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {80, 95},
	sound = ")weapons/357/357_fire2.wav"
})

sound.Add({
	name = "Weapon_SG_StraightRazor.Single2",
	channel = CHAN_ITEM,
	volume = 0.75,
	level = sg.LEVEL_GUNFIRE,
	pitch = {70, 80},
	sound = ")weapons/aug/aug-1.wav"
})

