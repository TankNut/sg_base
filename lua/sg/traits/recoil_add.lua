local TRAIT = {}

TRAIT.Add = 0.1 -- Multiplies recoil by this amount per shot
TRAIT.Max = math.huge
TRAIT.Reset = 1 -- Time to reset

function TRAIT:SetupNetworkVars(ent)
	ent:NetworkVar("Float", "RecoilAdd")
end

function TRAIT:GetMultiplier(ent)
	local ct = CurTime()

	local start = ent:GetNextPrimaryFire()
	local diff = ct - start

	if diff < engine.TickInterval() then
		start = ct
	end

	local frac = 1 - math.Clamp(math.TimeFraction(start, start + self.Reset, ct), 0, 1)

	return ent:GetRecoilAdd() * frac
end

function TRAIT:Hook_PostFireWeapon(ent)
	ent:SetRecoilAdd(math.min(self:GetMultiplier(ent) + self.Add, self.Max))
end

function TRAIT:Hook_MultiplyRecoil(ent, val)
	return val + self:GetMultiplier(ent)
end

sg.RegisterTrait("RecoilAdd", TRAIT)
