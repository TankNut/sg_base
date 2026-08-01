AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "Gretchen"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to check out a library book....with about three slugs being fired into the wall in front of you."
SWEP.Purpose = "For getting those annoying kids in the back corner to either check out a book or shut the hell up."

SWEP.Slot = 3

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.ClipSize = 8
SWEP.Primary.DefaultClip = 96

-- HoldType
SWEP.HoldType = "shotgun2"

-- Firemode
SWEP.Firemode = 1
SWEP.PumpAction = true

-- Balance
SWEP.AmmoCost = 1
SWEP.Count = 5
SWEP.Damage = 17

SWEP.Accuracy = 24
SWEP.Range = 850
SWEP.SpreadMod = Vector(1, 1)

SWEP.Delay = 0.2

-- Recoil
SWEP.Recoil = {
	Min = Angle(2, 0.5),
	Max = Angle(2.5, -0.5)
}

SWEP.RecoilAdd = 0
SWEP.ViewPunch = 0.75
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

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_Gretchen.Single1")
	self:EmitSound("Weapon_SG_Gretchen.Single2")
end

function SWEP:OnPumpAnimation()
	self:EmitSound("Weapon_SG.Pump")
end

function SWEP:OnReloadSingleAnimation()
	self:EmitSound("Weapon_M3.Insertshell")
end

sound.Add({
	name = "Weapon_SG_Gretchen.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {180, 195},
	sound = ")weapons/shotgun/shotgun_dbl_fire7.wav"
})

sound.Add({
	name = "Weapon_SG_Gretchen.Single2",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {170, 180},
	sound = ")weapons/g3sg1/g3sg1-1.wav"
})
