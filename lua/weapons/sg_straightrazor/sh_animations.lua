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

		local p = sin(-1, 1, cycle * 2)

		matrix:Identity()
		matrix:Translate(Vector(0, y, z))

		sg.RotateAroundPivot(matrix, Angle(p), Vector(15, 0, -8))

		return matrix:GetTranslation(), matrix:GetAngles()
	end)
end



local reload = sg.Animation.WeaponSequence(ACT_VM_RELOAD2)
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)
reload:AddEvent(27 / 111, "Sound", "Weapon_357.OpenLoader")
reload:AddEvent(38 / 111, "Sound", "Weapon_357.RemoveLoader")
reload:AddEvent(67 / 111, "Sound", "Weapon_357.ReplaceLoader")
reload:AddEvent(92 / 111, "Sound", "Weapon_357.Spin")

SWEP.Animations = {
	Reload = reload,
	Idle = idle
}
