AddCSLuaFile()

local idle = sg.Animation.Weapon(10)

if CLIENT then
	local function sin(min, max, cycle)
		return math.Remap(math.sin((cycle % 1) * math.pi * 2), -1, 1, min, max)
	end

	local matrix = Matrix()

	idle:AddViewModelOffsets(function(ent, cycle)
		local y = sin(0, 0.05, cycle)
		local z = sin(0, 0.01, cycle)

		local p = sin(-0.1, 0.1, cycle * 2)

		matrix:Identity()
		matrix:Translate(Vector(0, y, z))

		sg.RotateAroundPivot(matrix, Angle(p, 0, 0), Vector(10, 0, 0))

		return matrix:GetTranslation(), matrix:GetAngles()
	end)
end



local reload = sg.Animation.WeaponSequence("reload_empty")
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)
reload:AddEvent(0 / 60, "Sound", "weapons/m4a1/m4a1_boltpull.wav")
reload:AddEvent(2 / 60, "Sound", "weapons/m4a1/m4a1_clipout.wav")
reload:AddEvent(22 / 60, "Sound", "weapons/m4a1/m4a1_clipin.wav")
reload:AddEvent(38 / 60, "Sound", "weapons/ump45/ump45_clipout.wav")
reload:AddEvent(48 / 60, "Sound", "weapons/ak47/ak47_boltpull.wav")



SWEP.Animations = {
	Deploy = sg.Animation.WeaponSequence(ACT_VM_DRAW):AddEvent(10 / 60, "Sound", "weapons/ak47/ak47_boltpull.wav"),
	Idle = idle,
	Reload = reload
}
