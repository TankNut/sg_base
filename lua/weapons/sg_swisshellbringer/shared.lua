AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

SWEP.PrintName = "The Swiss Hellbringer"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull trigger for instant cheese making."
SWEP.Purpose = "For making your own cheese so you don't have to buy that other crap."

SWEP.Slot = 1

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.ClipSize = 25
SWEP.Primary.DefaultClip = 125

-- HoldType
SWEP.HoldType = "pistol"

-- Firemode
SWEP.Firemode = 0

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 12
SWEP.Force = sg.FORCE_DEFAULT

SWEP.Range = 666 -- Slightly concerning

SWEP.Delay = 0.0775

-- Traits
SWEP.Traits = {
	sg.Trait("RecoilAdd", {Add = 0.4})
}

-- Recoil
SWEP.Recoil = {
	x = {0.35, 0.45},
	y = {-0.2, 0.2}
}

SWEP.ViewPunch = 0.5
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")
include("sh_animations.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_SwissHellBringer.Single1")
end

function SWEP:OnReloadAnimation()
	self:EmitSound("Weapon_Pistol.Reload")
end

sound.Add({
	name = "Weapon_SG_SwissHellBringer.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {110, 125},
	sound = "^weapons/pistol/pistol_fire3.wav"
})
