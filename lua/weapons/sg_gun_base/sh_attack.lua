AddCSLuaFile()
DEFINE_BASECLASS("sg_base")

function SWEP:IsFinalBurstShot()
	local firemode = self:GetFiremode()

	return firemode > 1 and self:GetAttackCount() % firemode == 0
end

function SWEP:UpdateBurst()
	local firemode = self:GetFiremode()

	if firemode == 0 or self.AutoBurst then
		self.Primary.Automatic = true
	elseif firemode == 1 then
		self.Primary.Automatic = false
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

-- Extra checks for whether the weapon can fire
function SWEP:CanAttack()
	if self:IsReloading() then
		return false
	end

	if self.Primary.ClipSize > 0 and self:Clip1() < self.AmmoCost then
		return false
	end

	return true
end

-- Where ammo should be taken (if any)
function SWEP:TakeAmmo()
	self:TakePrimaryAmmo(self.AmmoCost)
end

function SWEP:PrimaryAttack()
	if not self:CanAttack() then
		return
	end

	self:PlayWorldAnimation(PLAYER_ATTACK1)

	self:SetAttackCount(self:GetAttackCount() + 1)
	self:UpdateBurst()

	self:TakeAmmo()
	self:FireWeapon()

	local anim = self:PlayAnimation("Primary")
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

function SWEP:SetAttackDelay(delay)
	local ct = CurTime()
	local nextAttack = self:GetNextPrimaryFire()
	local diff = ct - nextAttack

	if diff > engine.TickInterval() or diff < 0 then
		nextAttack = ct
	end

	self:SetNextPrimaryFire(nextAttack + delay)
end

-- Gets called when a player starts attacking
function SWEP:OnStartAttack()
end

-- Called when the player stops attacking or isn't able to (e.g. their burst has hit it's limit)
function SWEP:OnStopAttack()
end

function SWEP:IsFiring()
	return self:GetAttackCount() > 0
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

	local canAttack = self:GetNextPrimaryFire() <= CurTime()

	self:SetCanAttack(canAttack)
	self:SetHasAttacked(false)

	if not canAttack then
		return
	end

	if self:ShouldAutoAttack() then
		self:PrimaryAttack()
	end
end

-- Return true to force the weapon to fire
function SWEP:ShouldAutoAttack()
	if self.ForceBurst then
		local count = self:GetAttackCount()

		if count > 0 and count % self:GetFiremode() != 0 then
			return true
		end
	end

	return false
end
