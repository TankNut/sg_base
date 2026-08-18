AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

SWEP.PrintName = "The Hide n' Seek Advanced"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to achieve victory."
SWEP.Purpose = "What's that? Neighborhood kids are way too good at hide and seek? Not when you're carrying this rifle around, they're not."

SWEP.Slot = 3

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "Xbowbolt"
SWEP.Primary.ClipSize = 10
SWEP.Primary.DefaultClip = 30

-- HoldType
SWEP.HoldType = "sniper"

-- Firemode
SWEP.Firemode = 1

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 75
SWEP.Force = sg.FORCE_DEFAULT

SWEP.Range = 550

SWEP.Delay = 0.4

-- Traits
SWEP.Traits = {
	sg.Trait("SecondaryAim", {
		Zoom = {4, 10},
		ZoomRange = true,
		Range = 1000,
		Scoped = true,
		Offset = Vector(-6, 4, 2)
	}),
	sg.Trait("RecoilAdd", {Add = 5})
}

-- Recoil
SWEP.Recoil = {
	x = {0.01, 0.04},
	y = {0.025, 0.05}
}

SWEP.ViewPunch = 1.3
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_HNSA.Single1")
	self:EmitSound("Weapon_SG_HNSA.Single2")
end

sound.Add({
	name = "Weapon_SG_HNSA.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {130, 150},
	sound = ")weapons/tmp/tmp-1.wav"
})

sound.Add({
	name = "Weapon_SG_HNSA.Single2",
	channel = CHAN_ITEM,
	volume = 0.5,
	level = sg.LEVEL_GUNFIRE,
	pitch = {100, 120},
	sound = "^npc/sniper/echo1.wav"
})
