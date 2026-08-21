AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

function SWEP:GetCurrentAnimation()
	local name = self:GetAnimationName()
	local anim = self.Animations[name]

	if anim then
		return anim, self.AnimationRates[name] or 1
	end
end

function SWEP:GetAnimationCycle()
	return sg.TimeFraction(self:GetAnimationStart(), self:GetAnimationEnd())
end

function SWEP:TranslateAnimation(name)
end

function SWEP:PlayAnimation(name)
	-- Try to play any 'pending' events first
	self:HandleAnimationEvents()

	-- See if there's any better names we should be using
	name = self:TranslateAnimation(name) or name

	local data = self.Animations[name]
	if not data then return 0 end

	local vm = self:GetViewModel()
	local duration = data.Duration

	if not duration then
		local sequence = sg.GetSequenceIndex(vm, data.Sequence)

		if sequence == -1 then
			return
		end

		duration = vm:SequenceDuration(sequence)
	end

	duration = duration / (self.AnimationRates[name] or 1)

	local now = CurTime()

	self:SetAnimationName(name)
	self:SetLastCycle(-1)

	self:SetAnimationStart(now)
	self:SetAnimationEnd(now + duration)

	local callback = self["On" .. name .. "Animation"]
	if callback then callback(self) end

	return duration
end

function SWEP:HandleAnimationEvents()
	local anim, rate = self:GetCurrentAnimation()
	if not anim then return end

	local cycle = self:GetAnimationCycle()

	anim:HandleAnimationEffects(self, rate, self:GetLastCycle(), cycle)

	self:SetLastCycle(cycle)
end

function SWEP:UpdateAnimations()
	if not GetPredictionPlayer():IsValid() then
		return
	end

	if self:GetAnimationEnd() <= CurTime() then
		self:PlayAnimation("Idle")
	end

	self:HandleAnimationEvents()
end

function SWEP:PlayWorldAnimation(index)
	self:GetOwner():SetAnimation(index)
end

local fallbackAnimations = {
	Deploy = sg.Animation.WeaponSequence(ACT_VM_DRAW),
	Idle = sg.Animation.WeaponSequence(ACT_VM_IDLE),

	Primary = sg.Animation.WeaponSequence(ACT_VM_PRIMARYATTACK):AddEvent(0, "PlayerAnimation", PLAYER_ATTACK1),
	Secondary = sg.Animation.WeaponSequence(ACT_VM_SECONDARYATTACK):AddEvent(0, "PlayerAnimation", PLAYER_ATTACK1),
	Pump = sg.Animation.WeaponSequence(ACT_SHOTGUN_PUMP),

	Reload = sg.Animation.WeaponSequence(ACT_VM_RELOAD):AddEvent(0, "PlayerAnimation", PLAYER_RELOAD),
	ReloadStart = sg.Animation.WeaponSequence(ACT_SHOTGUN_RELOAD_START):AddEvent(0, "PlayerAnimation", PLAYER_RELOAD),
	ReloadSingle = sg.Animation.WeaponSequence(ACT_VM_RELOAD),
	ReloadFinish = sg.Animation.WeaponSequence(ACT_SHOTGUN_RELOAD_FINISH)
}

function SWEP:InitAnimations()
	local animations = weapons.Get(self:GetClass()).Animations or {}

	for k, v in pairs(fallbackAnimations) do
		if not animations[k] then
			animations[k] = v
		end
	end

	self.Animations = animations

	-- TODO: Add validation here to check for stuff that doesn't exist on the swep tables
	-- sg.ThrowError(target[name], "%s's '%s' animation is looking for %s[\"%s\"] which doesn't exist!", self, self:GetAnimationName(), tableName, name)
end

if CLIENT then
	function SWEP:ApplySCKAnimations()
		local anim = self:GetCurrentAnimation()
		if not anim then return end

		-- Hey we probably need a fallback here to make sure all the proxy tables are cleared if we for whatever reason don't have an animation

		anim:UpdateSCK(self, self:GetAnimationCycle())
	end

	function SWEP:GetViewModelOffset(pos, ang)
		local anim = self:GetCurrentAnimation()

		if anim then
			anim:GetViewModelOffset(pos, ang, self:GetAnimationCycle())
		end
	end
end
