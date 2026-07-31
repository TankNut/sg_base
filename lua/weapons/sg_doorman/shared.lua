AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "The Doorman"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger and watch those doors and windows make themselves."
SWEP.Purpose = "For when you want to make your own doors or windows. Premade ones are too mainstream."

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

SWEP.Accuracy = 28
SWEP.Range = 1000

SWEP.Delay = 0.115

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
	Reload = {Sound = "Weapon_AR2.Reload_Push"}
}

include("sh_model.lua")

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

if CLIENT then
	local defaultPos = SWEP.ViewModelBoneMods.Base.pos
	local lowerPos = Vector(-5.030, 0, -0.719)

	local defaultAng = SWEP.ViewModelBoneMods.Base.angle
	local lowerAng = Angle(36.647, 0, 19)

	local reloadAnim = {
		pos = {
			{0,       defaultPos},
			{10 / 48, lowerPos, math.ease.InOutSine},
			{36 / 48, lowerPos},
			{46 / 48, defaultPos, math.ease.InOutSine}
		},
		angle = {
			{0,       defaultAng},
			{12 / 48, lowerAng, math.ease.InOutSine},
			{36 / 48, lowerAng},
			{1,       defaultAng, math.ease.InOutSine}
		}
	}

	function SWEP:UpdateSCK()
		local cycle = self:IsReloading() and self:GetViewModel():GetCycle() or 0
		local base = self.ViewModelBoneMods.Base

		local anim = sg.Keyframe(cycle, reloadAnim)

		base.pos = anim.pos
		base.angle = anim.angle

		-- Required for changes to ViewModelBoneMods to apply
		self.InvalidateBoneMods = true
	end
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