AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Lawnmower"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to mow your lawn."
SWEP.Purpose = "For getting those unwanted patches of grass or neighborhood kids off your lawn."

SWEP.Slot = 3

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.ClipSize = 12
SWEP.Primary.DefaultClip = 72

-- HoldType
SWEP.HoldType = "shotgun2"

-- Firemode
SWEP.Firemode = 1
SWEP.PumpAction = true

-- Balance
SWEP.AmmoCost = 1
SWEP.Count = 6
SWEP.Damage = 15

SWEP.Accuracy = 26
SWEP.Range = 1000
SWEP.SpreadMod = Vector(2.25,2.25)
SWEP.Delay = 0.33

-- Recoil
SWEP.Recoil = {
	Min = Angle(1, 0.5),
	Max = Angle(3, 1)
}

SWEP.RecoilAdd = 0
SWEP.ViewPunch = .75
SWEP.RecoilFlip = false

-- Reloading
SWEP.LoopingReload = true
SWEP.UseReloadStart = true
SWEP.UseReloadFinish = true
SWEP.PumpAction = false

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
	self:EmitSound("Weapon_SG_Lawnmower.Single1")
end

-- Changed the level to 105, that's the default for gunshots and makes it audible at range
sound.Add({
	name = "Weapon_SG_Lawnmower.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = 105,
	pitch = {100, 125},
	sound = ")weapons/shotgun/shotgun_dbl_fire7.wav"
})
