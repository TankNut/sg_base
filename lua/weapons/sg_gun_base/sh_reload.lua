AddCSLuaFile()
DEFINE_BASECLASS("sg_base")

function SWEP:IsReloading()
	return self:GetFinishReload() != 0
end

function SWEP:CanReload()
	if self:Clip1() >= self.Primary.ClipSize then
		return false
	end

	if self:IsReloading() then
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

-- TODO: Make this into a convar later
local infiniteAmmo = true

function SWEP:FinishReload()
	local first = self:GetFirstReload()

	if first then
		self:SetFirstReload(false)
	else
		local amount = math.min(self.Primary.ClipSize - self:Clip1(), self.ReloadAmount)

		if not infiniteAmmo then
			local ply = self:GetOwner()

			amount = math.min(amount, ply:GetAmmoCount(self.Primary.Ammo))

			ply:RemoveAmmo(amount, self.Primary.Ammo)
		end

		if self.PumpAction and self:Clip1() == 0 then
			self:SetShouldPump(true)
		end

		self:SetClip1(self:Clip1() + amount)
	end

	if self.LoopingReload then
		if self:Clip1() >= self.Primary.ClipSize or (self:GetCancelReload() and not first) then
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
