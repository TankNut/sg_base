AddCSLuaFile()

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
end



SWEP.Animations = {
	Reload = reload
}
