AddCSLuaFile()

SWEP.UseHands = true
SWEP.ViewModel = Model("models/weapons/c_irifle.mdl")
SWEP.WorldModel = Model("models/weapons/w_irifle.mdl")

SWEP.ViewModelAttachments = {
	Muzzle = {
		Attachment = "muzzle",
		Pos = Vector(5.8, 0, 0),
		Angle = Angle(0, 0, -90)
	}
}

SWEP.WorldModelAttachments = {
	Muzzle = {
		Attachment = "muzzle",
		Pos = Vector(1.7, 0.1, 0.6),
		Angle = Angle(0, 0, 3)
	}
}

if SERVER then
	return
end

SWEP.ViewModelFOV = 54
SWEP.ViewModelFlip = false

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

SWEP.VElements = {
	["ammo"] = { type = "Model", model = "models/Items/BoxSRounds.mdl", bone = "Base", rel = "body", pos = Vector(-10, -12.105, 1.579), angle = Angle(0, -90, -90), size = Vector(0.7, 0.7, 0.7), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["barel ext"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "Base", rel = "body", pos = Vector(-0.5, -11.053, 0), angle = Angle(0, 0, 90), size = Vector(0.044, 0.044, 0.24), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["battery"] = { type = "Model", model = "models/Items/battery.mdl", bone = "Base", rel = "body", pos = Vector(0, -1.579, 0), angle = Angle(90, 0, -90), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["bayonet"] = { type = "Model", model = "models/weapons/w_knife_ct.mdl", bone = "Base", rel = "", pos = Vector(0, 9, 20.26), angle = Angle(25, 90, 0), size = Vector(1.2, 1.2, 1.2), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["body"] = { type = "Model", model = "models/Items/car_battery01.mdl", bone = "Base", rel = "", pos = Vector(0, -0.4, 2.632), angle = Angle(0, 90, 90), size = Vector(0.19, 0.19, 0.19), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["lower"] = { type = "Model", model = "models/props_lab/tpplugholder_single.mdl", bone = "Base", rel = "body", pos = Vector(-0.526, 2, 0.526), angle = Angle(180, 0, 0), size = Vector(0.24, 0.503, 0.09), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["mech"] = { type = "Model", model = "models/props_lab/reciever01b.mdl", bone = "Base", rel = "body", pos = Vector(1, -10, -0.11), angle = Angle(90, 0, -180), size = Vector(0.1, 0.503, 0.174), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["pullback"] = { type = "Model", model = "models/props_wasteland/tram_lever01.mdl", bone = "Bolt2", rel = "", pos = Vector(0.519, -0.3, -0.519), angle = Angle(0, -59.61, -90), size = Vector(0.107, 0.2, 0.042), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["sight"] = { type = "Model", model = "models/props_wasteland/interior_fence002e.mdl", bone = "Base", rel = "sightbase", pos = Vector(1.2, 0, 0), angle = Angle(-90, 0, 0), size = Vector(0.014, 0.01, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["sightbase"] = { type = "Model", model = "models/props_interiors/VendingMachineSoda01a.mdl", bone = "Base", rel = "body", pos = Vector(2, 0.2, 0), angle = Angle(0, 0, 90), size = Vector(0.03, 0.016, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["toprail"] = { type = "Model", model = "models/props_interiors/Radiator01a.mdl", bone = "Base", rel = "body", pos = Vector(1.4, -4.675, 0), angle = Angle(0, 0, 0), size = Vector(0.17, 0.17, 0.01), color = Color(42, 41, 65, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["ammo"] = { type = "Model", model = "models/Items/BoxSRounds.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "body", pos = Vector(-12, -16, 3), angle = Angle(0, -90, -90), size = Vector(0.7, 0.7, 0.7), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["barel ext"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "body", pos = Vector(-0.5, -11.053, 0), angle = Angle(0, 0, 90), size = Vector(0.044, 0.044, 0.24), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["battery"] = { type = "Model", model = "models/Items/battery.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "body", pos = Vector(0, -1.579, 0), angle = Angle(90, 0, -90), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["bayonet"] = { type = "Model", model = "models/weapons/w_knife_ct.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(27.532, 1.24, -3), angle = Angle(-78.312, 0, 0), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["body"] = { type = "Model", model = "models/Items/car_battery01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.558, 1, -5), angle = Angle(-103, 0, 90), size = Vector(0.19, 0.19, 0.19), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["lower"] = { type = "Model", model = "models/props_lab/tpplugholder_single.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "body", pos = Vector(-0.526, 2, 0.526), angle = Angle(180, 0, 0), size = Vector(0.24, 0.503, 0.09), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["mech"] = { type = "Model", model = "models/props_lab/reciever01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "body", pos = Vector(1, -10, -0.11), angle = Angle(90, 0, -180), size = Vector(0.1, 0.503, 0.174), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["pullback"] = { type = "Model", model = "models/props_wasteland/tram_lever01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barel ext", pos = Vector(1, -1, 2.597), angle = Angle(0, -50, -87.662), size = Vector(0.107, 1.08, 0.042), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["sight"] = { type = "Model", model = "models/props_wasteland/interior_fence002e.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sightbase", pos = Vector(1.2, 0, 0), angle = Angle(-90, 0, 0), size = Vector(0.014, 0.01, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["sightbase"] = { type = "Model", model = "models/props_interiors/VendingMachineSoda01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "body", pos = Vector(2, 0.2, 0), angle = Angle(0, 0, 90), size = Vector(0.03, 0.016, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["toprail"] = { type = "Model", model = "models/props_interiors/Radiator01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "body", pos = Vector(1.4, -4.675, 0), angle = Angle(0, 0, 0), size = Vector(0.17, 0.17, 0.01), color = Color(42, 41, 65, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.ViewModelBoneMods = {
	["Base"] = { scale = Vector(1, 1, 1), pos = Vector(-3.952, 0, 0), angle = Angle(0, 0, 0) },
}
