AddCSLuaFile()
DEFINE_BASECLASS("sg_base")

if SERVER then
	return
end

local sphere_red = Color(255, 0, 0, 50)
local developerMode = sg.DeveloperMode

local function firemodeToText(mode)
	if mode == 0 then
		return "Full-auto"
	elseif mode == 1 then
		return "Semi-auto"
	else
		return mode .. "-Round burst"
	end
end

function SWEP:DrawHUDBackground()
	if not developerMode:GetBool() then
		return
	end

	local ply = self:GetOwner()

	local tr = util.TraceLine({
		start = ply:GetShootPos(),
		endpos = ply:GetShootPos() + self:GetShootDir() * 56756,
		mask = MASK_SHOT,
		filter = ply
	})

	local dist = tr.Fraction * 56756

	local range = self:GetRange()
	local accuracy = self:GetAccuracy()

	local offset = accuracy * (dist / range)

	sg.DrawDebugText(string.format("Firemode: %s", firemodeToText(self:GetFiremode())), 0)

	sg.DrawDebugText(string.format("Weapon range: %.0f at %.0f units", accuracy, range), 2)
	sg.DrawDebugText(string.format("Aim distance: %.0f units (%.2fx)", dist, dist / range), 3)

	cam.Start3D()
		render.SetColorMaterial()
		render.DrawSphere(tr.HitPos, offset, 20, 20, sphere_red)
	cam.End3D()
end
