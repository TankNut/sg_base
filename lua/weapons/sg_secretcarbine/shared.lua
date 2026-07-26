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

SWEP.Accuracy = 12
SWEP.Range = 2000

SWEP.Delay = 0.09

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
SWEP.TracerConfig = {}

-- Misc
SWEP.Animations = {
	Reload = {Sound = ""}
}

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_SecretCarbine.Single1")
	self:EmitSound("Weapon_SG_SecretCarbine.Single2")
end
include("sh_model.lua")

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

--[[Grixis here, this guy may need a bit of work. Muzzle realignment for sure at minimum. Also not really looking to keep
the standard ar2 reload anim for this and for any others that are based on this weapon, amongst others. We originally 
had it do a half-baked goldeneye-style anim where the weapon plays its holster anim, emits some reload sounds, then 
plays draw with a fresh clip after a bit. Not sure if that's optimal or if there's a better option. Open to ideas ofc.]]--