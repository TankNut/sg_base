function EFFECT:Init(data)
	data = sg.GetEffectData(data)

	self.Start = sg.GetEffectOrigin(data)
	self.End = data.Origin

	self:SetRenderBoundsWS(self.Start, self.End)

	self.Lifetime = 5
	self.Time = CurTime()

	self.Points = {}

	local count = math.min(math.ceil(self.Start:Distance(self.End) / 64), 31)

	for i = 0, count do
		local point = LerpVector(i / count, self.Start, self.End)
		local uv = (self.Start - point):Length() / 128
		local alpha = math.Rand(0, 1)

		if i == 0 or i == count then
			alpha = 1
		end

		self.Points[i + 1] = {
			point, -- Position
			VectorRand(), -- Drift direction
			alpha, -- Alpha multiplier
			uv -- Texture end
		}
	end

	effects.TracerSound(self.Start, self.End)
end

function EFFECT:Think()
	return CurTime() - self.Time <= self.Lifetime
end

local material = Material("trails/smoke")
local color = Color(182, 182, 182)
local drift = 0.5

function EFFECT:Render()
	local frac = sg.TimeFraction(self.Time, self.Time + self.Lifetime)
	local frac2 = sg.RemapC(frac, 0, 0.5, 0, 1)

	local alpha = Lerp(math.ease.OutSine(frac), 255, 0)
	local size = Lerp(frac, 2, 20)

	render.SetMaterial(material)

	render.StartBeam(#self.Points)
		for i, data in ipairs(self.Points) do
			local point, dir, mult, uv = data[1], data[2], data[3], data[4]

			if i == 1 or i == #self.Points then
				color.a = 0
			else
				color.a = alpha * (1 - mult * frac2)
			end

			render.AddBeam(point, size, uv, color)

			point:Add(dir * FrameTime() * drift)
		end
	render.EndBeam()
end
