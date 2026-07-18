AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

local function parseAnimationEntry(name, data)
	if not istable(data) then
		return {Index = data}
	end

	local index = ACT_INVALID
	local snd = data.Sound

	if #data == 0 then -- Grab the default value from sg_base
		index = weapons.GetStored("sg_base").Animations[name]
	elseif #data == 1 then
		index = data[1]
	else
		index = data[math.random(#data)]
	end

	if istable(snd) then
		snd = snd[math.random(#snd)]
	end

	return {
		Index = index,
		Rate = data.Rate,
		Sound = snd
	}
end

function SWEP:GetAnimation(name)
	local ply = self:GetOwner()

	if not ply:IsPlayer() then
		return
	end

	local func = self["Get" .. name .. "Animation"]
	local data = self.Animations[name]

	if func then
		data = func(self)
	end

	data = parseAnimationEntry(name, data)

	return data
end

function SWEP:PlayAnimation(name)
	local data = self:GetAnimation(name)
	local vm = self:GetOwner():GetViewModel()

	local index = data.Index

	if isnumber(index) then
		index = vm:SelectWeightedSequence(index)
	elseif isstring(index) then
		index = vm:LookupSequence(index)
	end

	local rate = data.Rate or 1
	local duration = 0

	if index != ACT_INVALID then
		duration = vm:SequenceDuration(index) / rate

		vm:SendViewModelMatchingSequence(index)
		vm:SetPlaybackRate(rate)

		self:SetNextIdle(CurTime() + duration)
	end

	local snd = data.Sound

	if snd then
		self:EmitSound(snd)
	end

	local callback = self["On" .. name .. "Animation"]

	if callback then
		callback(self)
	end

	return duration
end

function SWEP:PlayWorldAnimation(index)
	self:GetOwner():SetAnimation(index)
end
