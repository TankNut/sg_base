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

		local p = sin(-0.5, 0.5, cycle * 2)

		matrix:Identity()
		matrix:Translate(Vector(0, y, z))

		sg.RotateAroundPivot(matrix, Angle(p, 0, 0), Vector(10, 0, -6))

		return matrix:GetTranslation(), matrix:GetAngles()
	end)
end



local primary = sg.Animation.WeaponSequence("fire_sa")
primary:AddEvent(0, "PlayerAnimation", PLAYER_ATTACK1)
primary:AddEvent( 40 / 60, "Sound", "weapons/p228/p228_slidepull.wav")

local reload = sg.Animation.WeaponSequence("reload_sa")
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)
reload:AddEvent(7 / 111, "Sound", "weapons/usp/usp_slideback2.wav")
reload:AddEvent(27 / 111, "Sound", "Weapon_357.OpenLoader")
reload:AddEvent(38 / 111, "Sound", "weapons/p90/p90_clipout.wav")
reload:AddEvent(72 / 111, "Sound", "weapons/p90/p90_clipin.wav")
reload:AddEvent(92 / 111, "Sound", "weapons/p228/p228_slidepull.wav")

SWEP.Animations = {
	Deploy = sg.Animation.WeaponSequence("draw_sa"):AddEvent(10 / 60, "Sound", "weapons/p228/p228_slidepull.wav"),
	Primary = primary,
	Reload = reload,
	Idle = idle
}
