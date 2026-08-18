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

		sg.RotateAroundPivot(matrix, Angle(p), Vector(10, 0, 0))

		return matrix:GetTranslation(), matrix:GetAngles()
	end)
end


local primary = sg.Animation.Weapon(SWEP.Delay)
primary:AddEvent(0, "VMSequence", ACT_VM_PRIMARYATTACK)
primary:AddEvent(0, "PlayerAnimation", PLAYER_ATTACK1)

if CLIENT then
	primary:AddElementLayer("boltpull", {
		[1 / 7] = {pos2 = Vector(0, 3, 0), math.ease.InSine},
		[1]     = {pos2 = vector_origin}
	})
end



local reload = sg.Animation.WeaponSequence(ACT_VM_RELOAD)
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)

if CLIENT then
	reload:AddElementLayer("boltpull", {
		[0]       = {pos2 = vector_origin},
		[2 / 46]  = {pos2 = Vector(0, 2.5, 0)},
		[43 / 46] = {pos2 = Vector(0, 2.5, 0)},
		[1]       = {pos2 = vector_origin}
	})

	reload:AddVBoneModLayer("ValveBiped.Bip01_L_Clavicle", {
		[30 / 171] = {pos = vector_origin},
		[120 / 171] = {pos = vector_origin},
	})
end



SWEP.Animations = {
	Idle = idle,
	Primary = primary,
	Reload = reload
}
