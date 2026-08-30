--[[
SDK References: 

CTempEnts::MuzzleFlash_SMG1_Player
FX_MuzzleEffectAttached
--]]

viewMaterials = {}
worldMaterials = {}

for i = 1, 4 do
	viewMaterials[i] = Material("effects/muzzleflash" .. i .. "_noz")
	worldMaterials[i] = Material("effects/muzzleflash" .. i)
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
	local scale = math.Rand(1.25, 1.5) * self.Scale

	for i = 1, 6 do
		local offset = forward * (i * 8 * scale)
		local p = self.ViewEmitter:Add(table.Random(viewMaterials), offset)

		p:SetDieTime(0.025)

		p:SetColor(255, 255, math.random(200, 255))

		local size = (math.Rand(6, 8) * (8 - i) / 6) * scale

		p:SetStartSize(size)
		p:SetEndSize(size)

		p:SetRoll(math.random(0, 360))
	end
end

function EFFECT:InitWorld()
	self.WorldEmitter = ParticleEmitter(vector_origin)
	self.WorldEmitter:SetNoDraw(true)

	local forward = Vector(1, 0, 0)
	local scale = math.Rand(self.Scale - 0.25, self.Scale + 0.25)

	for i = 1, 9 do
		local offset = forward * (i * 2 * scale)
		local p = self.WorldEmitter:Add(table.Random(worldMaterials), offset)

		p:SetDieTime(0.025)

		p:SetStartAlpha(255)
		p:SetEndAlpha(128)

		local size = (math.Rand(6, 9) * (12 - i) / 9) * scale

		p:SetStartSize(size)
		p:SetEndSize(size)

		p:SetRoll(math.random(0, 360))
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
