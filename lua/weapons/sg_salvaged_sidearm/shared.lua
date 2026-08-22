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
SWEP.Primary.ClipSize = -1
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

SWEP.Range = 850

SWEP.Delay = 60 / 400

-- Traits
SWEP.Traits = {
	sg.Trait("Gatling", {
		Delay = 60 / 800,
		Range = 300,

		SpinupTime = 6,
		SpindownTime = 4,

		Barrels = 3,
		Element = "spin"
	}),
	sg.Trait("Heat", {
		ShotsToOverheat = 100,
		CoolingDelay = SWEP.Delay * 2,
		CoolingTime = 15
	})
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

-- Custom
SWEP.OverheatTimer = 2

include("sh_model.lua")
include("sh_animations.lua")

function SWEP:SetupDataTables()
	BaseClass.SetupDataTables(self)

	self:NetworkVar("Float", "FinishOverheat")
end

if SERVER then
	function SWEP:Explode()
		local ply = self:GetOwner()
		ply:DropWeapon()

		sg.Explosion(self:GetPos(), ply, 80, 16384)

		self:Remove()
	end

	function SWEP:PredictionThink()
		local finish = self:GetFinishOverheat()

		if finish != 0 and finish <= CurTime() then
			self:Explode()

			return
		end

		BaseClass.PredictionThink(self)
	end
end

function SWEP:ShouldAutoAttack()
	if self:GetOverheating() and self:HasEnoughAmmo() then
		return true
	end

	return BaseClass.ShouldAutoAttack(self)
end

function SWEP:OnOverheat()
	if self:GetOverheating() then
		return
	end

	self:SetFinishOverheat(CurTime() + self.OverheatTimer)
	self:EmitSound("/vehicles/v8/vehicle_rollover2.wav", 75, 100, 2, CHAN_STREAM)
end

function SWEP:GetOverheatFraction()
	local time = self:GetFinishOverheat()

	return sg.TimeFraction(time - self.OverheatTimer, time)
end

function SWEP:GetDelay()
	local default = BaseClass.GetDelay(self)

	if self:GetOverheating() then
		return Lerp(self:GetOverheatFraction(), default, 60 / 1600)
	end

	return default
end

function SWEP:OnPrimaryAnimation()
	self:EmitSound("Weapon_SG_SalvagedSidearm.Single1")
	self:EmitSound("Weapon_SG_SalvagedSidearm.Single2")
end

if CLIENT then
	local elements = {
		["barrel 1"] = 500,
		["barrel 1+"] = 500,
		["barrel 1++"] = 500,
		["engine"] = 2000,
		["connect"] = 300,
		["connect 2"] = 300,
		["lower spin engine"] = 2000,
		["receiver"] = 500}

	function SWEP:PreInitSCK()
		for element in pairs(elements) do
			local v = table.Copy(self.VElements[element])
			v.rel = element
			v.pos = vector_origin
			v.angle = angle_zero
			v.material = "model_color"
			v.surpresslightning = true
			v.renderorder = -1

			local w = table.Copy(self.WElements[element])
			w.rel = element
			w.pos = vector_origin
			w.angle = angle_zero
			w.material = "model_color"
			w.renderorder = -1

			self.VElements[element .. " heat"] = v
			self.WElements[element .. " heat"] = w
		end
	end

	function SWEP:UpdateSCK()
		local val = math.ease.InSine(self:GetHeat())

		for element, max in pairs(elements) do
			local color

			if self:GetOverheating() then
				color = sg.ColorTemperature(Lerp(self:GetOverheatFraction(), max, 10000))
				color.a = 100
			else
				local heat = sg.RemapC(val, 0, 1, 0, max)

				color = sg.ColorTemperature(heat)
				color.a = sg.RemapC(val, 0, 1, 0, 100)
			end

			self.VElements[element .. " heat"].color = color
			self.WElements[element .. " heat"].color = color
		end
	end

	local ammo = {
		Draw = true
	}

	function SWEP:CustomAmmoDisplay()
		ammo.PrimaryClip = self:Ammo1()
		ammo.PrimaryAmmo = self:GetHeat() * 100

		return ammo
	end
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
