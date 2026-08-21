local TRAIT = {}

TRAIT.Add = 0.1 -- Adds this much spread per shot, normalized so slower firing weapons are affected more

-- Min and max caps
TRAIT.Min = -11 -- Avoid hitting 100% accuracy
TRAIT.Max = math.huge

TRAIT.Reset = 1 -- Time to reset

function TRAIT:SetupNetworkVars(ent)
	ent:NetworkVar("Float", "SpreadAdd")
end

function TRAIT:GetSpread(ent)
	local ct = CurTime()

	local start = ent:GetNextPrimaryFire()
	local diff = ct - start

	if diff < engine.TickInterval() then
		start = ct
	end

	local frac = 1 - sg.TimeFraction(start, start + self.Reset)

	return ent:GetSpreadAdd() * frac
end

function TRAIT:Hook_PostFireWeapon(ent)
	ent:SetSpreadAdd(math.Clamp(self:GetSpread(ent) + self.Add * ent.Delay, self.Min, self.Max))
end

function TRAIT:Hook_GetSpread(ent, val)
	return val + self:GetSpread(ent)
end

sg.RegisterTrait("AddSpread", TRAIT)
