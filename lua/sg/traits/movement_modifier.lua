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
		local fraction = math.Clamp(math.TimeFraction(nextFire, nextFire + self.AttackDecay, CurTime()), 0, 1)

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

function TRAIT:Hook_StartCommand(ent, ply, cmd)
	local slow = self:GetSlow(ent)

	if slow == -1 then
		cmd:ClearMovement()
		cmd:RemoveKey(IN_JUMP)
	end
end

function TRAIT:Hook_SetupMove(ent, ply, mv, cmd)
	local slow = self:GetSlow(ent)
	if not slow or slow >= 1 then return end

	if slow >= 0.5 then
		mv:SetMaxClientSpeed(math.Remap(slow, 0.5, 1, ply:GetWalkSpeed(), ply:GetRunSpeed()))
	elseif slow >= 0 then
		mv:SetMaxClientSpeed(math.Remap(slow, 0, 0.5, ply:GetSlowWalkSpeed(), ply:GetWalkSpeed()))
	end
end

function TRAIT:Hook_Move(ent, ply, mv)
	local slow = self:GetSlow(ent)
	if not slow or slow <= 1 then return end

	-- Speed increase is based on non-sprint speed, but we might be sprinting faster anyways
	local speed = math.max(mv:GetMaxSpeed(), ply:GetWalkSpeed() * slow)

	mv:SetMaxSpeed(speed)
	mv:SetMaxClientSpeed(speed)
end

sg.RegisterTrait("MovementModifier", TRAIT)
