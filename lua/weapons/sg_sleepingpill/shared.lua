AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

SWEP.PrintName = "The Sleeping Pill"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull trigger to help your targets get to sleep."
SWEP.Purpose = "For helping with getting those pesky insomniacs to sleep better at night without all of the ruckus."

SWEP.Slot = 1

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.ClipSize = 18
SWEP.Primary.DefaultClip = 120

-- HoldType
SWEP.HoldType = "pistol2"

-- Firemode
SWEP.Firemode = 1

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 1
SWEP.Damage = 25
SWEP.Force = sg.FORCE_DEFAULT

SWEP.Range = 1250

SWEP.Delay = 60 / 1000

-- Traits
SWEP.Traits = {
	sg.Trait("Aiming", {
		Zoom = 2,
		ZoomRange = true,
		Offset = Vector(-2, 2, 2)
	}),
	sg.Trait("AddRecoil", {Add = 0.1})
}

-- Recoil
SWEP.Recoil = {
	x = {0.3, 0.4},
	y = {-0.25, 0.25}
}

SWEP.ViewPunch = 1
SWEP.RecoilFlip = false

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_Sleepingpill.Single1")
	self:EmitSound("Weapon_SG_Sleepingpill.Single2")
end

function SWEP:OnReloadAnimation()
	self:EmitSound("Weapon_Pistol.Reload")
end

if CLIENT then
	local ammoColor = Color(255, 0, 0)

	local startUnload = 8 / 44
	local finishUnload = 14 / 44

	local startLoad = 19 / 44
	local finishLoad = 25 / 44

	local infiniteAmmo = sg.Convars.InfiniteAmmo

	function SWEP:DrawAmmoCounter()
		local clip = self:Clip1()
		local y = 123

		if self:IsReloading() then
			local cycle = self:GetAnimationCycle()

			if cycle < finishUnload then
				local interp = math.Round(sg.RemapC(cycle, startUnload, finishUnload, self.Primary.ClipSize, 0))

				clip = math.min(interp, clip)
			elseif cycle < startLoad then
				clip = 0
			else
				local interp = math.Round(sg.RemapC(cycle, startLoad, finishLoad, 0, self.Primary.ClipSize))
				local ammo = infiniteAmmo:GetBool() and math.huge or self:Ammo1()

				clip = math.min(interp, clip + ammo)
			end
		end

		draw.SimpleText(clip, "SG_Ammo", -30, 0, ammoColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		for i = 0, self:GetMaxClip1() - 1 do
			if i < clip then
				surface.SetDrawColor(200, 0, 0)
			else
				surface.SetDrawColor(40, 40, 40)
			end

			surface.DrawRect(133, y, 50, 8)
			y = y - 15
		end
	end
end

sound.Add({
	name = "Weapon_SG_Sleepingpill.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {95, 100},
	sound = ")weapons/usp/usp1.wav"
})

sound.Add({
	name = "Weapon_SG_Sleepingpill.Single2",
	channel = CHAN_ITEM,
	volume = 0.5,
	level = sg.LEVEL_GUNFIRE,
	pitch = {180, 200},
	sound = ")weapons/pistol/pistol_fire2.wav"
})

