AddCSLuaFile()
DEFINE_BASECLASS("sg_base_weapon")

function SWEP:IsReloading()
	return self:GetFinishReload() != 0
end

local infiniteAmmo = sg.Convars.InfiniteAmmo

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
	if self:GetMaxClip1() == -1 then
		return false
	end

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

	if self:GetCancelReload() and not first and not self:GetLastReload() then
		return true
	end

	return false
end

function SWEP:AbortReload()
	self:PlayAnimation("Idle")

	self:SetFirstReload(false)
	self:SetLastReload(false)
	self:SetCancelReload(false)
	self:SetFinishReload(0)

	self:SetNextPrimaryFire(CurTime())
end

function SWEP:FinishReload()
	-- We're done, don't even bother with the rest
	if self:GetLastReload() then
		self:SetLastReload(false)
		self:SetFinishReload(0)

		return
	end

	local first = self:GetFirstReload()

	if first then -- Only reload if we've already done the intro animation
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

			if self.UseReloadFinish then
				self:SetLastReload(true)
				self:SetFinishReload(CurTime() + self:PlayAnimation("ReloadFinish"))
			else
				self:SetFinishReload(0)
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
