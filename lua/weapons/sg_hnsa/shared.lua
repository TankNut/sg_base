AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.UseHands = true
SWEP.ViewModel = Model("models/weapons/c_crossbow.mdl")
SWEP.WorldModel = Model("models/weapons/w_crossbow.mdl")

SWEP.Spawnable = true

SWEP.HoldType = "sniper"

SWEP.Primary.Ammo = "XBowBolt"
SWEP.Primary.ClipSize = 3
SWEP.Primary.DefaultClip = 3

SWEP.Delay = -1

if CLIENT then
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
end

include("cl_sck.lua")

function SWEP:GetIdleAnimation()
	return self:Clip1() == 0 and ACT_VM_FIDGET or ACT_VM_IDLE
end
