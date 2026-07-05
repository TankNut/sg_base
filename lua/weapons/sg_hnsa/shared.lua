AddCSLuaFile()

SWEP.Base = "sg_base"

SWEP.UseHands = true
SWEP.ViewModel = Model("models/weapons/c_crossbow.mdl")
SWEP.WorldModel = Model("models/weapons/w_crossbow.mdl")

SWEP.Spawnable = true

include("cl_sck.lua")

if CLIENT then
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
end
