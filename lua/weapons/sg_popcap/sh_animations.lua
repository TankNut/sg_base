AddCSLuaFile()

local primary = sg.Animation.Weapon(0.3)
primary:AddEvent(0, "PlayerAnimation", PLAYER_ATTACK1)

if CLIENT then
	primary:AddVBoneModLayer("ValveBiped.Bip01_R_Hand", {
		[0]       = {angle = angle_zero},
		[12 / 30] = {angle = Angle(-12, 0, 0)},
		[21 / 30] = {angle = Angle(33, 0, 0)},
		[1]       = {angle = angle_zero},
	})

	primary:AddVBoneModLayer("ValveBiped.Bip01_Spine4", {
		[0]       = {pos = vector_origin},
		[12 / 30] = {pos = Vector(-3.5, 0, 1)},
		[21 / 30] = {pos = Vector(-3.5, 0, 1)},
		[1]       = {pos = vector_origin},
	})

	primary:AddVElementLayer("HammerAxis", {
		[0]       = {angle2 = angle_zero},
		[1 / 30]  = {angle2 = Angle(0, 45, 0)},
		[12 / 30] = {angle2 = Angle(0, 45, 0)},
		[1]       = {angle2 = angle_zero},
	})
end



local reload = sg.Animation.Weapon(2.06)
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)

reload:AddEvent(27 / 206, "Sound", "arw_weapon_popcap_open")
reload:AddEvent(91 / 206, "Sound", "arw_weapon_popcap_load")
reload:AddEvent(178 / 206, "Sound", "arw_weapon_popcap_close")

if CLIENT then
	--[[
			[0]  = {}, -- 9
			[12 / 206] = {}, -- 16
			[27 / 206] = {},
			[42 / 206] = {},
			[54 / 206] = {}, -- 12
			[69 / 206] = {},
			[91 / 206] = {}, -- 16
			[101 / 206] = {}, -- 9
			[113 / 206] = {},
			[124 / 206] = {}, -- 2
			[134 / 206] = {}, -- 12
			[146 / 206] = {}, -- 19
			[166 / 206] = {}, -- 22
			[178 / 206] = {},
			[191 / 206] = {},
			[1] = {},
	]]

	reload:AddVElementLayer("AXIS", {
		[0] =         {angle2 = angle_zero, math.ease.OutSine}, -- 9
		[27 / 206] =  {angle2 = angle_zero},
		[42 / 206] =  {angle2 = Angle(0, -55, 0)},
		[166 / 206] = {angle2 = Angle(0, -55, 0)}, -- 22
		[178 / 206] = {angle2 = angle_zero},
		[1] =         {angle2 = angle_zero},
	})

	reload:AddVBoneModLayer("ValveBiped.Bip01_L_UpperArm", {
		[54 / 206] =  {pos = vector_origin,         angle = angle_zero, math.ease.OutSine}, -- 12
		[69 / 206] =  {pos = Vector(-2, -2, 5.365), angle = Angle(0, -115, 0)},
		[124 / 206] = {pos = Vector(-2, -2, 5.365), angle = Angle(0, -115, 0)}, -- 2
		[134 / 206] = {pos = vector_origin,         angle = angle_zero}, -- 12
	})

	reload:AddVBoneModLayer("ValveBiped.Bip01_L_Forearm", {
		[54 / 206] =  {angle = angle_zero, math.ease.OutSine}, -- 12
		[69 / 206] =  {angle = Angle(14, 29.5, 59)},
		[91 / 206] =  {angle = Angle(19.7, 54, 59)}, -- 16
		[101 / 206] = {angle = Angle(19.7, 54, 59)}, -- 9
		[113 / 206] = {angle = Angle(19.7, 54, 59)},
		[124 / 206] = {angle = Angle(19.6, 48, 59)}, -- 2
		[134 / 206] = {angle = Angle(19.6, 48, 59)}, -- 12
		[146 / 206] = {angle = Angle(19.6, 48, 59)}, -- 19
		[166 / 206] = {angle = Angle(19.6, 48, 59)}, -- 22
		[178 / 206] = {angle = Angle(19.6, 48, 59)},
		[191 / 206] = {angle = Angle(19.6, 48, 59)},
		[1] =         {angle = angle_zero},
	})

	reload:AddVBoneModLayer("ValveBiped.Bip01_L_Hand", {
		[54 / 206] =  {angle = angle_zero, math.ease.OutSine}, -- 12
		[69 / 206] =  {angle = Angle(0, 20, 0)},
		[91 / 206] =  {angle = angle_zero}, -- 16
		[113 / 206] = {angle = angle_zero},
		[124 / 206] = {angle = Angle(0, 20, 0)}, -- 2
		[134 / 206] = {angle = Angle(0, 20, 0)}, -- 12
		[146 / 206] = {angle = Angle(0, 20, 0)}, -- 19
		[166 / 206] = {angle = Angle(0, 20, 0)}, -- 22
		[178 / 206] = {angle = Angle(0, 20, 0)},
		[191 / 206] = {angle = Angle(0, 20, 0)},
		[1] =         {angle = angle_zero},
	})

	reload:AddVBoneModLayer("ValveBiped.Bip01_R_Hand", {
		[0] =         {angle = angle_zero, math.ease.OutSine}, -- 9
		[12 / 206] =  {angle = Angle(22,0,0)}, -- 16
		[27 / 206] =  {angle = Angle(-12,0,0)},
		[42 / 206] =  {angle = angle_zero},
		[54 / 206] =  {angle = angle_zero}, -- 12
		[69 / 206] =  {angle = Angle(0,-15,-15)},
		[101 / 206] = {angle = Angle(0,-15,-15)}, -- 9
		[113 / 206] = {angle = Angle(-2,-15,-15)},
		[124 / 206] = {angle = Angle(0,-15,-15)}, -- 2
		[146 / 206] = {angle = Angle(0,-15,-15)}, -- 19
		[166 / 206] = {angle = Angle(-30,0,0)}, -- 22
		[178 / 206] = {angle = Angle(28,0,0)},
		[191 / 206] = {angle = Angle(28,0,0)},
		[1] =         {angle = angle_zero},
	})

	reload:AddVBoneModLayer("ValveBiped.Bip01_Spine4", {
		[0 / 206]  =  {pos = vector_origin,      angle = angle_zero, math.ease.OutSine}, -- 9
		[12 / 206] =  {pos = Vector(1.5, 0, -5), angle = Angle(0, -12, 0)}, -- 16
		[27 / 206] =  {pos = Vector(1.5, 0, 1),  angle = Angle(0, 9, 0)},
		[42 / 206] =  {pos = vector_origin,      angle = angle_zero},
		[91 / 206] =  {                          angle = angle_zero}, -- 16
		[101 / 206] = {                          angle = Angle(2.5, 1.8, 0)}, -- 9
		[113 / 206] = {                          angle = angle_zero},
	})
end



SWEP.Animations = {
	Primary = primary,
	Reload = reload
}
