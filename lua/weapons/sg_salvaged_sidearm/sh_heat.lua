AddCSLuaFile()
DEFINE_BASECLASS("sg_base_gun")

function SWEP:SetupDataTables()
	BaseClass.SetupDataTables(self)

	self:NetworkVar("Float", "Heat")

	self:NetworkVar("Bool", "Overheating")
	self:NetworkVar("Float", "FinishOverheat")
end

if SERVER then
	function SWEP:Explode()
		local ply = self:GetOwner()
		ply:DropWeapon()

		sg.Explosion(self:GetPos(), ply, 80, 16384)

		self:Remove()
	end
end

function SWEP:FireWeapon()
	BaseClass.FireWeapon(self)

	if not self:GetOverheating() then
		local heat = math.min(self:GetHeat() + (1 / self.ShotsToOverheat), 1)

		self:SetHeat(heat)

		if heat == 1 then
			self:SetFinishOverheat(CurTime() + self.OverheatTimer)
			self:EmitSound("/vehicles/v8/vehicle_rollover2.wav", 75, 100, 2, CHAN_STREAM)

			self:SetOverheating(true)
		end
	end
end

function SWEP:PredictionThink()
	if not self:GetOverheating() then
		local heat = self:GetHeat()

		if heat > 0 and CurTime() - self:GetLastAttack() > self.CoolingDelay then
			self:SetHeat(math.Approach(heat, 0, (1 / self.CoolingTime) * FrameTime()))
		end
	end

	if SERVER then
		local finish = self:GetFinishOverheat()

		if finish != 0 and finish <= CurTime() then
			self:Explode()

			return
		end
	end

	BaseClass.PredictionThink(self)
end

function SWEP:ShouldAutoAttack()
	if self:GetOverheating() and self:HasEnoughAmmo() then
		return true
	end

	return BaseClass.ShouldAutoAttack(self)
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

if CLIENT then
	local elements = {
		["barrel 1"] = 1000,
		["barrel 1+"] = 1000,
		["barrel 1++"] = 1000,
		["engine"] = 2000,
		["connect"] = 1000,
		["connect 2"] = 1000,
		["lower spin engine"] = 2000,
		["receiver"] = 1000
	}

	function SWEP:PreInitSCK()
		for element in pairs(elements) do
			local v = table.Copy(self.VElements[element])
			v.rel = element
			v.pos = vector_origin
			v.angle = angle_zero
			v.material = "model_color"
			v.renderorder = -1
			v.additive = true

			local w = table.Copy(self.WElements[element])
			w.rel = element
			w.pos = vector_origin
			w.angle = angle_zero
			w.material = "model_color"
			w.renderorder = -1
			w.additive = true

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
			else
				color = sg.ColorTemperature(sg.RemapC(val, 0, 1, 0, max))
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
