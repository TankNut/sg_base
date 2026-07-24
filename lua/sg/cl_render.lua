module("sg", package.seeall)

function DrawDebugText(str, line, color)
	surface.SetFont("DebugOverlay")

	local _, offset = surface.GetTextSize("a")

	local x = ScreenScale(5)
	local y = ScrH() * 0.5

	draw.SimpleText(str, "DebugOverlay", x, y + offset * (line or 0), color or color_white)
end

local tracerDir = Vector()

-- Returns false if done rendering
function Tracer(startpos, endpos, velocity, length, time, callback)
	tracerDir:Set(endpos)
	tracerDir:Sub(startpos)

	local distance = tracerDir:Length()

	tracerDir:Normalize()

	-- Minimum length
	if distance <= 128 then
		return false
	end

	local lifetime = (distance + length) / velocity

	if time > lifetime then
		return false
	end

	local startDistance = velocity * time
	local endDistance = startDistance - length

	startDistance = math.Clamp(startDistance, 0, distance)
	endDistance = math.Clamp(endDistance, 0, distance)

	local startPoint = startpos + tracerDir * startDistance
	local endPoint = startpos + tracerDir * endDistance

	local uv1 = math.abs(startDistance - endDistance) / length
	local uv2 = 0

	callback(startPoint, endPoint, uv1, uv2)

	return true
end

local spotlightSprite = Material("sprites/light_glow02_add")
local spotlightBeam = Material("sg/sprites/spotlight")
local laser = Material("sg/sprites/physbeam")

local _color = Color(255, 255, 255)
local color_black = Color(0, 0, 0, 0)

function DrawSpotlight(pos, dir, length, width, color, pixvis)
	local dot = (EyePos() - pos)
	dot:Normalize()
	dot = dot:Dot(dir)

	local visibility = util.PixelVisible(pos, 10, pixvis) * math.max(dot, 0)

	-- Shrink the dot if the viewpoint is off-axis
	local size = RemapC(dot, 1 - math.rad(30), 1, width * 0.25, width)
	local r, g, b = color:Unpack()

	_color:SetUnpacked(r, g, b, 100)

	render.SetMaterial(spotlightBeam)
	render.StartBeam(2)
		render.AddBeam(pos, width * 0.5, 0, _color)
		render.AddBeam(pos + dir * length, width * 0.5, 0.99, color_black)
	render.EndBeam()

	_color:SetBrightness(visibility)

	render.SetMaterial(spotlightSprite)
	render.DepthRange(0, 0)
		render.DrawSprite(pos, size, size, _color)
		render.DrawSprite(pos, size, size, _color)
	render.DepthRange(0, 1)
end

function DrawLaser(pos, dir, length, width, color, brightness, pixvis)
	local dot = (EyePos() - pos)
	dot:Normalize()
	dot = dot:Dot(dir)

	local visibility = util.PixelVisible(pos, width, pixvis) * math.max(dot, 0)

	-- Shrink the dot if the viewpoint is off-axis
	local size = RemapC(dot, 1 - math.rad(1), 1, width * 0.5, width * 2)

	local endpos = pos + dir * length
	local r, g, b = color:Unpack()

	for i = 0, math.ceil(brightness) - 1 do
		_color:SetUnpacked(r, g, b, math.min((brightness - i) * 255, 255))

		local uv1 = math.random()
		local uv2 = uv1 + (length / 10)

		render.SetMaterial(laser)
		render.StartBeam(2)
			render.AddBeam(pos, width, uv1, _color)
			render.AddBeam(endpos, width, uv2, color_black)
		render.EndBeam()

		_color:SetBrightness(visibility)
		render.SetMaterial(spotlightSprite)
		render.DepthRange(0, 0)
			render.DrawSprite(pos, size, size, _color)
		render.DepthRange(0, 1)
	end
end
