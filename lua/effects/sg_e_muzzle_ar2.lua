--[[
SDK References: 

CTempEnts::MuzzleFlash_Combine_Player
CTempEnts::MuzzleFlash_Combine_NPC
--]]

local viewMaterials = {}
local worldMaterials = {}

local striderMuzzle = Material("effects/strider_muzzle")

for i = 1, 2 do
	viewMaterials[i] = Material("effects/combinemuzzle" .. i .. "_noz")
	worldMaterials[i] = Material("effects/combinemuzzle" .. i)
end

function EFFECT:Init(data)
	self.Data = sg.GetEffectData(data)
	self.Scale = self.Data.Scale or 1
	self.Entity = self.Data.Entity

	self:InitView()
	self:InitWorld()
end

function EFFECT:InitView()
	self.ViewEmitter = ParticleEmitter(vector_origin)
	self.ViewEmitter:SetNoDraw(true)

	local forward = Vector(1, 0, 0)
	local scale = math.Rand(2, 2.25) * self.Scale

	for i = 1, 5 do
		local offset = forward * (i * 4 * scale)
		local p = self.ViewEmitter:Add(table.Random(viewMaterials), offset)

		p:SetDieTime(0.025)

		p:SetColor(255, 255, math.random(200, 255))

		local size = (math.Rand(6, 8) * (12 - i) / 12) * scale

		p:SetStartSize(size)
		p:SetEndSize(size)

		p:SetRoll(math.random(0, 360))
	end

	local p = self.ViewEmitter:Add(table.Random(viewMaterials), vector_origin)

	p:SetDieTime(0.025)

	p:SetColor(255, 255, 255)

	p:SetStartAlpha(math.random(64, 128))
	p:SetEndAlpha(32)

	local size = math.Rand(10, 16) * self.Scale

	p:SetStartSize(size)
	p:SetEndSize(size)

	p:SetRoll(math.random(0, 360))
end

function EFFECT:InitWorld()
	self.WorldEmitter = ParticleEmitter(vector_origin)
	self.WorldEmitter:SetNoDraw(true)

	local forward = Vector(1, 0, 0)
	local scale = math.Rand(1, 1.5) * self.Scale
	local burst = math.Rand(50, 150)

	local length = 6

	local function createParticle(offset, dir)
		local p = self.WorldEmitter:Add(table.Random(worldMaterials), offset)

		p:SetDieTime(0.1)

		p:SetVelocity(dir * burst)

		p:SetColor(255, 255, 255)

		p:SetStartAlpha(255)
		p:SetEndAlpha(0)

		p:SetRoll(math.random(0, 360))

		return p
	end

	-- Front flash
	for i = 1, length - 1 do
		local p = createParticle(forward * (i * 2 * scale), forward)
		local size = (math.Rand(6, 8) * (length * 1.25 - i) / length) * scale

		p:SetStartSize(size)
		p:SetEndSize(size)
	end

	-- Diagonal flashes
	local left = Vector(0, -1, -1)

	for i = 1, length - 1 do
		local p = createParticle(left * (i * scale), left * 0.25)
		local size = (math.Rand(2, 4) * (length - i) / (length * 0.5)) * scale

		p:SetStartSize(size)
		p:SetEndSize(size)
	end

	local right = Vector(0, 1, -1)

	for i = 1, length - 1 do
		local p = createParticle(right * (i * scale), right * 0.25)
		local size = (math.Rand(2, 4) * (length - i) / (length * 0.5)) * scale

		p:SetStartSize(size)
		p:SetEndSize(size)
	end

	local up = Vector(0, 0, 1)

	for i = 1, length - 1 do
		local p = createParticle(up * (i * scale), up * 0.25)
		local size = (math.Rand(2, 4) * (length - i) / (length * 0.5)) * scale

		p:SetStartSize(size)
		p:SetEndSize(size)
	end

	local p = self.WorldEmitter:Add(striderMuzzle, Vector())

	p:SetDieTime(math.Rand(0.3, 0.4))

	p:SetColor(255, 255, 255)

	p:SetStartAlpha(255)
	p:SetEndAlpha(0)

	p:SetStartSize(math.Rand(12, 16) * scale)
	p:SetEndSize(0)

	p:SetRoll(math.random(0, 360))
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
	local pos, ang = sg.GetEffectOrigin(self.Data)

	self:SetPos(pos)

	cam.Start3D(WorldToLocal(EyePos(), EyeAngles(), pos, ang))
		local emitter = self.WorldEmitter

		if self:IsDrawingVM() then
			emitter = self.ViewEmitter
		end

		if emitter and emitter:IsValid() then
			emitter:SetPos(pos)
			emitter:Draw()
		end
	cam.End3D()
end
