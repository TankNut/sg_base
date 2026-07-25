AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Sleeping Pill"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull trigger to help your targets get to sleep."
SWEP.Purpose = "For helping with getting those pesky insomniacs to sleep better at night without all of the ruckus."

SWEP.Slot = 1

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.ClipSize = 18
SWEP.Primary.DefaultClip = 120

-- HoldType
SWEP.HoldType = "pistol"

-- Firemode
SWEP.Firemode = 1

-- Balance
SWEP.AmmoCost = 1
SWEP.Count = 1
SWEP.Damage = 25

SWEP.Accuracy = 12
SWEP.Range = 1250

SWEP.Delay = 0.06

-- Recoil
SWEP.Recoil = {
	Min = Angle(0.3, -0.25),
	Max = Angle(.4, .25)
}

SWEP.RecoilAdd = .1
SWEP.ViewPunch = 1
SWEP.RecoilFlip = false

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

-- Misc
SWEP.Animations = {
	Reload = {Sound = "weapons/pistol/pistol_reload1.wav"}
}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_Sleepingpill.Single1")
	self:EmitSound("Weapon_SG_Sleepingpill.Single2")
end

sound.Add({
	name = "Weapon_SG_Sleepingpill.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {95, 100},
	sound = ")weapons/usp/usp1.wav"
})

sound.Add({
	name = "Weapon_SG_Sleepingpill.Single2",
	channel = CHAN_ITEM,
	volume = .5,
	level = sg.LEVEL_GUNFIRE,
	pitch = {180, 200},
	sound = ")weapons/pistol/pistol_fire2.wav"
})

