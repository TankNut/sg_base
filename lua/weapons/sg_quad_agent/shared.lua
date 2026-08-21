AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

SWEP.PrintName = "The Quadruple Agent"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to betray people."
SWEP.Purpose = "To trick your enemies into thinking that your gun is both on their side and betraying you, when it's really the opposite."

SWEP.Slot = 1

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "357"
SWEP.Primary.ClipSize = 6
SWEP.Primary.DefaultClip = 32

-- HoldType
SWEP.HoldType = "revolver"

-- Firemode
SWEP.Firemode = 1

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 65
SWEP.Force = sg.FORCE_DEFAULT

SWEP.Range = 800

SWEP.Delay = 0.45

-- Traits
SWEP.Traits = {
	sg.Trait("Aiming", {
		Zoom = {4, 8},
		ZoomRange = true,
		Range = 1000,
		Scoped = true,
		Offset = Vector(-3, 1, 0.5)
	}),
	sg.Trait("AddRecoil", {Add = 0.5})
}

-- Recoil
SWEP.Recoil = {
	x = {0.5, 1},
	y = {-0.25, 0.25}
}

SWEP.ViewPunch = 1
SWEP.RecoilFlip = false

-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")
include("sh_animations.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_QuadAgent.Single1")
	self:EmitSound("Weapon_SG_QuadAgent.Single2")
end

sound.Add({
	name = "Weapon_SG_QuadAgent.Single1",
	channel = CHAN_WEAPON,
	volume = 0.2,
	level = sg.LEVEL_GUNFIRE,
	pitch = {150, 165},
	sound = ")weapons/scout/scout_fire-1.wav"
})

sound.Add({
	name = "Weapon_SG_QuadAgent.Single2",
	channel = CHAN_ITEM,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {140, 145},
	sound = ")weapons/p228/p228-1.wav"
})

--[[Grixis Notes: Still working on balancing this so values may look fucky. This one won't have breech loading in the end but 
feel free to use this as a test base for that if needed along with scoping once we get there too.]]
