AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

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
SWEP.PumpAction = true

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 100
SWEP.Force = sg.FORCE_SNIPER

SWEP.Range = 400

SWEP.Delay = 0.3

-- Traits
SWEP.Traits = {
	sg.Trait("Aiming", {
		Zoom = {8, 20},
		ZoomRange = true,
		Range = 2000,
		Scoped = true,
		MoveSpeed = 0,
		Offset = Vector(-6, 4, 2),
	}),
	sg.Trait("Penetration")
}

-- Recoil
SWEP.Recoil = {
	x = 1,
	y = {0.1, 0.4}
}

SWEP.ViewPunch = 2
SWEP.RecoilFlip = false

-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer_smoke"
SWEP.TracerConfig = {}

SWEP.MuzzleEffect = "sg_e_muzzle_smg"
SWEP.MuzzleConfig = {
	Scale = 3
}

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
