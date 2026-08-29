AddCSLuaFile()

-- Called once when firing, updates TracerNum
function SWEP:CreateEffects(tr)
	if self.Tracer > 1 then
		self:SetTracerNum((self:GetTracerNum() + 1) % self.Tracer)
	end

	self:CreateMuzzleEffect()
	self:CreateTracer(tr.StartPos, tr.HitPos)
end

function SWEP:CreateMuzzleEffect()
	if self.MuzzleEffect == "" or not IsFirstTimePredicted() then return end

	local ply = self:GetOwner()
	local data = {
		Entity = self,
		Attachment = "Muzzle"
	}

	for k, v in pairs(self.MuzzleConfig) do
		if k != "BaseClass" then
			data[k] = v
		end
	end

	sg.Effect(self.MuzzleEffect, ply:GetShootPos(), data, nil, ply)

	-- TODO
end

function SWEP:CreateTracer(start, origin, detach)
	if self.Tracer == 0 or self.TracerName == "" then return end
	if self:GetTracerNum() != 0 or not IsFirstTimePredicted() then return end

	local data = {
		Start = start,
		Entity = self
	}

	if not detach then
		data.Attachment = "Muzzle"
	end

	for k, v in pairs(self.TracerConfig) do
		if k != "BaseClass" then
			data[k] = v
		end
	end

	sg.Effect(self.TracerName, origin, data, nil, self:GetOwner())
end
