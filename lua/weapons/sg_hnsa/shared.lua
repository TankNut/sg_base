AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "HNSA"
SWEP.Category = "S&G Munitions"

SWEP.Spawnable = true

SWEP.HoldType = "sniper"

SWEP.Primary.Ammo = "XBowBolt"
SWEP.Primary.ClipSize = 1
SWEP.Primary.DefaultClip = 1

SWEP.Delay = -1

SWEP.AnimSounds = {
	Primary = "Weapon_Crossbow.Single",
	Reload = "Weapon_Crossbow.Reload"
}

include("sh_model.lua")

function SWEP:GetIdleAnimation()
	return self:Clip1() == 0 and ACT_VM_FIDGET or ACT_VM_IDLE
end
