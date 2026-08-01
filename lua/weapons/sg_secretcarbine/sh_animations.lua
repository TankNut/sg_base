AddCSLuaFile()

-- This is my animation testing gun at the moment, so expect this to be a MESS. Other weapons will be cleaner I promise

local reload = sg.Animation.WeaponSequence(ACT_VM_RELOAD)
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)
reload:AddEvent(1 / 48, "Sound", "Weapon_AR2.Reload_Rotate")
reload:AddEvent(19 / 48, "Sound", "Weapon_AR2.Reload_Push")

if CLIENT then
	local defaultPos = SWEP.ViewModelBoneMods.Base.pos
	local lowerPos = Vector(0, 1, -5)

	local defaultAng = SWEP.ViewModelBoneMods.Base.angle
	local lowerAng = Angle(15, -5, -10)

	reload:AddVBoneModLayer("Base", {
		[0]       = {pos = defaultPos, angle = defaultAng, {pos = math.ease.InOutSine, angle = math.ease.InOutBack}},
		[10 / 48] = {pos = lowerPos, angle = lowerAng},
		[36 / 48] = {pos = lowerPos, angle = lowerAng, {angle = false}},
		[46 / 48] = {pos = defaultPos, angle = defaultAng},
	})

	-- reload:AddVElementLayer("screen", {
	-- 	[0] = {pos2 = Vector(), color = Color(255, 0, 0)},
	-- 	[0.5] = {pos2 = Vector(0, 0, 5)},
	-- 	[1] = {pos2 = Vector(), color = color_white}
	-- })

	-- reload:AddVElementLayer("screen", function(self, element, cycle)
	-- 	-- Full rotation in 1 cycle
	-- 	local rad = cycle * math.pi * 2

	-- 	local sine = -math.sin(rad) * 2
	-- 	local cose = -math.cos(rad) * 2

	-- 	return {
	-- 		pos2 = Vector(0, sine, 2 + cose),
	-- 		angle2 = Angle(0, 0, -cycle * 360)
	-- 	}
	-- end)

	reload:AddElementLayer("Laser", function(self, element, cycle)
		return {
			color = HSVToColor(cycle * 360, 1, 1)
		}
	end)
end

SWEP.Animations = {
	Reload = reload
}
