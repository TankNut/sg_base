AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Grand Prize"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull trigger to enter for a chance to win!"
SWEP.Purpose = "To give your enemies the grand prize of a small caliber round to the head and/or body."

SWEP.Slot = 1

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.ClipSize = 15
SWEP.Primary.DefaultClip = 125

-- HoldType
SWEP.HoldType = "pistol"

-- Firemode
SWEP.Firemode = 1

-- Balance
SWEP.AmmoCost = 1
SWEP.Count = 1
SWEP.Damage = 22

SWEP.Accuracy = 14
SWEP.Range = 1000

SWEP.Delay = 0.075

-- Recoil
SWEP.Recoil = {
	Min = Angle(0.25, 0.2),
	Max = Angle(0.25, -0.2)
}

SWEP.RecoilAdd = 0.45
SWEP.ViewPunch = 0.45
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

-- Misc
SWEP.Animations = {
	Reload = {Sound = "weapons/pistol/pistol_reload1.wav"}
}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_GrandPrize.Single1")
	self:EmitSound("Weapon_SG_GrandPrize.Single2")
end

sound.Add({
	name = "Weapon_SG_GrandPrize.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {110, 125},
	sound = ")weapons/pistol/pistol_fire2.wav"
})
sound.Add({
	name = "Weapon_SG_GrandPrize.Single2",
	channel = CHAN_ITEM,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {110, 125},
	sound = ")weapons/p228/p228-1.wav"
})