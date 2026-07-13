AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

function SWEP:GetAnimation(name)
	local ply = self:GetOwner()

	if not ply:IsPlayer() then
		return
	end

	local vm = ply:GetViewModel()
	local func = self["Get" .. name .. "Animation"]
	local animation = isfunction(func) and func(self) or self.Animations[name]

	if not animation then
		return
	end

	if istable(animation) then
		animation = table.Random(animation)
	end

	if isnumber(animation) then
		return vm:SelectWeightedSequence(animation)
	elseif isstring(animation) then
		return vm:LookupSequence(animation)
	end
end

function SWEP:PlayAnimation(name, rate)
	local index = self:GetAnimation(name)

	if not index then
		return
	end

	rate = rate or 1

	local vm = self:GetOwner():GetViewModel()
	local duration = vm:SequenceDuration(index) / math.abs(rate)

	vm:SendViewModelMatchingSequence(index)
	vm:SetPlaybackRate(rate)

	self:SetNextIdle(CurTime() + duration)

	local callback = self["On" .. name .. "Animation"]

	if isfunction(callback) then
		callback(self)
	elseif self.AnimSounds[name] then
		self:EmitSound(self.AnimSounds[name])
	end

	return duration
end

function SWEP:PlayWorldAnimation(index)
	self:GetOwner():SetAnimation(index)
end
