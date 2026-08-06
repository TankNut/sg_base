AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Doorman"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger and watch those doors and windows make themselves."
SWEP.Purpose = "For when you want to make your own doors or windows. Existing ones are too mainstream."

SWEP.Slot = 2

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "ar2"
SWEP.Primary.ClipSize = 60
SWEP.Primary.DefaultClip = 240

-- HoldType
SWEP.HoldType = "ar2"

-- Firemode
SWEP.Firemode = 0

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 10

SWEP.Range = 450 -- Slight increase, would've been 428.571 otherwise

SWEP.Delay = 0.115

-- Traits
SWEP.Traits = {
	sg.Trait("SelfKnockback", {Force = 40})
}

-- Recoil
SWEP.Recoil = {
	Min = Angle(0.25, -0.25),
	Max = Angle(.3, .25)
}

SWEP.RecoilAdd = .9
SWEP.ViewPunch = 1
SWEP.RecoilFlip = false

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {
	Material = Material("effects/gunshiptracer"),
	Length = {128, 256},
	Scale = {0.5, 1.5}
}

include("sh_model.lua")
include("sh_animations.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_Doorman.Single1")
	self:EmitSound("Weapon_SG_Doorman.Single2")
end

function SWEP:DoImpactEffect(tr, dmg)
	if tr.HitSky then
		return
	end

	local effectdata = EffectData()
	effectdata:SetOrigin(tr.HitPos + tr.HitNormal)
	effectdata:SetNormal(tr.HitNormal)

	util.Effect("AR2Impact", effectdata)
end

sound.Add({
	name = "Weapon_SG_Doorman.Single1",
	channel = CHAN_WEAPON,
	volume = .75,
	level = sg.LEVEL_GUNFIRE,
	pitch = {120, 135},
	sound = ")weapons/smg1/smg1_fire1.wav"
})

sound.Add({
	name = "Weapon_SG_Doorman.Single2",
	channel = CHAN_ITEM,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {120, 135},
	sound = ")weapons/ar2/fire1.wav"
})
