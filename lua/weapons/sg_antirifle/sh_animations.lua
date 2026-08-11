AddCSLuaFile()

local pump = sg.Animation.WeaponSequence(ACT_VM_RELOAD)
pump:AddEvent(29 / 56, "Sound", "Weapon_SG.Bolt")

if CLIENT then
	local offset = {pos = Vector(0, 0, -5), angle = Angle(5, 0, 0)}

	pump:AddViewModelOffsets({
		[0] = {math.ease.InOutSine},
		[11 / 56] = offset,
		[39 / 56] = offset,
		[50 / 56] = {pos = vector_origin, angle = angle_zero}
	})
end



local reload = sg.Animation.Weapon(2)
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)
reload:AddEvent(0, "VMSequence", ACT_VM_HOLSTER)
reload:AddEvent(15 / 60, "Sound", "weapons/aug/aug_boltpull.wav")
reload:AddEvent(28 / 60, "Sound", "weapons/awp/awp_clipout.wav")
reload:AddEvent(38 / 60, "VMSequence", ACT_VM_DRAW)
reload:AddEvent(43 / 60, "Sound", "weapons/sg552/sg552_clipin.wav")



SWEP.Animations = {
	Pump = pump,
	Reload = reload
}
