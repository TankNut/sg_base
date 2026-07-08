AddCSLuaFile()

function SWEP:IsFinalBurstShot()
	local firemode = self:GetFiremode()

	return firemode > 1 and self:GetAttackCount() % firemode == 0
end
