module("sg.SCK", package.seeall)

local developerMode = sg.Convars.DeveloperMode

local forward = Color(255, 0, 0)
local right =   Color(0, 255, 0)
local up =      Color(0, 0, 255)

AddType("Quad", {
	RenderOrder = -10,
	Init = function(self, tab, element)
		element.draw_func = self[element.draw_func]
	end,
	Render = function(self, tab, element, ent, flags, rendergroups)
		local matrix = GetBoneOrientation(tab, element, ent)
		if not matrix then return end

		local pos, ang = matrix:GetTranslation(), matrix:GetAngles()

		if element.draw_func then
			cam.Start3D2D(pos, ang, element.size)
				element.draw_func(self, element, ent, flags, rendergroups)
			cam.End3D2D()
		end

		if developerMode:GetBool() then
			render.DrawLine(pos, pos + ang:Up(), forward)
			render.DrawLine(pos - ang:Forward(), pos + ang:Forward(), right)
			render.DrawLine(pos - ang:Right(), pos + ang:Right(), up)
		end
	end
})
