AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Anti-Rifle"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to do....something with this Crossbow/Rifle Hybrid."
SWEP.Purpose = "For solving problems that rifles and crossbows can't solve alone."

SWEP.Slot = 3

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "Xbowbolt"
SWEP.Primary.ClipSize = 5
SWEP.Primary.DefaultClip = 15

-- HoldType
SWEP.HoldType = "sniper"

-- Firemode
SWEP.Firemode = 1

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 100
SWEP.Force = sg.FORCE_SNIPER

SWEP.Range = 2000

SWEP.Delay = 1.5

-- Traits
SWEP.Traits = {
	sg.Trait("SecondaryAim", {
		Zoom = {8, 20},
		ZoomRange = true,
		Scoped = true,
		Offset = Vector(-6, 4, 2)
	})
}

-- Recoil
SWEP.Recoil = {
	x = {0.3, 0.4},
	y = {0.025, 0.05}
}

SWEP.ViewPunch = 4
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")
include("sh_animations.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_AntiRifle.Single1")
	self:EmitSound("Weapon_SG_AntiRifle.Single2")
end

sound.Add({
	name = "Weapon_SG_AntiRifle.Single1",
	channel = CHAN_WEAPON,
	volume = 0.675,
	level = sg.LEVEL_GUNFIRE,
	pitch = {130, 150},
	sound = "^npc/env_headcrabcanister/launch.wav"
})

sound.Add({
	name = "Weapon_SG_AntiRifle.Single2",
	channel = CHAN_ITEM,
	volume = 0.5,
	level = sg.LEVEL_GUNFIRE,
	pitch = {80, 90},
	sound = ")weapons/awp/awp1.wav"
})

--[[Grixis's notes: Would like to explore whether bolting between shots is a thing for this. If there was also any weapon that may benefit from a penetration system, this would be it. Will also be getting anims + different reload sounds.]]--
