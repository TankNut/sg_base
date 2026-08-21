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

local reload = sg.Animation.WeaponSequence(ACT_VM_RELOAD)
reload:AddEvent(0, "PlayerAnimatioin", PLAYER_RELOAD)

if CLIENT then
	reload:AddVBoneModLayer("ValveBiped.Bip01_L_Clavicle", {
		[10 / 60] = {pos = Vector(0, 0, 0)},
		[48 / 60] = {pos = vector_origin},
	})
end

SWEP.Animations = {
	Idle = idle,
	Reload = reload
}
