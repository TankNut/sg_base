AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Swiss Hellbringer"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull trigger for instant cheese making."
SWEP.Purpose = "For making your own cheese so you don't have to buy that other crap."

SWEP.Slot = 1

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.ClipSize = 25
SWEP.Primary.DefaultClip = 125

-- HoldType
SWEP.HoldType = "pistol"

-- Firemode
SWEP.Firemode = 0

-- Balance
SWEP.AmmoCost = 1
SWEP.Count = 1
SWEP.Damage = 8

SWEP.Spread = nil -- Not Yet Implemented

SWEP.Delay = 60 / 700

-- Recoil
SWEP.Recoil = {
	Min = Angle(0.35, 0.3),
	Max = Angle(0.45, 0.4)
}

SWEP.RecoilAdd = 0.09
SWEP.ViewPunch = 0.5
SWEP.RecoilFlip = true

-- Effects
SWEP.Tracer = 1
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

-- Animations
SWEP.Animations = {
	Primary_Empty = sg.Animation.WeaponSequence(ACT_VM_DRYFIRE):AddEvent(0, "Callback", "OnPrimaryAnimation"),
	Idle_Empty = sg.Animation.WeaponSequence(ACT_VM_IDLE_EMPTY)
}

SWEP.AnimationRates = {
	Reload = 2
}

include("sh_model.lua")

function SWEP:TranslateAnimation(name)
	local empty = name .. "_Empty"

	if self:Clip1() == 0 and self.Animations[empty] then
		return empty
	end
end

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_SwissHellBringer.Single1")
end

function SWEP:OnReloadAnimation()
	self:EmitSound("Weapon_Pistol.Reload")
end

-- Changed the level to 105, that's the default for gunshots and makes it audible at range
sound.Add({
	name = "Weapon_SG_SwissHellBringer.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {110, 125},
	sound = "^weapons/pistol/pistol_fire3.wav"
})
