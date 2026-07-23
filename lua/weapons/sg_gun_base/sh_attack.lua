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
		if self.LoopingReload then
			self:SetCancelReload(true)
		end

		return false
	end

	if self:GetMaxClip1() > 0 and self:Clip1() < self.AmmoCost then
		self:EmitSound("Weapon_SG.Empty")

		if self:CanReload() then
			self:Reload()
		else
			self:ConCommand("-attack")
		end

		self:SetAttackDelay(0.2)

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

	self:AddRecoil()

	local anim = self:PlayAnimation("Primary")
	local delay = self:GetDelay()

	if delay == -1 then
		delay = anim
	end

	self:SetAttackDelay(delay)
	self:SetHasAttacked(true)

	if self:GetFireDuration() == 0 then
		self:OnStartAttack()
	end

	self:SetLastAttack(CurTime())

	if self.PumpAction then
		self:SetShouldPump(true)
	end
end

function SWEP:GetShootDir()
	local owner = self:GetOwner()

	if owner:IsNPC() then
		return owner:GetAimVector()
	else
		return (owner:GetAimVector():Angle() + owner:GetViewPunchAngles()):Forward()
	end
end

function SWEP:GetDamage()
	return self.Damage
end

function SWEP:GetAccuracy()
	return self.Accuracy
end

function SWEP:GetRange()
	return self.Range
end

function SWEP:GetSpread()
	local accuracy = self:GetAccuracy()
	local range = self:GetRange()

	if accuracy == 0 or range == 0 then
		return 0
	end

	local inches = accuracy / 0.75
	local yards = (range / 0.75) / 36
	local MOA = (inches * 100) / yards

	return MOA / 60
end

function SWEP:BulletCallback(attacker, tr, dmg)
end

function SWEP:FireWeapon()
	local owner = self:GetOwner()
	local damage = self:GetDamage()

	local spread = math.rad(self:GetSpread())

	owner:FireBullets({
		Inflictor = self,

		Src = owner:GetShootPos(),
		Dir = self:GetShootDir(),

		Num = self.Count,
		Damage = damage,
		Force = damage * 0.25,
		Spread = Vector(
			spread * self.SpreadMod.x,
			spread * self.SpreadMod.y
		),

		Tracer = self.Tracer,
		TracerName = self.TracerName,

		Callback = function(attacker, tr, dmg)
			self:BulletCallback(attacker, tr, dmg)
		end
	})

	if SERVER then
		sound.EmitHint(SOUND_COMBAT, self:GetPos(), 1500, 0.2, owner)
	end
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

	if self:GetCanAttack() and not self:GetHasAttacked() or self:IsFinalBurstShot() then
		if self:GetFireDuration() > 0 then
			self:OnStopAttack()
		end

		self:SetAttackCount(0)
		self:SetFireDuration(0)
	else
		self:SetFireDuration(self:GetFireDuration() + FrameTime())
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
