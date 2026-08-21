AddCSLuaFile()
DEFINE_BASECLASS("sg_base_weapon")

function SWEP:GetRecoilMultiplier()
	local val = 1

	if self.BurstRecoil and self:IsBurstFire() and not self:IsFinalBurstShot() then
		val = self.BurstRecoil
	end

	self:RunHooks("MultiplyRecoil", function(func)
		local override = func(val)

		if override != nil then
			val = override
		end
	end)

	return val
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
		local pitch = istable(recoil.x) and sharedRand(recoil.x[1], recoil.x[2]) or recoil.x
		local yaw = istable(recoil.y) and sharedRand(recoil.y[1], recoil.y[2]) or recoil.y

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
		recoil:Mul(mult)
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

	self:RunHooks("PostApplyRecoil")
end
