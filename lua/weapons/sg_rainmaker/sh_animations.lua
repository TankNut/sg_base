AddCSLuaFile()

local primary = sg.Animation.Weapon(SWEP.Delay)
primary:AddEvent(0, "VMSequence", ACT_VM_PRIMARYATTACK)
primary:AddEvent(0, "PlayerAnimation", PLAYER_ATTACK1)

if CLIENT then
	primary:AddElementLayer("boltpull", {
		[1 / 7] = {pos2 = Vector(0, -3, 0), math.ease.InSine},
		[1]     = {pos2 = vector_origin}
	})
end



local reload = sg.Animation.WeaponSequence(ACT_VM_RELOAD)
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)

if CLIENT then
	reload:AddElementLayer("boltpull", {
		[0]       = {pos2 = vector_origin},
		[2 / 46]  = {pos2 = Vector(0, -3, 0)},
		[43 / 46] = {pos2 = Vector(0, -3, 0)},
		[1]       = {pos2 = vector_origin}
	})
end



SWEP.Animations = {
	Primary = primary,
	Reload = reload
}
