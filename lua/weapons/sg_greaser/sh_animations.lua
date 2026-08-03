AddCSLuaFile()

local reload = sg.Animation.Weapon(1.6)
reload:AddEvent(0, "PlayerAnimation", PLAYER_RELOAD)

if CLIENT then
	reload:ImportKeyframes({
		[6 / 48] = {
			ViewModelBoneMods = {
				["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.359, 4.671), angle = Angle(-10.778, 2.156, 4.311) },
				["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-21.557, 15.09, 36.647) },
				["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -71.138, 0) },
				["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(4.311, 0, 0) },
				["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-17.246, 8.623, 0) },
				["ValveBiped.Bip01_R_Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 2.156, 0) },
				["ValveBiped.Bip01_R_Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 6.467, -19.401) },
				["ValveBiped.Bip01_R_Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-4.311, -12.934, 0) },
				["ValveBiped.Bip01_R_Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -23.713, 0) },
				["ValveBiped.Bip01_R_Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -38.802, 0) },
				["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 23.713) },
				["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(19.401, 0, 0) },
				["ValveBiped.base"] = { scale = Vector(1, 1, 1), pos = Vector(-0.359, 1.437, -1.437), angle = Angle(12.934, 15.09, -12.934) }
			},
			VElements = {
				["mag"] = { pos = Vector(0, 0.673, 4.483), angle = Angle(0, 180, 90) }
			}
		},
		[10 / 48] = {
			ViewModelBoneMods = {
				["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.359, 4.671), angle = Angle(10.778, -12.934, 17.246) },
				["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-21.557, 15.09, 36.647) },
				["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -71.138, 0) },
				["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(4.311, 0, 0) },
				["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-17.246, 8.623, 0) },
				["ValveBiped.Bip01_R_Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 2.156, 0) },
				["ValveBiped.Bip01_R_Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 6.467, -19.401) },
				["ValveBiped.Bip01_R_Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-4.311, -12.934, 0) },
				["ValveBiped.Bip01_R_Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -23.713, 0) },
				["ValveBiped.Bip01_R_Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -38.802, 0) },
				["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 23.713) },
				["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(19.401, 0, 0) },
				["ValveBiped.base"] = { scale = Vector(1, 1, 1), pos = Vector(-0.359, 1.078, -1.437), angle = Angle(12.934, 19.401, -8.623) }
			},
			VElements = {
				["mag"] = { pos = Vector(1.022, 2.743, 19.331), angle = Angle(0, 180, 90) }
			}
		},
		[24 / 48] = 10 / 48,
		[28 / 48] = {
			ViewModelBoneMods = {
				["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.359, 4.311), angle = Angle(-14.2, 10.778, 6) },
				["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-21.557, 15.09, 36.647) },
				["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -71.138, 0) },
				["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(4.311, 0, 0) },
				["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-17.246, 8.623, 0) },
				["ValveBiped.Bip01_R_Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 2.156, 0) },
				["ValveBiped.Bip01_R_Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 6.467, -19.401) },
				["ValveBiped.Bip01_R_Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-4.311, -12.934, 0) },
				["ValveBiped.Bip01_R_Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -23.713, 0) },
				["ValveBiped.Bip01_R_Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -38.802, 0) },
				["ValveBiped.Bip01_R_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 0, 23.713) },
				["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(30.18, 0, 0) },
				["ValveBiped.base"] = { scale = Vector(1, 1, 1), pos = Vector(-1.078, 2.156, -2.874), angle = Angle(12.934, 19.401, -25.868) }
			},
			VElements = {
				["mag"] = { pos = Vector(0, 0.673, 4.483), angle = Angle(0, 180, 90) }
			}
		},
		[29 / 48] = 28 / 48
	})
end



SWEP.Animations = {
	Reload = reload
}
