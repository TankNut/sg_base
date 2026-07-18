local material = Material("effects/spark")

--[[
Configurable fields:
	Material - The sprite that gets drawn, usually left blank (for the default) or set to effects/gunshiptracer for the AR2 effect
	Velocity - The velocity of each tracer, can be a table for a random range
	Length - How long the bullet tracer is, shorter tracers are harder to notice, can be a table for a random range
	Scale - The thiccness of the tracer, can be a table for a random range
	Color - The color of the tracer
	Brightness - How bright the tracer is, overdraws on values above 1
]]

function EFFECT:Init(data)
	self.Pos = data:GetStart()
	self.Entity = data:GetEntity()

	self.Attachment = data:GetAttachment()

	self.Start = self:GetTracerShootPos(self.Pos, self.Entity, self.Attachment)
	self.End = data:GetOrigin()

	self:SetRenderBoundsWS(self.Start, self.End)

	self.Time = 0
	self.Active = true

	self.Material = material
	self.Velocity = 5000
	self.Length = math.Rand(64, 128)
	self.Scale = math.Rand(0.75, 0.9)
	self.Color = Color(255, 255, 255)
	self.Brightness = 1

	if self.Entity.ConfigureTracer then
		self.Entity:ConfigureTracer(self)
	end

	for _, key in ipairs({"Velocity", "Length", "Scale", "Brightness"}) do
		local val = self[key]

		if istable(val) then
			self[key] = math.Rand(val[1], val[2])
		end
	end

	effects.TracerSound(self.Start, self.End)
end

function EFFECT:Think()
	return self.Active
end

local color = Color(255, 255, 255)
local spriteColor = Color(255, 255, 255)

local sprite = Material("sprites/light_glow02_add")

function EFFECT:Render()
	self.Time = self.Time + FrameTime()

	local r, g, b = self.Color:Unpack()

	self.Active = sg.Tracer(self.Start, self.End, self.Velocity, self.Length, self.Time, function(startPos, endPos, uv1, uv2)
		local v1, v2 = startPos:ToScreen(), endPos:ToScreen()
		v1, v2 = Vector(v1.x, v1.y), Vector(v2.x, v2.y)

		local dist = v1:Distance2D(v2)
		local spriteBrightness = math.max(math.Remap(dist, self.Scale * 4, 0, 0, 1), 0)
		local spritePos = startPos + endPos
		spritePos:Mul(0.5)

		for i = 0, math.ceil(self.Brightness) - 1 do
			local a = math.min((self.Brightness - i) * 255, 255)

			color:SetUnpacked(r, g, b, a)
			spriteColor:SetUnpacked(r, g, b, a)
			spriteColor:SetBrightness(spriteBrightness)

			render.SetMaterial(self.Material)
			render.DrawBeam(startPos, endPos, self.Scale * 2, uv1, uv2, color)

			render.SetMaterial(sprite)
			render.DrawSprite(spritePos, self.Scale * 2, self.Scale * 2, spriteColor)

			color:SetBrightness(0.25)
			render.SetMaterial(self.Material)
			render.DrawBeam(startPos, endPos, self.Scale * 4, uv1, uv2, color)
		end
	end)
end
