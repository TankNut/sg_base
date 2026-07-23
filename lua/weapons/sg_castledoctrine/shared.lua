AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Castle Doctrine"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to defend your home (or wherever it is you're standing at the time of said trigger pull)."
SWEP.Purpose = "For keeping intruders, enemies, and solicitors as far away from your immediate area as possible."

SWEP.Slot = 3

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 60

-- HoldType
SWEP.HoldType = "shotgun2"

-- Firemode
SWEP.Firemode = 0
SWEP.PumpAction = true

-- Balance
SWEP.AmmoCost = 1
SWEP.Count = 15
SWEP.Damage = 9

SWEP.Accuracy = 24
SWEP.Range = 1000

SWEP.Delay = 0.4

-- Recoil
SWEP.Recoil = {
	Min = Angle(2, 0.5),
	Max = Angle(5, 1)
}

SWEP.RecoilAdd = 0
SWEP.ViewPunch = 0.4
SWEP.RecoilFlip = false

-- Reloading
SWEP.LoopingReload = true
SWEP.UseReloadStart = true
SWEP.UseReloadFinish = true

SWEP.ReloadAmount = 1

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

-- Misc
SWEP.Animations = {
	Pump = {Sound = "Weapon_SG.Pump"},
	ReloadSingle = {Sound = "Weapon_M3.Insertshell"}
}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_CastleDoctrine.Single1")
	self:EmitSound("Weapon_SG_CastleDoctrine.Single2")
end

sound.Add({
	name = "Weapon_SG_CastleDoctrine.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {90, 95},
	sound = ")weapons/shotgun/shotgun_dbl_fire7.wav"
})

sound.Add({
	name = "Weapon_SG_CastleDoctrine.Single2",
	channel = CHAN_ITEM,
	volume = 0.6,
	level = sg.LEVEL_GUNFIRE,
	pitch = {115, 135},
	sound = ")weapons/awp/awp1.wav"
})
