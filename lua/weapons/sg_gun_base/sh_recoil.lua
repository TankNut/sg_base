AddCSLuaFile()

function SWEP:GetRecoilMultiplier()
	return self.RecoilAdd * self:GetAttackDuration()
end

function SWEP:AddRecoil(override)
	local ply = self:GetOwner()

	local recoil = override or self.Recoil
	local seed = self:EntIndex() .. ply:GetCurrentCommand():CommandNumber()
	local index = 0

	local function sharedRand(min, max)
		index = index + 1

		return util.SharedRandom(seed, min or 0, max or 1, index)
	end

	if istable(recoil) then
		local pitch = sharedRand(recoil.Min.p, recoil.Max.p)
		local yaw = sharedRand(recoil.Min.y, recoil.Max.y)

		recoil = Angle(pitch, yaw)
	else
		recoil = Angle(recoil)
	end

	if self.RecoilFlip and sharedRand() >= 0.5 then
		recoil.y = -recoil.y
	end

	local mult = self:GetRecoilMultiplier()

	if isangle(mult) then
		recoil.p = recoil.p + (recoil.p * mult.p)
		recoil.y = recoil.y + (recoil.y * mult.y)
	else
		recoil:Add(recoil * mult)
	end

	ply:ViewPunch(-recoil)

	if game.SinglePlayer() or (CLIENT and IsFirstTimePredicted()) then
		local punch = self.ViewPunch

		if isangle(punch) then
			recoil.p = recoil.p * punch.p
			recoil.y = recoil.y * punch.y
		else
			recoil:Mul(punch)
		end

		ply:SetEyeAngles(ply:EyeAngles() - recoil)
	end
end
