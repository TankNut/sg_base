AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

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
SWEP.Damage = 8

SWEP.Spread = nil -- Not Yet Implemented

SWEP.Delay = 70 / 800

-- Tracers
SWEP.Tracer = 1
SWEP.TracerName = "tracer"

-- Recoil
SWEP.Recoil = {
	Min = Angle(0.35, 0.3),
	Max = Angle(0.45, 0.4)
}

SWEP.RecoilAdd = 0.09
SWEP.ViewPunch = .5
SWEP.RecoilFlip = true

-- Sounds
SWEP.AnimSounds = {
	Reload = "weapons/pistol/pistol_reload1.wav"
}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_SHB.Single1")
	self:EmitSound("Weapon_SG_SHB.Single2")
end

-- Changed the level to 105, that's the default for gunshots and makes it audible at range
sound.Add({
	name = "Weapon_SG_SwissHellBringer.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = 105,
	pitch = {110, 125},
	sound = "^weapons/pistol/pistol_fire3.wav"
})
