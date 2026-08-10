AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Secret Carbine"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to keep your secrets safe."
SWEP.Purpose = "For making sure your dirty secrets actually stay secret. Secretly."

SWEP.Slot = 2

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "ar2"
SWEP.Primary.ClipSize = 35
SWEP.Primary.DefaultClip = 175

-- HoldType
SWEP.HoldType = "ar2"

-- Firemode
SWEP.Firemode = 0

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 15
SWEP.Force = sg.FORCE_DEFAULT

SWEP.Range = 2000

SWEP.Delay = 0.09

-- Traits
SWEP.Traits = {
	sg.Trait("SecondaryAim", {
		Zoom = 2,
		ZoomRange = true,
		Offset = Vector(-7, 5, 1.5)
	}),
	sg.Trait("RecoilAdd", {Add = 0.9})
}

-- Recoil
SWEP.Recoil = {
	x = {0.25, 0.3},
	y = {-0.25, 0.25}
}

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
	self:EmitSound("Weapon_SG_SecretCarbine.Single1")
	self:EmitSound("Weapon_SG_SecretCarbine.Single2")
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
	name = "Weapon_SG_SecretCarbine.Single1",
	channel = CHAN_WEAPON,
	volume = .75,
	level = sg.LEVEL_GUNFIRE,
	pitch = {180, 190},
	sound = ")weapons/ar2/fire1.wav"
})

sound.Add({
	name = "Weapon_SG_SecretCarbine.Single2",
	channel = CHAN_ITEM,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {100, 110},
	sound = ")weapons/m4a1/m4a1-1.wav"
})
