local TRAIT = {}

TRAIT.Delay = nil -- Max fire rate
TRAIT.MinSpin = 0 -- Minimum spin amount (0-1) before the gun can fire
TRAIT.AllowSpin = false -- Whether the player can manually spin with +attack2
TRAIT.Ease = nil -- Specify a math.ease function to use for RPM, usually something like math.ease.InSine

TRAIT.SpinupTime = 0.75 -- Time it takes to hit max RPM
TRAIT.SpindownTime = 1.4 -- Time it takes to spin down from max RPM
TRAIT.SpindownDelay = 1 -- How long it takes before the weapon starts spinning down

TRAIT.MoveSpeed = nil -- Movement modifier

-- Visual settings
TRAIT.Barrels = 1 -- More barrels = slower rotation
TRAIT.Direction = Angle(0, 1, 0)

TRAIT.Element = nil -- Which elements to apply the rotations to

function TRAIT:Initialize(ent)
	if not self.Delay then
		self.Delay = ent.Delay
	end
end

function TRAIT:SetupNetworkVars(ent)
	ent:NetworkVar("Float", "SpinRate")
	ent:NetworkVar("Float", "LastSpin")

	ent:NetworkVar("Angle", "BarrelRotation")
end

function TRAIT:ShouldSpin(ent)
	local ply = ent:GetOwner()

	if ply:KeyDown(IN_ATTACK) then
		return true
	end

	if self.AllowSpin and ply:KeyDown(IN_ATTACK2) then
		return true
	end

	return false
end

function TRAIT:GetSpin(ent)
	return self.Ease and self.Ease(ent:GetSpinRate()) or ent:GetSpinRate()
end

function TRAIT:Hook_CanAttack(ent)
	if ent:IsReloading() then
		return
	end

	local fraction = math.Clamp(self:GetSpin(ent), 0, 1)

	if fraction < self.MinSpin then
		return false
	end
end

function TRAIT:Hook_GetDelay(ent, delay)
	return Lerp(self:GetSpin(ent), delay, self.Delay)
end

function TRAIT:Hook_Think(ent)
	if self:ShouldSpin(ent) then
		local spin = math.Approach(ent:GetSpinRate(), 1, (1 / self.SpinupTime) * FrameTime())

		ent:SetSpinRate(spin)
		ent:SetLastSpin(CurTime())
	elseif CurTime() - ent:GetLastSpin() > self.SpindownDelay then
		local spin = math.Approach(ent:GetSpinRate(), 0, (1 / self.SpindownTime) * FrameTime())

		ent:SetSpinRate(spin)
	end

	local spin = self:GetSpin(ent)
	local last = ent:GetLastAttack()

	-- Make sure we're always rotating at the minimum required speed so it looks correct
	local min = (1 - sg.TimeFraction(last, last + self.SpindownDelay)) * (1 / ent.Delay)
	min = min / self.Barrels

	local max = spin * (1 / self.Delay)
	local rate = (min + math.max(max - min, 0)) / self.Barrels * 360 * FrameTime()

	local ang = ent:GetBarrelRotation()
	ang:Add(self.Direction * rate)

	ent:SetBarrelRotation(ang)
end

function TRAIT:Hook_GetMoveSpeed(ent, val)
	if self.MoveSpeed then
		return Lerp(self:GetSpin(ent), val, self.MoveSpeed)
	end
end

if CLIENT then
	function TRAIT:Hook_UpdateSCK(ent)
		for _, element in ipairs({ent.VElements[self.Element], ent.WElements[self.Element]}) do
			if not element then continue end

			element.angle2 = ent:GetBarrelRotation()
		end
	end
end

sg.RegisterTrait("Gatling", TRAIT)
