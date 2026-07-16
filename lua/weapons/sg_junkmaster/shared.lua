AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Junkmaster"
SWEP.Category = "S&G Munitions"

SWEP.Spawnable = true

SWEP.HoldType = "smg"

SWEP.Primary.Ammo = "smg1"
SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 180

SWEP.Delay = 60 / 800

SWEP.AnimSounds = {
	Reload = "Weapon_SMG1.Reload"
}

include("sh_sck.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_Junkmaster.Single1")
	self:EmitSound("Weapon_SG_Junkmaster.Single2")
end

-- Changed the level to 105, that's the default for gunshots and makes it audible at range
sound.Add({
	name = "Weapon_SG_Junkmaster.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = 105,
	pitch = {97, 103},
	sound = "weapons/ump45/ump45-1.wav"
})

sound.Add({
	name = "Weapon_SG_Junkmaster.Single2",
	channel = CHAN_ITEM,
	volume = 1,
	level = 105,
	pitch = {80, 85},
	sound = "weapons/mac10/mac10-1.wav"
})
