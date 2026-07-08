AddCSLuaFile()
DEFINE_BASECLASS("sg_base")

function SWEP:CanAttack()
	return true
end

function SWEP:UpdateBurst()
	local firemode = self:GetFiremode()

	if firemode == 0 or self.AutoBurst then
		self.Primary.Automatic = true
	else
		self.Primary.Automatic = not self:IsFinalBurstShot()
	end
end

function SWEP:GetDelay()
	if self.BurstDelay != nil and self:IsFinalBurstShot() then
		return self.BurstDelay
	end

	return self.Delay
end

function SWEP:PrimaryAttack()
	if not self:CanAttack() then
		return
	end

	self:SetAttackCount(self:GetAttackCount() + 1)
	self:UpdateBurst()

	self:FireWeapon()

	local anim = self:PlayAnimation("Attack")
	local delay = self:GetDelay()

	if delay == -1 then
		delay = anim
	end

	self:SetAttackDelay(delay)
	self:SetHasAttacked(true)

	if self:GetAttackDuration() == 0 then
		self:OnStartAttack()
	end
end

function SWEP:FireWeapon()
end

function SWEP:SecondaryAttack()
end

-- Gets called when a player starts attacking
function SWEP:OnStartAttack()
end

-- Called when the player stops attacking or isn't able to (e.g. their burst has hit it's limit)
function SWEP:OnStopAttack()
end

function SWEP:SetAttackDelay(delay)
	local ct = CurTime()
	local nextAttack = self:GetNextPrimaryFire()
	local diff = ct - nextAttack

	if diff > engine.TickInterval() or diff < 0 then
		nextAttack = ct
	end

	self:SetNextPrimaryFire(nextAttack + delay)
end

function SWEP:CheckAutoAttack()
	if not self.ForceBurst or not self:GetCanAttack() then
		return
	end

	local count = self:GetAttackCount()

	if count > 0 and count % self:GetFiremode() != 0 then
		self:PrimaryAttack()
	end
end

function SWEP:UpdateAttack()
	if not GetPredictionPlayer():IsValid() then
		return
	end

	if self:GetCanAttack() then
		local duration = self:GetAttackDuration()
		local hasAttacked = self:GetHasAttacked()

		if hasAttacked then
			self:SetAttackDuration(duration + FrameTime())
		end

		if not hasAttacked or self:IsFinalBurstShot() then
			if self:GetAttackDuration() > 0 then
				self:OnStopAttack()
			end

			self:SetAttackCount(0)
			self:SetAttackDuration(0)
		end
	end

	self:SetCanAttack(self:GetNextPrimaryFire() <= CurTime())
	self:SetHasAttacked(false)

	self:CheckAutoAttack()
end
