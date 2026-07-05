AddCSLuaFile()

SWEP.Base = "weapon_base"

include("cl_sck.lua")

function SWEP:Initialize()
	if CLIENT then
		self:InitSCK()
	end
end

function SWEP:OnReloaded()
	if CLIENT then
		self:InitSCK()
	end
end
