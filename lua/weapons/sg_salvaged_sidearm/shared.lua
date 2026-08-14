AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

SWEP.PrintName = "The Salvaged Sidearm"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to shred things apart with rounds made out of junk and rusted scrap."
SWEP.Purpose = "When you're trying to survive in a blasted hellscape and the only resources you have are rusted metal, rotted wood, and vain hope, fashioning those materials into a rusty pistol that thinks it's a minigun is a no-brainer."

SWEP.Slot = 1

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.ClipSize = 40
SWEP.Primary.DefaultClip = 200

-- HoldType
SWEP.HoldType = "pistol"

-- Firemode
SWEP.Firemode = 0

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 30
SWEP.Force = sg.FORCE_DEFAULT

SWEP.Range = 300

SWEP.Delay = 60 / 400

-- Traits
SWEP.Traits = {
	sg.Trait("RecoilAdd", {Add = 0.25})
}

-- Recoil
SWEP.Recoil = {
	x = {0.75, 0.9},
	y = {0.4, 0.5}
}

SWEP.ViewPunch = 0.75
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
	Reload = 1
}

include("sh_model.lua")

function SWEP:TranslateAnimation(name)
	local empty = name .. "_Empty"

	if self:Clip1() == 0 and self.Animations[empty] then
		return empty
	end
end

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_SalvagedSidearm.Single1")
	self:EmitSound("Weapon_SG_SalvagedSidearm.Single2")
end

function SWEP:OnReloadAnimation()
	self:EmitSound("Weapon_Pistol.Reload")
end

sound.Add({
	name = "Weapon_SG_SalvagedSidearm.Single1",
	channel = CHAN_WEAPON,
	volume = 0.3,
	level = sg.LEVEL_GUNFIRE,
	pitch = {130, 150},
	sound = "^weapons/aug/aug-1.wav"
})

sound.Add({
	name = "Weapon_SG_SalvagedSidearm.Single2",
	channel = CHAN_ITEM,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {75, 85},
	sound = ")weapons/smg1/smg1_fire1.wav"
})
