local TRAIT = {}

TRAIT.Add = 0.1 -- Adds this much to the recoil multiplier, normalized so slower firing weapons are affected more

-- Min and max caps
TRAIT.Min = -1 -- Avoid negative recoil
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
	ent:SetRecoilAdd(math.Clamp(self:GetMultiplier(ent) + self.Add * ent.Delay, self.Min, self.Max))
end

function TRAIT:Hook_MultiplyRecoil(ent, val)
	return val + self:GetMultiplier(ent)
end

sg.RegisterTrait("RecoilAdd", TRAIT)
