AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

SWEP.PrintName = "The Camper's Choice"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to wait."
SWEP.Purpose = "For playing the waiting game with a clip full of hollow point rounds."

SWEP.Slot = 2

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.ClipSize = 15
SWEP.Primary.DefaultClip = 120

-- HoldType
SWEP.HoldType = "ar2"

-- Firemode
SWEP.Firemode = 1

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 30
SWEP.Force = sg.FORCE_DEFAULT

SWEP.Range = 700

SWEP.Delay = 60 / 400

-- Traits
SWEP.Traits = {
	sg.Trait("Aiming", {
		Zoom = 4,
		ZoomRange = true,
		Range = 1300,
		Firemode = 1,
		Scoped = true,
		Offset = Vector(-6, 4, 0.5 )
	}),
	sg.Trait("AddRecoil", {Add = 1})
}

-- Recoil
SWEP.Recoil = {
	x = {0.275, 0.375},
	y = {0.1, 0.2}
}

SWEP.ViewPunch = 0.75
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")
include("sh_animations.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_CampersChoice.Single1")
	self:EmitSound("Weapon_SG_CampersChoice.Single2")
end

sound.Add({
	name = "Weapon_SG_CampersChoice.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {85, 95},
	sound = ")weapons/usp/usp_unsil-1.wav"
})

sound.Add({
	name = "Weapon_SG_CampersChoice.Single2",
	channel = CHAN_ITEM,
	volume = 0.5,
	level = sg.LEVEL_GUNFIRE,
	pitch = {80, 90},
	sound = ")weapons/aug/aug-1.wav"
})
