AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "PRW Popcap"
SWEP.Category = "S&G Munitions"

SWEP.Slot = 1

SWEP.Spawnable = false

-- Ammo
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 40

-- HoldType
SWEP.HoldType = "revolver"

-- Firemode
SWEP.Firemode = 1

-- Balance
SWEP.AmmoCost = 1
SWEP.Count = 1
SWEP.Damage = 55

SWEP.Accuracy = 12
SWEP.Range = 2500

SWEP.Delay = 0.3

-- Recoil
SWEP.Recoil = {
	Min = Angle(0.3, -0.25),
	Max = Angle(0.4, 0.25)
}

SWEP.RecoilAdd = 0.1
SWEP.ViewPunch = 1
SWEP.RecoilFlip = false

-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

-- Animations
SWEP.AnimationRates = {
	Reload = 1.5
}

include("sh_model.lua")
include("sh_animations.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("arw_weapon_popcap_shoot")
end
