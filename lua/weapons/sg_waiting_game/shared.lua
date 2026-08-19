AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

SWEP.PrintName = "The Waiting Game"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to wait."
SWEP.Purpose = "For playing the waiting game with a clip full of hollow point rounds."

SWEP.Slot = 2

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = 200

-- HoldType
SWEP.HoldType = "smg"

-- Firemode
SWEP.Firemode = 1

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 30
SWEP.Force = sg.FORCE_DEFAULT

SWEP.Range = 1000

SWEP.Delay = 60 / 500

-- Traits
SWEP.Traits = {
	sg.Trait("SecondaryAim", {
		Zoom = 4,
		ZoomRange = true,
		Range = 1500,
		Firemode = 1,
		Offset = Vector(-6, 4, 0.5)
	}),
	sg.Trait("RecoilAdd", {Add = 0.75})
}

-- Recoil
SWEP.Recoil = {
	x = {0.25, 0.3},
	y = {0.2, 0.3}
}

SWEP.ViewPunch = 0.65
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_WaitingGame.Single1")
	self:EmitSound("Weapon_SG_WaitingGame.Single2")
end

function SWEP:OnReloadAnimation()
	self:EmitSound("Weapon_SMG1.Reload")
end

sound.Add({
	name = "Weapon_SG_WaitingGame.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {75, 85},
	sound = ")weapons/sg552/sg552-1.wav"
})

sound.Add({
	name = "Weapon_SG_WaitingGame.Single2",
	channel = CHAN_ITEM,
	volume = 0.7,
	level = sg.LEVEL_GUNFIRE,
	pitch = {80, 90},
	sound = ")weapons/g3sg1/g3sg1-1.wav"
})
