local TRAIT = {}

-- The most restrictive value applies
TRAIT.Passive = nil -- Always applies
TRAIT.Reload = nil -- During reloads only
TRAIT.Attack = nil -- While firing
TRAIT.AttackDelay = 0 -- How long the attack slow lingers at full power
TRAIT.AttackDecay = 1 -- How long the attack slow takes to decay

function TRAIT:Hook_GetMoveSpeed(ent, val)
	if self.Attack != nil then
		local nextFire = ent:GetNextPrimaryFire() + engine.TickInterval()
		local fraction = sg.TimeFraction(nextFire + self.AttackDelay, nextFire + self.AttackDelay + self.AttackDecay)

		if fraction == 0 then
			val = self.Attack
		else
			val = Lerp(fraction, self.Attack, val)
		end
	elseif self.Reload != nil and ent:IsReloading() then
		val = self.Reload
	elseif self.Passive then
		val = self.Passive
	end

	return val
end

sg.RegisterTrait("MovementModifier", TRAIT)
