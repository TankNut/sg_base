AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.UseHands = true
SWEP.ViewModel = Model("models/weapons/c_crossbow.mdl")
SWEP.WorldModel = Model("models/weapons/w_crossbow.mdl")

SWEP.Spawnable = true

SWEP.HoldType = "sniper"

if CLIENT then
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
end

include("cl_sck.lua")
