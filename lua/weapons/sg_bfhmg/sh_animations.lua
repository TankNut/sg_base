local reload = sg.Animation.WeaponSequence(ACT_VM_RELOAD)
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)
reload:AddEvent(0, "Sound", "Weapon_AR2.Reload_Push")

if CLIENT then
	local defaultPos = SWEP.ViewModelBoneMods.Base.pos
	local lowerPos = Vector(-5.030, 0, -0.719)

	local defaultAngle = SWEP.ViewModelBoneMods.Base.angle
	local lowerAngle = Angle(36.647, 0, 19)

	reload:AddVBoneModLayer("Base", {
		[0]       = {pos = defaultPos, angle = defaultAngle, math.ease.InOutSine},
		[10 / 48] = {pos = lowerPos},
		[12 / 48] = {angle = lowerAngle},
		[36 / 48] = {pos = lowerPos, angle = lowerAngle},
		[46 / 48] = {pos = defaultPos},
		[1]       = {angle = defaultAngle}
	})
end



SWEP.Animations = {
	Reload = reload
}
