AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Rainmaker"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Do a Zimbabwean rain dance while holding this gun and watch the storm arrive."
SWEP.Purpose = "Perfect for when you feel like having a nice storm."

SWEP.Slot = 2

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.ClipSize = 31
SWEP.Primary.DefaultClip = 186

-- HoldType
SWEP.HoldType = "smg"

-- Firemode
SWEP.Firemode = 0

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 15

SWEP.Range = 1000 -- Slight decrease, would've been 1028.571 otherwise

SWEP.Delay = 0.09

-- Recoil
SWEP.Recoil = {
	Min = Angle(0.35, -0.2),
	Max = Angle(0.45, 0.2)
}

SWEP.RecoilAdd = 0.85
SWEP.ViewPunch = 0.35
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_rainmaker.Single1")
	self:EmitSound("Weapon_SG_rainmaker.Single2")
end

function SWEP:OnReloadAnimation()
	self:EmitSound("Weapon_SMG1.Reload")
end

sound.Add({
	name = "Weapon_SG_rainmaker.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {75, 85},
	sound = ")weapons/ar2/fire1.wav"
})

sound.Add({
	name = "Weapon_SG_rainmaker.Single2",
	channel = CHAN_ITEM,
	volume = 0.25,
	level = sg.LEVEL_GUNFIRE,
	pitch = {80, 90},
	sound = ")weapons/m4a1/m4a1_unsil-1.wav"
})
