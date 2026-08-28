AddCSLuaFile()
DEFINE_BASECLASS("sg_base_weapon")

function SWEP:GetCurrentFiremode()
	local firemode = self:GetFiremode()

	self:RunHooks("OverrideFiremode", function(func)
		local override = func(firemode)

		if override != nil then
			firemode = override
		end
	end)

	return firemode
end

function SWEP:IsBurstFire()
	return self:GetCurrentFiremode() > 1
end

function SWEP:IsFinalBurstShot()
	local firemode = self:GetCurrentFiremode()

	if firemode > 1 then
		local count = self:GetAttackCount()

		return count > 0 and count % firemode == 0
	end

	return false
end

function SWEP:UpdateBurst()
	local firemode = self:GetCurrentFiremode()

	if firemode == 0 or self.AutoBurst then
		self.Primary.Automatic = true
	elseif firemode == 1 then
		self.Primary.Automatic = false
	else
		self.Primary.Automatic = not self:IsFinalBurstShot()
	end
end

function SWEP:GetDelay()
	local delay = self.Delay

	if self.BurstDelay != nil and self:IsFinalBurstShot() then
		delay = self.BurstDelay
	end

	self:RunHooks("GetDelay", function(func)
		local override = func(delay)

		if override != nil then
			delay = override
		end
	end)

	return delay
end

-- Extra checks for whether the weapon can fire
function SWEP:CanAttack()
	local override = self:RunHooks("CanAttack")

	if override != nil then
		return override
	end

	if self:IsReloading() then
		if self.LoopingReload and not self:GetLastReload() then
			self:SetCancelReload(true)
		end

		return false
	end

	if not self:HasEnoughAmmo() then
		self:EmitSound("Weapon_SG.Empty")

		if self:CanReload() then
			self:Reload()
		else
			self:ConCommand("-attack")
		end

		-- Prevents a quick re-fire from cancelling reloads, and sound spam
		self:SetAttackDelay(0.4)

		return false
	end

	return true
end

local infiniteAmmo = sg.Convars.InfiniteAmmo

function SWEP:HasEnoughAmmo()
	if self:GetMaxClip1() > 0 then
		return self:Clip1() >= self.AmmoCost
	end

	if self:GetPrimaryAmmoType() != -1 and not infiniteAmmo:GetBool() then
		return self:Ammo1() >= self.AmmoCost
	end

	return true
end


-- Where ammo should be taken (if any)
function SWEP:TakeAmmo()
	if self:GetMaxClip1() == -1 and infiniteAmmo:GetBool() then
		return
	end

	self:TakePrimaryAmmo(self.AmmoCost)
end

function SWEP:PrimaryAttack()
	if not self:CanAttack() then
		return
	end

	self:SetAttackCount(self:GetAttackCount() + 1)
	self:UpdateBurst()

	self:TakeAmmo()
	self:FireWeapon()
	self:RunHooks("PostFireWeapon")

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
	local spread = 12

	self:RunHooks("GetSpread", function(func)
		local override = func(spread)

		if override != nil then
			spread = override
		end
	end)

	return spread
end

function SWEP:GetRange()
	local range = self.Range

	self:RunHooks("GetRange", function(func)
		local override = func(range)

		if override != nil then
			range = override
		end
	end)

	return range
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

	return math.rad(MOA / 60)
end

function SWEP:BulletCallback(attacker, tr, dmg, bullet)
	self:RunHooks("BulletCallback", nil, attacker, tr, dmg, bullet)
end

function SWEP:FireWeapon()
	local owner = self:GetOwner()
	local damage = self:GetDamage()

	local spread = self:GetSpread()
	local bullet = {
		Inflictor = self,

		Src = owner:GetShootPos(),
		Dir = self:GetShootDir(),

		Num = self.Count,
		Damage = damage,
		Force = self.Force,
		Spread = Vector(spread, spread),

		Tracer = 0,
		TracerName = "",
	}

	bullet.Callback = function(attacker, tr, dmg)
		self:CreateEffects(tr)
		self:BulletCallback(attacker, tr, dmg, bullet)
	end

	self:RunHooks("ModifyBullet", nil, bullet)

	owner:FireBullets(bullet)

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
	if self:IsBurstFire() then
		local count = self:GetAttackCount()

		if count > 0 and count % self:GetCurrentFiremode() != 0 then
			return true
		end
	end

	return false
end
