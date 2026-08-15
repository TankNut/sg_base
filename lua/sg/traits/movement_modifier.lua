local TRAIT = {}

-- For all of these modifiers, the following values are implemented:
-- -1: No movement at all
-- 0: SlowWalk (+alt walk)
-- 0.5: Walk (non-sprint)
-- 1: Sprint (normal movespeed)
-- 1+: Multiplies walk speed

-- The most restrictive value applies

TRAIT.Passive = nil -- Always applies
TRAIT.Reload = nil -- During reloads only
TRAIT.Attack = nil -- While firing
TRAIT.AttackDecay = 1 -- How long the attack slow takes to decay

function TRAIT:GetSlow(ent)
	local slow = math.huge

	if self.Passive != nil then
		slow = math.min(slow, self.Passive)
	end

	if self.Reload != nil and ent:IsReloading() then
		slow = math.min(slow, self.Reload)
	end

	if self.Attack != nil then
		local nextFire = ent:GetNextPrimaryFire() + engine.TickInterval()
		local fraction = sg.TimeFraction(nextFire, nextFire + self.AttackDecay)

		if fraction == 0 then
			slow = self.Attack
		else
			slow = math.min(slow, Lerp(fraction, math.max(self.Attack, 0), 1))
		end
	end

	if slow == math.huge then
		return nil
	end

	return slow
end

function TRAIT:Hook_GetMoveSpeed(ent, val)
	return self:GetSlow(ent)
end

sg.RegisterTrait("MovementModifier", TRAIT)
