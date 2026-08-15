AddCSLuaFile()
DEFINE_BASECLASS("sg_base_weapon")

if SERVER then
	return
end

local sphere_red = Color(255, 0, 0, 50)
local developerMode = sg.Convars.DeveloperMode

local function firemodeToText(mode)
	if mode == 0 then
		return "Full-auto"
	elseif mode == 1 then
		return "Semi-auto"
	else
		return mode .. "-Round burst"
	end
end

function SWEP:DebugWeaponStats()
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
	local line = -6

	line = sg.DrawDebugText(string.format("Firemode: %s", firemodeToText(self:GetCurrentFiremode())), line)

	line = sg.DrawDebugText(string.format("Weapon range: %.0f units (%.2fx spread)", range, accuracy / 12), line)
	line = sg.DrawDebugText(string.format("Aim distance: %.0f units (%.2fx)", dist, dist / range), line)


	local recoil = self:GetRecoilMultiplier()
	line = sg.DrawDebugText(string.format("Recoil %%: %.3f%%", recoil), line + 1)

	local delay = self:GetDelay()
	line = sg.DrawDebugText(string.format("Delay: %.3fs (%.0f RPM)", delay, 60 / delay), line)

	cam.Start3D()
		render.SetColorMaterialIgnoreZ()
		render.DrawSphere(tr.HitPos, offset, 20, 20, sphere_red)
	cam.End3D()
end

local layerTables = {"VElements", "WElements", "VBoneMods"}

function SWEP:DebugAnimationState()
	local name = self:GetAnimationName()
	local anim = self.Animations[name]

	local line = 3

	if not anim then
		sg.DrawDebugText("Animation: *NONE*", line)
		return
	end

	line = sg.DrawDebugText(string.format("Animation: %s", name), line)
	line = sg.DrawDebugText(string.format("Cycle: %.3f", self:GetAnimationCycle()), line)

	line = sg.DrawDebugText("Events:", line)

	for frame, events in SortedPairs(anim.Events) do
		for _, event in ipairs(events) do
			line = sg.DrawDebugText(string.format("\t[%.3f]: %s(%s)", frame, event[1], event[2]), line)
		end
	end

	line = sg.DrawDebugText("Layers:", line)

	for _, tab in ipairs(layerTables) do
		local count = 0

		for _, layers in pairs(anim[tab]) do
			count = count + table.Count(layers)
		end

		if count > 0 then
			line = sg.DrawDebugText(string.format("\t%s: %i", tab, count), line)
		end
	end
end

function SWEP:DrawDebugHUD()
	self:DebugWeaponStats()
	self:DebugAnimationState()
end

function SWEP:DoDrawCrosshair(x, y)
	local should = self:RunHooks("DrawCrosshair", nil, x, y)

	if developerMode:GetBool() then
		self:DrawDebugHUD()
	end

	return should
end
