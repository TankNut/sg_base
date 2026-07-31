AddCSLuaFile()
DEFINE_BASECLASS("sg_gun_base")

SWEP.Base = "sg_gun_base"

SWEP.PrintName = "Gretchen"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to check out a library book....with about three slugs being fired into the wall in front of you."
SWEP.Purpose = "For getting those annoying kids in the back corner to either check out a book or shut the hell up."

SWEP.Slot = 3

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.ClipSize = 8
SWEP.Primary.DefaultClip = 96

-- HoldType
SWEP.HoldType = "shotgun2"

-- Firemode
SWEP.Firemode = 1
SWEP.PumpAction = true

-- Balance
SWEP.AmmoCost = 1
SWEP.Count = 5
SWEP.Damage = 18

SWEP.Accuracy = 24
SWEP.Range = 850
SWEP.SpreadMod = Vector(1, 1)

SWEP.Delay = 0.2

-- Recoil
SWEP.Recoil = {
	Min = Angle(2, 0.5),
	Max = Angle(2.5, -0.5)
}

SWEP.RecoilAdd = 0
SWEP.ViewPunch = 0.75
SWEP.RecoilFlip = false

-- Reloading
SWEP.LoopingReload = true
SWEP.UseReloadStart = true
SWEP.UseReloadFinish = true

SWEP.ReloadAmount = 1

-- Effects
SWEP.Tracer = 3
SWEP.TracerName = "sg_e_tracer"
SWEP.TracerConfig = {}

-- Misc
SWEP.Animations = {
	Pump = {Sound = "Weapon_SG.Pump"},
	ReloadSingle = {Sound = "Weapon_M3.Insertshell"}
}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_Lawnmower.Single1")
	self:EmitSound("Weapon_SG_Lawnmower.Single2")
end

if CLIENT then
	local ammoColor = Color(255, 255, 0)

	function SWEP:DrawAmmoCounter()
		local fraction = self:Clip1() / self:GetMaxClip1()

		ammoColor.r = (1 - fraction) * 255
		ammoColor.g = fraction * 255

		draw.SimpleText(self:Clip1(), "SG_Ammo", 0, 0, ammoColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	surface.CreateFont("SG_Lawnmower_Ammo2", {
		font = "Trebuchet MS",
		size = 200,
		weight = 900,
		antialias = true,
		scanlines = 0,
		blursize = 2
	})

	local reserveColor = Color(60, 70, 40)

	function SWEP:DrawReserveCounter()
		surface.SetDrawColor(60, 70, 40, 150)

		sg.DrawCircle(-205, -85, 20, 20)

		for x = -220, 210, 50 do
			surface.DrawRect(x, 90, 40, 20)
		end

		reserveColor.a = 50

		draw.SimpleText("0000", "SG_Lawnmower_Ammo2", 188, 0, reserveColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)

		reserveColor.a = 255

		draw.SimpleText(math.min(self:Ammo1(), 9999), "SG_Lawnmower_Ammo2", 188, 0, reserveColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
	end

	function SWEP:DrawReadyScreen()
		if self:Clip1() > 0 then
			surface.SetDrawColor(0, 200, 0)
		else
			surface.SetDrawColor(200, 0, 0)
		end

		surface.DrawRect(-38, -25, 80, 50)
	end
end

sound.Add({
	name = "Weapon_SG_Lawnmower.Single1",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {180, 195},
	sound = ")weapons/shotgun/shotgun_dbl_fire7.wav"
})

sound.Add({
	name = "Weapon_SG_Lawnmower.Single2",
	channel = CHAN_WEAPON,
	volume = 1,
	level = sg.LEVEL_GUNFIRE,
	pitch = {170, 180},
	sound = ")weapons/g3sg1/g3sg1-1.wav"
})