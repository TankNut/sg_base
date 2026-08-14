AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

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
SWEP.Force = sg.FORCE_DEFAULT

SWEP.Range = 850 -- Slight decrease, would've been 857.142 otherwise

SWEP.Delay = 0.075

-- Traits
SWEP.Traits = {
	sg.Trait("RecoilAdd", {Add = 0.45})
}

-- Recoil
SWEP.Recoil = {
	x = {0.25, 0.25},
	y = {-0.2, 0.2}
}

SWEP.ViewPunch = 0.45
SWEP.RecoilFlip = false

-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_GrandPrize.Single1")
	self:EmitSound("Weapon_SG_GrandPrize.Single2")
end

function SWEP:OnReloadAnimation()
	self:EmitSound("Weapon_Pistol.Reload")
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
