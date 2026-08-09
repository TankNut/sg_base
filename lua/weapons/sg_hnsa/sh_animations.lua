AddCSLuaFile()

local reload = sg.Animation.WeaponSequence(ACT_VM_RELOAD)
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)
reload:AddEvent(3 / 55, "Sound", "weapons/aug/aug_boltpull.wav")
reload:AddEvent(15 / 55, "Sound", "weapons/awp/awp_clipout.wav")
reload:AddEvent(25 / 55, "Sound", "weapons/sg552/sg552_clipin.wav")
reload:AddEvent(45 / 55, "Sound", "weapons/sg552/sg552_boltpull.wav")

SWEP.Animations = {
	Reload = reload
}
