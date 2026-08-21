AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

SWEP.PrintName = "Henderson"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "PULL THE TRIGGER TO MOW DOWN EVERYTHING IN THE ROOM WITH AN UNTHINKABLY-POWERFUL LEADEN DEATH MACHINE."
SWEP.Purpose = "MUCKLED DAMRED CULTISTS! AIR YE NAMBLIES BE KEEPIN ME WEE MEN?!."

SWEP.Slot = 3

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.ClipSize = 20
SWEP.Primary.DefaultClip = 140

-- HoldType
SWEP.HoldType = "shotgun2"

-- Firemode
SWEP.Firemode = 0

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 8
SWEP.Damage = 10
SWEP.Force = sg.FORCE_SHOTGUN

SWEP.Range = 325

SWEP.Delay = 60 / 250

-- Traits
SWEP.Traits = {
	sg.Trait("Aiming", {
		Zoom = 1.5,
		ZoomRange = true,
		Firemode = 1,
		Offset = Vector(-6, 3, 1)
	}),
	sg.Trait("AddRecoil", {Add = 0.5})
}

-- Recoil
SWEP.Recoil = {
	x = {0.75, 1.5},
	y = {0.25, 0.5}
}

SWEP.ViewPunch = 0.75
SWEP.RecoilFlip = true

-- Reloading
SWEP.LoopingReload = true
SWEP.UseReloadStart = true
SWEP.UseReloadFinish = true

SWEP.ReloadAmount = 4

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_Henderson.Single1")
	self:EmitSound("Weapon_SG_Henderson.Single2")
end

function SWEP:OnPumpAnimation()
	self:EmitSound("Weapon_SG.Pump")
end

function SWEP:OnReloadSingleAnimation()
	self:EmitSound("Weapon_M3.Insertshell")
end

sound.Add({
	name = "Weapon_SG_Henderson.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {100, 120},
	sound = ")weapons/xm1014/xm1014-1.wav"
})

sound.Add({
	name = "Weapon_SG_Henderson.Single2",
	channel = CHAN_WEAPON,
	volume = .5,
	level = sg.LEVEL_GUNFIRE,
	pitch = {70, 85},
	sound = ")weapons/galil/galil-1.wav"
})

--[[Grixis's notes: In the process of doing another bone anim set for this guy, a little more in depth than the 3-frame set we did
for the Greaser. Even if we said fuckit and just did a faked reload by dropping the gun down for a second or two with some timed sounds,
that would be decent but otherwise I do wanna give some anims on this a shot at least.]]--
