AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The BFHMG"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "PULL THE TRIGGER TO OVERCOMPENSATE."
SWEP.Purpose = "THAT IS A BIG FRIGGING GUN, JESUS CHRIST."

SWEP.Slot = 2

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "ar2"
SWEP.Primary.ClipSize = 75
SWEP.Primary.DefaultClip = 225

-- HoldType
SWEP.HoldType = "ar2"

-- Firemode
SWEP.Firemode = 0

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 30

SWEP.Range = 450

SWEP.Delay = 0.135

-- Traits
SWEP.Traits = {
	sg.Trait("SelfKnockback", {Force = 43}),
	sg.Trait("RecoilAdd", {Add = 0.4})
}

-- Recoil
SWEP.Recoil = {
	Min = Angle(0.20, 0.15),
	Max = Angle(0.25, 0.25)
}

SWEP.ViewPunch = 1
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {
	Length = {128, 256},
	Scale = {0.5, 1.5}
}

include("sh_model.lua")
include("sh_animations.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_BFHMG.Single1")
	self:EmitSound("Weapon_SG_BFHMG.Single2")
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
	name = "Weapon_SG_BFHMG.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {75, 95},
	sound = ")weapons/m249/m249-1.wav"
})

sound.Add({
	name = "Weapon_SG_BFHMG.Single2",
	channel = CHAN_ITEM,
	volume = .5,
	level = sg.LEVEL_GUNFIRE,
	pitch = {75, 95},
	sound = ")weapons/m4a1/m4a1_unsil-1.wav"
})


--[[Grixis's notes: Not a ton of work that has to be done on this one, mostly balancing. I would like to explore letting this thing
do classic sighting (i.e. pulling the gun close but not actually using the iron sights) and maybe having that reduce how much knockback and
recoil the gun does but otherwise this thing's fine in the short term.]]--
