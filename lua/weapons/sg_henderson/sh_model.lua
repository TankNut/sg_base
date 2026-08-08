AddCSLuaFile()

SWEP.UseHands = true
SWEP.ViewModel = Model("models/weapons/c_shotgun.mdl")
SWEP.WorldModel = Model("models/weapons/w_shotgun.mdl")

if SERVER then
	return
end

SWEP.ViewModelFOV = 54
SWEP.ViewModelFlip = false
SWEP.ViewModelOffset = Vector(-5, 3, 1.2)

SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

SWEP.VElements = {
	["barrel"] = { type = "Model", model = "models/props_junk/propane_tank001a.mdl", bone = "ValveBiped.Gun", rel = "front body", pos = Vector(-0.949, 0, -2.175), angle = Angle(0, -90, -2.264), size = Vector(0.15, 0.15, 0.25), color = Color(216, 215, 215, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/customs/gunmetal3", skin = 0, bodygroup = {} },
	["bolt"] = { type = "Model", model = "models/props_junk/meathook001a.mdl", bone = "ValveBiped.Gun", rel = "bolt top", pos = Vector(0.03, -6.39, 2.38), angle = Angle(0, 0, -63.396), size = Vector(0.15, 0.15, 0.15), color = Color(200, 255, 250, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["bolt clip"] = { type = "ClipPlane", bone = "ValveBiped.Gun", rel = "bolt", pos = Vector(-0.8, -2.34, -3.67), angle = Angle(180, 0, 34.491)},
	["bolt top"] = { type = "Model", model = "models/props_combine/combine_train02a.mdl", bone = "ValveBiped.Gun", rel = "under", pos = Vector(0.75998, -6e-05, -0.71001), angle = Angle(1e-05, 89.99994, -180), size = Vector(0.025, 0.016, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["bolt top clip"] = { type = "ClipPlane", bone = "ValveBiped.Gun", rel = "bolt top", pos = Vector(-1.32, -3.68, 0.95), angle = Angle(0, 0, 0)},
	["drum"] = { type = "Model", model = "models/props_vehicles/carparts_wheel01a.mdl", bone = "ValveBiped.Gun", rel = "midcover", pos = Vector(0.03, -3.75, -5.3), angle = Angle(0, 180, 0), size = Vector(0.23, 0.23, 0.23), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["front body"] = { type = "Model", model = "models/props/cs_office/trash_can_p.mdl", bone = "ValveBiped.Gun", rel = "midcover", pos = Vector(-0.098, -17.814, -0.763), angle = Angle(87.736, -89.996, 179.996), size = Vector(0.27, 0.145, 0.58), color = Color(131, 131, 131, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["front body clip"] = { type = "ClipPlane", bone = "ValveBiped.Gun", rel = "front body", pos = Vector(0, -1.048, 1.68), angle = Angle(-2.156, 0, 0)},
	["frontend"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "ValveBiped.Gun", rel = "front body", pos = Vector(0.035, 0.078, 1.9), angle = Angle(0, -90, 177.752), size = Vector(0.042, 0.035, 0.038), color = Color(106, 113, 116, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/customs/gunmetal6", skin = 0, bodygroup = {} },
	["grip"] = { type = "Model", model = "models/weapons/w_mach_m249para.mdl", bone = "ValveBiped.Gun", rel = "under", pos = Vector(7.31009, -0.29004, 8.61999), angle = Angle(5e-05, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["grip clip1"] = { type = "ClipPlane", bone = "ValveBiped.Gun", rel = "grip", pos = Vector(-3.86, 0, 0), angle = Angle(90, 0, 0)},
	["grip clip2"] = { type = "ClipPlane", bone = "ValveBiped.Gun", rel = "grip", pos = Vector(3.69, -0.69, 14.53), angle = Angle(-150.89799, 0, 0)},
	["midcover"] = { type = "Model", model = "models/items/ammocrate_buckshot.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0.03, 0, -4.45), angle = Angle(0, -180, 90), size = Vector(0.08, 0.19, 0.1), color = Color(88, 97, 142, 255), surpresslightning = false, bonemerge = false, highrender = true, nocull = false, material = "", skin = 0, bodygroup = {} },
	["middle"] = { type = "Model", model = "models/props_interiors/refrigerator01a.mdl", bone = "ValveBiped.Gun", rel = "midcover", pos = Vector(0.03, 0, -0.3), angle = Angle(90, -90, 0), size = Vector(0.11, 0.072, 0.143), color = Color(43, 50, 59, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["rear sight"] = { type = "Model", model = "models/props_trainstation/mount_connection001a.mdl", bone = "ValveBiped.Gun", rel = "midcover", pos = Vector(0.03, 5.2, 2), angle = Angle(-0.016, -90, 180), size = Vector(0.034, 0.034, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["sight"] = { type = "Model", model = "models/props_trainstation/mount_connection001a.mdl", bone = "ValveBiped.Gun", rel = "midcover", pos = Vector(-0.022, -16.8, 2.197), angle = Angle(-0.016, -90, 180), size = Vector(0.02, 0.04, 0.06), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["stock"] = { type = "Model", model = "models/weapons/cstrike/c_shot_m3super90.mdl", bone = "ValveBiped.Gun", rel = "under", pos = Vector(-23.29, 11.439, -11.226), angle = Angle(6.792, 0, 180), size = Vector(1.5, 1.5, 1.5), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["stock clip 2"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_Spine4", rel = "stock", pos = Vector(20.611, -8.98, -7.278), angle = Angle(90, 0, 0)},
	["stock clip1"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_Spine4", rel = "stock", pos = Vector(22.995, -9.49, -9.783), angle = Angle(21.557, 0, 0)},
	["under"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Gun", rel = "midcover", pos = Vector(0, 1.1, 0), angle = Angle(0, 90, -180), size = Vector(0.168, 0.212, 0.23), color = Color(104, 119, 131, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/customs/gunmetal1", skin = 0, bodygroup = {} }
}
 
SWEP.WElements = {
	["barrel"] = { type = "Model", model = "models/props_junk/propane_tank001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "front body", pos = Vector(-0.949, 0.055, -2.175), angle = Angle(0, -90, -2.264), size = Vector(0.15, 0.15, 0.25), color = Color(216, 215, 215, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/customs/gunmetal3", skin = 0, bodygroup = {} },
	["bolt"] = { type = "Model", model = "models/props_junk/meathook001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bolt top", pos = Vector(0.03, -6.39, 2.38), angle = Angle(0, 0, -63.396), size = Vector(0.15, 0.15, 0.15), color = Color(200, 255, 250, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["bolt clip"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_R_Hand", rel = "bolt", pos = Vector(-0.8, -2.34, -3.67), angle = Angle(180, 0, 34.491)},
	["bolt top"] = { type = "Model", model = "models/props_combine/combine_train02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "under", pos = Vector(0.76, 0, -0.71), angle = Angle(0, 90, -180), size = Vector(0.025, 0.016, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["bolt top clip"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_R_Hand", rel = "bolt top", pos = Vector(-1.085, -3.691, 0.723), angle = Angle(0, 0, 0)},
	["drum"] = { type = "Model", model = "models/props_vehicles/carparts_wheel01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "midcover", pos = Vector(0.03, -3.75, -5.3), angle = Angle(0, 180, 0), size = Vector(0.23, 0.23, 0.23), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["front body"] = { type = "Model", model = "models/props/cs_office/trash_can_p.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "midcover", pos = Vector(-0.098, -17.814, -0.763), angle = Angle(87.736, -89.996, 179.996), size = Vector(0.27, 0.145, 0.58), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["front body clip"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_R_Hand", rel = "front body", pos = Vector(0, -1.048, 1.68), angle = Angle(-2.156, 0, 0)},
	["frontend"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "front body", pos = Vector(0.045, 0.078, 1.72), angle = Angle(0, -90, 177.752), size = Vector(0.042, 0.035, 0.038), color = Color(106, 113, 116, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/customs/gunmetal6", skin = 0, bodygroup = {} },
	["grip"] = { type = "Model", model = "models/weapons/w_mach_m249para.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "under", pos = Vector(7.31, -0.29, 8.62), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["grip clip1"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_R_Hand", rel = "grip", pos = Vector(-3.86, 0, 0), angle = Angle(90, 0, 0)},
	["grip clip2"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_R_Hand", rel = "grip", pos = Vector(3.69, -0.69, 14.53), angle = Angle(-150.89799, 0, 0)},
	["midcover"] = { type = "Model", model = "models/items/ammocrate_buckshot.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.605, 1.269, -5.207), angle = Angle(-3.837, 91.672, -172.912), size = Vector(0.08, 0.19, 0.1), color = Color(88, 97, 142, 255), surpresslightning = false, bonemerge = false, highrender = true, nocull = false, material = "", skin = 0, bodygroup = {} },
	["middle"] = { type = "Model", model = "models/props_interiors/refrigerator01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "midcover", pos = Vector(0.03, 0, -0.3), angle = Angle(90, -90, 0), size = Vector(0.11, 0.072, 0.143), color = Color(43, 50, 59, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["rear sight"] = { type = "Model", model = "models/props_trainstation/mount_connection001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "midcover", pos = Vector(0.03, 5.2, 2), angle = Angle(-0.016, -90, 180), size = Vector(0.034, 0.034, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["sight"] = { type = "Model", model = "models/props_trainstation/mount_connection001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "midcover", pos = Vector(-0.022, -16.8, 2.197), angle = Angle(-0.016, -90, 180), size = Vector(0.02, 0.04, 0.06), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["stock"] = { type = "Model", model = "models/weapons/w_shot_m3super90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "under", pos = Vector(9.25, -0.119, 8.629), angle = Angle(6.792, 0, 180), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["stock clip 1"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_R_Hand", rel = "stock", pos = Vector(-15.606, 1.032, 3.863), angle = Angle(-129.341, 0, -180)},
	["stock clip 2"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_R_Hand", rel = "stock", pos = Vector(-13.984, 0.862, 4.064), angle = Angle(-84.072, 0, -180)},
	["under"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "midcover", pos = Vector(0, 1.1, 0), angle = Angle(0, 90, -180), size = Vector(0.168, 0.212, 0.23), color = Color(104, 119, 131, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/customs/gunmetal1", skin = 0, bodygroup = {} }
}

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_Clavicle"] = { scale = Vector(1, 1, 1), pos = Vector(0.359, 9.341, 0.359), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(15.09, 0, 0) },
	["ValveBiped.Pump"] = { scale = Vector(0.01, 0.01, 0.01), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
}
