--[[
SDK References:

CTempEnts::MuzzleFlash_357_Player
FX_MuzzleEffect

Only smoke related code is used
--]]

function EFFECT:Init(data)
	data = sg.GetEffectData(data)

	local pos, ang = sg.GetEffectOrigin(data)

	self.Origin = pos
	self.Forward = ang:Forward()

	self.Scale = data.Scale or 1
	self.Entity = data.Entity

	self:InitView()
	self:InitWorld()
end

function EFFECT:InitView()
	self.ViewEmitter = ParticleEmitter(self.Origin)
	self.ViewEmitter:SetNoDraw(true)

	local p = self.ViewEmitter:Add("particle/particle_smokegrenade", self.Origin + self.Forward * 8 * self.Scale)
	p:SetDieTime(math.Rand(0.25, 0.5))

	local vel = Vector(self.Forward)
	vel:Mul(math.Rand(16, 64))
	vel.z = vel.z + math.Rand(4, 16)
	p:SetVelocity(vel)

	local color = math.random(64, 164)
	p:SetColor(color, color, color)

	p:SetStartAlpha(math.random(64, 128))
	p:SetEndAlpha(0)

	local size = math.random(2, 4) * self.Scale
	p:SetStartSize(size)
	p:SetEndSize(size * 4)

	p:SetRoll(math.random(0, 360))
	p:SetRollDelta(math.Rand(-0.1, 0.1))
end

function EFFECT:InitWorld()
	self.WorldEmitter = ParticleEmitter(self.Origin)
	self.WorldEmitter:SetNoDraw(true)

	local scale = math.Rand(self.Scale - 0.25, self.Scale + 0.25)
	local origin = self.Origin + self.Forward * 4 * self.Scale

	for i = 1, 4 do
		local p = self.WorldEmitter:Add("particle/particle_smokegrenade", origin)
		p:SetDieTime(math.Rand(0.2, 0.4))

		local vel = Vector(self.Forward)
		vel:Mul(math.Rand(16, 64))
		vel.z = vel.z + math.Rand(4, 16)
		p:SetVelocity(vel)

		local color = math.random(64, 164)
		p:SetColor(color, color, color)

		p:SetStartAlpha(math.random(32, 84))
		p:SetEndAlpha(0)

		local size = math.random(2, 4) * scale
		p:SetStartSize(size)
		p:SetEndSize(size * 2)

		p:SetRoll(math.random(0, 360))
		p:SetRollDelta(math.Rand(-4, 4))
	end
end

function EFFECT:Think()
	local alive = false

	if not IsValid(self.Entity) then
		if self.ViewEmitter then self.ViewEmitter:Finish() end
		if self.WorldEmitter then self.WorldEmitter:Finish() end

		return false
	end

	for _, v in pairs({self.ViewEmitter, self.WorldEmitter}) do
		if v and v:IsValid() then
			if v:GetNumActiveParticles() == 0 then
				v:Finish()
			else
				alive = true
			end
		end
	end

	return alive
end

function EFFECT:IsDrawingVM()
	return self.Entity:IsCarriedByLocalPlayer() and not LocalPlayer():ShouldDrawLocalPlayer()
end

function EFFECT:Render()
	local emitter = self:IsDrawingVM() and self.ViewEmitter or self.WorldEmitter

	if emitter:IsValid() then
		emitter:Draw()
	end
end
