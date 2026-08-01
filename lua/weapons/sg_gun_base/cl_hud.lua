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

	sg.DrawDebugText(string.format("Firemode: %s", firemodeToText(self:GetFiremode())), -5)

	sg.DrawDebugText(string.format("Weapon range: %.0f at %.0f units", accuracy, range), -3)
	sg.DrawDebugText(string.format("Aim distance: %.0f units (%.2fx)", dist, dist / range), -2)

	local delay = self:GetDelay()

	sg.DrawDebugText(string.format("Delay: %.2fs (%.0f RPM)", delay, 60 / delay), 0)

	cam.Start3D()
		render.SetColorMaterial()
		render.DrawSphere(tr.HitPos, offset, 20, 20, sphere_red)
	cam.End3D()
end

local layerTables = {"VElements", "WElements", "VBoneMods"}

function SWEP:DebugAnimationState()
	local name = self:GetAnimationName()
	local anim = self.Animations[name]

	if not anim then
		sg.DrawDebugText("Animation: *NONE*", 4)
		return
	end

	sg.DrawDebugText(string.format("Animation: %s", name), 4)
	sg.DrawDebugText(string.format("Cycle: %.3f", self:GetAnimationCycle()), 5)

	sg.DrawDebugText("Events:", 6)

	local index = 7

	for frame, events in SortedPairs(anim.Events) do
		for _, event in ipairs(events) do
			sg.DrawDebugText(string.format("\t[%.3f]: %s(%s)", frame, event[1], event[2]), index)
			index = index + 1
		end
	end

	sg.DrawDebugText("Layers:", index)
	index = index + 1

	for _, tab in ipairs(layerTables) do
		local count = 0

		for _, layers in pairs(anim[tab]) do
			count = count + table.Count(layers)
		end

		if count > 0 then
			sg.DrawDebugText(string.format("\t%s: %i", tab, count), index)
			index = index + 1
		end
	end
end

function SWEP:DrawDebugHUD()
	self:DebugWeaponStats()
	self:DebugAnimationState()
end

function SWEP:DrawHUDBackground()
	if developerMode:GetBool() then
		self:DrawDebugHUD()
	end
end
