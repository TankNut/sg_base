AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

SWEP.Base = "sg_base_gun"

SWEP.PrintName = "The Lawnmower"
SWEP.Category = "S&G Munitions"

SWEP.Instructions = "Pull the trigger to mow your lawn."
SWEP.Purpose = "For getting those unwanted patches of grass or neighborhood kids off your lawn."

SWEP.Slot = 3

SWEP.Spawnable = true

-- Ammo
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.ClipSize = 12
SWEP.Primary.DefaultClip = 72

-- HoldType
SWEP.HoldType = "shotgun2"

-- Firemode
SWEP.Firemode = 1
SWEP.PumpAction = false

-- Balance
SWEP.AmmoCost = 1

SWEP.Count = 6
SWEP.Damage = 15
SWEP.Force = sg.FORCE_SHOTGUN

SWEP.Range = 275

SWEP.Delay = 0.33

-- Traits
SWEP.Traits = {}

-- Recoil
SWEP.Recoil = {
	x = {1, 3},
	y = {-1, 1}
}

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

SWEP.MuzzleEffect = "sg_e_muzzle_smg"
SWEP.MuzzleConfig = {}

include("sh_model.lua")

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_Lawnmower.Single1")
end

function SWEP:OnPumpAnimation()
	self:EmitSound("Weapon_SG.Pump")
end

function SWEP:OnReloadSingleAnimation()
	self:EmitSound("Weapon_M3.Insertshell")
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
	pitch = {100, 125},
	sound = ")weapons/shotgun/shotgun_dbl_fire7.wav"
})
