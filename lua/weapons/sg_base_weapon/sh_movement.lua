AddCSLuaFile()

local enable = sg.Convars.MovementModifiers

-- The following values are used:
-- -1: No movement at all
-- 0: SlowWalk (+alt walk)
-- 0.5: Walk (non-sprint)
-- 1: Sprint (normal movespeed)
-- 1+: Multiplies walk speed

-- The most restrictive value applies

function SWEP:GetMoveSpeed()
	if not enable:GetBool() then
		return 1
	end

	local val = 1

	self:RunHooks("GetMoveSpeed", function(func)
		local override = func(val)

		if override != nil and override < val then
			val = override
		end
	end)

	return val
end

function SWEP:StartCommand(ply, cmd)
	if self:GetMoveSpeed() == -1 then
		cmd:ClearMovement()
		cmd:RemoveKey(IN_JUMP)
	end

	self:RunHooks("StartCommand", nil, ply, cmd)
end

function SWEP:SetupMove(ply, mv, cmd)
	local speed = self:GetMoveSpeed()
	if speed >= 1 then return end

	if speed >= 0.5 then
		mv:SetMaxClientSpeed(math.Remap(speed, 0.5, 1, ply:GetWalkSpeed(), ply:GetRunSpeed()))
	elseif speed >= 0 then
		mv:SetMaxClientSpeed(math.Remap(speed, 0, 0.5, ply:GetSlowWalkSpeed(), ply:GetWalkSpeed()))
	end

	self:RunHooks("SetupMove", nil, ply, mv, cmd)
end

function SWEP:Move(ply, mv)
	local speed = self:GetMoveSpeed()
	if speed <= 1 then return end

	-- Speed increase is based on non-sprint speed, but we might be sprinting faster anyways
	speed = math.max(mv:GetMaxSpeed(), ply:GetWalkSpeed() * slow)

	mv:SetMaxSpeed(speed)
	mv:SetMaxClientSpeed(speed)

	self:RunHooks("Move", nil, ply, mv)
end
