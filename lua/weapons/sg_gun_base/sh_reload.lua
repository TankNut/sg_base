AddCSLuaFile()
DEFINE_BASECLASS("sg_base")

function SWEP:IsReloading()
	return self:GetFinishReload() != 0
end

local infiniteAmmo = sg.InfiniteAmmo

function SWEP:HasEnoughReserveAmmo(amount)
	if infiniteAmmo:GetBool() then
		return true
	end

	return self:Ammo1() >= amount
end

function SWEP:GetReloadAmount()
	local amount = math.min(self:GetMaxClip1() - self:Clip1(), self.ReloadAmount)

	if not infiniteAmmo:GetBool() then
		amount = math.min(amount, self:Ammo1())
	end

	if not self.PartialReloads and amount < self.ReloadAmount then
		return 0
	end

	return amount
end

function SWEP:CanReload()
	if self:IsReloading() then
		return false
	end

	local amount = self:GetReloadAmount()

	if amount == 0 or not self:HasEnoughReserveAmmo(amount) then
		return false
	end

	return self:GetNextPrimaryFire() <= CurTime()
end

function SWEP:Reload()
	if not self:CanReload() then
		return
	end

	self:PlayWorldAnimation(PLAYER_RELOAD)

	local anim = "Reload"

	if self.LoopingReload and self.UseReloadStart then
		self:SetFirstReload(true)

		anim = "ReloadStart"
	elseif self.LoopingReload then
		anim = "ReloadSingle"
	end

	self:SetFinishReload(CurTime() + self:PlayAnimation(anim))
end

function SWEP:ShouldCancelReload(first)
	local amount = self:GetReloadAmount()

	if amount == 0 or not self:HasEnoughReserveAmmo(amount) then
		return true
	end

	if self:GetCancelReload() and not first then
		return true
	end

	if not self:HasEnoughReserveAmmo() then
		return true
	end

	return false
end

function SWEP:FinishReload()
	local first = self:GetFirstReload()

	if first then
		self:SetFirstReload(false)
	else
		local amount = math.min(self:GetMaxClip1() - self:Clip1(), self.ReloadAmount)

		if not infiniteAmmo:GetBool() then
			amount = math.min(amount, self:Ammo1())

			self:GetOwner():RemoveAmmo(amount, self.Primary.Ammo)
		end

		if self.PumpAction and self:Clip1() == 0 then
			self:SetShouldPump(true)
		end

		self:SetClip1(self:Clip1() + amount)
	end

	if self.LoopingReload then
		if self:ShouldCancelReload(first) then
			self:SetCancelReload(false)
			self:SetFinishReload(0)

			if self.UseReloadFinish then
				self:SetNextPrimaryFire(CurTime() + self:PlayAnimation("ReloadFinish"))
			else
				self:SetNextPrimaryFire(CurTime())
			end
		else
			self:SetFinishReload(CurTime() + self:PlayAnimation("ReloadSingle"))
		end
	else
		self:SetFinishReload(0)
	end
end

function SWEP:UpdateReload()
	local reload = self:GetFinishReload()

	if reload > 0 and reload <= CurTime() then
		self:FinishReload()
	end
end
