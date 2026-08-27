module("sg", package.seeall)

IsDrawingViewModels = false

function DrawDebugText(str, line, color)
	line = line or 0

	surface.SetFont("DebugOverlay")

	local _, offset = surface.GetTextSize("a")

	local x = ScreenScale(5)
	local y = ScrH() * 0.5

	draw.SimpleText(str, "DebugOverlay", x, y + offset * line, color or color_white)

	return line + 1
end

function DrawCircle(x, y, radius, seg)
	local circle = {}

	table.insert(circle, {x = x, y = y, u = 0.5, v = 0.5})

	local function addSegment(a)
		table.insert(circle, {
			x = x + math.sin(a) * radius,
			y = y + math.cos(a) * radius,
			u = math.sin(a) / 2 + 0.5,
			v = math.cos(a) / 2 + 0.5
		})
	end

	for i = 0, seg do
		addSegment(math.rad((i / seg) * -360))
	end

	addSegment(math.rad(0)) -- This is needed for non absolute segment counts

	surface.DrawPoly(circle)
end

do
	local color_black = Color(0, 0, 0)
	local dir = Vector()

	function DrawFadedBeam(startPos, endPos, width, uv1, uv2, color)
		local maxOffset = width * 2

		local distance = startPos:Distance(endPos)
		local length = math.min(startPos:Distance(endPos) * 0.5, maxOffset)
		local uvDistance = math.abs(uv1 - uv2)

		dir:Set(endPos)
		dir:Sub(startPos)
		dir:Normalize()

		local offset = dir * length
		local uvOffset = (length / distance) * uvDistance

		if length == maxOffset then
			render.StartBeam(4)
				render.AddBeam(startPos, width, uv1, color_black)
				render.AddBeam(startPos + offset, width, uv1 - uvOffset, color)
				render.AddBeam(endPos - offset, width, uv2 + uvOffset, color)
				render.AddBeam(endPos, width, uv2, color_black)
			render.EndBeam()
		else
			render.StartBeam(3)
				render.AddBeam(startPos, width, uv1, color_black)
				render.AddBeam(startPos + offset, width, uv1 - uvOffset, color)
				render.AddBeam(endPos, width, uv2, color_black)
			render.EndBeam()
		end
	end
end

do
	local dir = Vector()

	function Tracer(startpos, endpos, velocity, length, time, callback)
		dir:Set(endpos)
		dir:Sub(startpos)

		local distance = dir:Length()

		dir:Normalize()

		local lifetime = (distance + length) / velocity

		if time > lifetime then
			return
		end

		local startDistance = velocity * time
		local endDistance = startDistance - length

		startDistance = math.Clamp(startDistance, 0, distance)
		endDistance = math.Clamp(endDistance, 0, distance)

		local startPoint = startpos + dir * startDistance
		local endPoint = startpos + dir * endDistance

		local uv1 = math.abs(startDistance - endDistance) / length
		local uv2 = 0

		callback(startPoint, endPoint, uv1, uv2, dir)

		return
	end
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

	local visibility = util.PixelVisible(pos, width / 15, pixvis) * math.max(dot, 0)

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
	render.DepthRange(0, IsDrawingViewModels and 0.1 or 1)
end

function DrawLaser(pos, dir, length, width, color, brightness, pixvis)
	local dot = (EyePos() - pos)
	dot:Normalize()
	dot = dot:Dot(dir)

	local visibility = util.PixelVisible(pos, width / 5, pixvis) * math.max(dot, 0)

	-- Shrink the dot if the viewpoint is off-axis
	local size = RemapC(dot, 1 - math.rad(1), 1, width, width * 3)

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
		render.DepthRange(0, IsDrawingViewModels and 0.1 or 1)
	end
end

-- Tracking viewmodel rendering so we can responsibly reset render.DepthRange
hook.Add("PreDrawViewModels", "sg_base", function() IsDrawingViewModels = true end)
hook.Add("PreDrawEffects", "sg_base", function() IsDrawingViewModels = false end)

local refract = Material("gmod/scope-refract")
local scope = Material("gmod/scope")

local function drawRect(x, y, w, h)
	x = math.Round(x)
	y = math.Round(y)
	w = math.Round(w)
	h = math.Round(h)

	surface.DrawRect(x, y, w, h)
end

function DrawScope(ent, zoom)
	local screenW = ScrW()
	local screenH = ScrH()

	local h = screenH
	local w = (4 / 3) * h

	local dw = (screenW - w) * 0.5

	local midX = screenW * 0.5 - 1
	local midY = screenH * 0.5

	surface.SetDrawColor(0, 0, 0)

	surface.DrawRect(0, 0, dw, h)
	surface.DrawRect(w + dw, 0, dw, h)

	surface.SetMaterial(refract)
	surface.DrawTexturedRect(dw, 0, w, h)

	surface.SetMaterial(scope)
	surface.DrawTexturedRect(dw, 0, w, h)

	local dist = 0.5 * zoom

	surface.SetDrawColor(0, 0, 0)
	surface.DrawLine(0, midY, midX - dist, midY) -- Left
	surface.DrawLine(midX, 0, midX, midY - dist) -- Up
	surface.DrawLine(midX + dist, midY, screenW, midY) -- Right
	surface.DrawLine(midX, midY + dist, midX, screenH) -- Down

	local interval = 3 * zoom

	for i = 1, 22 do
		local size = ((i % 2 == 0) and 6 or 2) * (zoom / 4)
		local offset = i * interval

		surface.DrawLine(midX - offset, midY - size, midX - offset, midY + size) -- Left
		surface.DrawLine(midX - size, midY - offset, midX + size, midY - offset) -- Up
		surface.DrawLine(midX + offset, midY - size, midX + offset, midY + size) -- Right
		surface.DrawLine(midX - size, midY + offset, midX + size, midY + offset) -- Down

		if i == 22 then
			drawRect(1, midY - size, midX - offset, size * 2) -- Left
			drawRect(midX - size, 1, size * 2, midY - offset) -- Up
			drawRect(midX + offset, midY - size, screenW, size * 2) -- Right
			drawRect(midX - size, midY + offset, size * 2, screenH) -- Down
		end
	end

	local offset = interval * 44
	local size = 5 * zoom

	surface.DrawLine(midX - offset, midY - size, midX - offset, midY + size) -- Left
	surface.DrawLine(midX - size, midY - offset, midX + size, midY - offset) -- Up
	surface.DrawLine(midX + offset, midY - size, midX + offset, midY + size) -- Right
	surface.DrawLine(midX - size, midY + offset, midX + size, midY + offset) -- Down

	surface.SetDrawColor(255, 0, 0)
	surface.DrawLine(midX - dist, midY, midX + dist, midY) -- Left to right
	surface.DrawLine(midX, midY - dist, midX, midY + dist) -- Up to down
end
