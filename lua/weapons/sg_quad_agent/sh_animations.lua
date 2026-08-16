AddCSLuaFile()

local reload = sg.Animation.WeaponSequence(ACT_VM_RELOAD)
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)
reload:AddEvent(27 / 111, "Sound", "Weapon_357.OpenLoader")
reload:AddEvent(38 / 111, "Sound", "Weapon_357.RemoveLoader")
reload:AddEvent(67 / 111, "Sound", "Weapon_357.ReplaceLoader")
reload:AddEvent(92 / 111, "Sound", "Weapon_357.Spin")

SWEP.Animations = {
	Reload = reload
}
