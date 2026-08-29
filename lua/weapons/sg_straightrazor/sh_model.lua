AddCSLuaFile()

SWEP.UseHands = true
SWEP.ViewModel = Model("models/sg/weapons/sunrust/c_357.mdl")
SWEP.WorldModel = Model("models/weapons/w_357.mdl")

SWEP.ViewModelAttachments = {
	Muzzle = {
		Attachment = "muzzle"
	}
}

SWEP.WorldModelAttachments = {
	Muzzle = {
		Attachment = "muzzle"
	}
}

if SERVER then
	return
end

SWEP.ViewModelFOV = 54
SWEP.ViewModelFlip = false

SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.ViewModelOffset = Vector(3, 0, 0.5)

SWEP.VElements = {
	["back sight"] = { type = "Model", model = "models/props_wasteland/light_spotlight02_base.mdl", bone = "Python", rel = "top frame", pos = Vector(-7.209, -0.281, 0.025), angle = Angle(0, 0, -90), size = Vector(0.16, 0.1, 0.06), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/metal/metalfloor005a", skin = 0, bodygroup = {} },
	["barrel"] = { type = "Model", model = "models/props_mining/pipe_goopit01.mdl", bone = "Python", rel = "", pos = Vector(0, -0.833, 5.489), angle = Angle(90, 0, 0), size = Vector(0.015, 0.012, 0.012), color = Color(170, 151, 145, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["blade"] = { type = "Model", model = "models/weapons/w_knife_ct.mdl", bone = "Python", rel = "bottom wood", pos = Vector(-3.779, -4.863, -0.031), angle = Angle(0, -24.906, 90), size = Vector(1.085, 0.5, 1.085), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = true, material = "models/sg/customs/gunmetal4", skin = 0, bodygroup = {} },
	["blade clip"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_Spine4", rel = "blade", pos = Vector(2.806, -0.181, 4.508), angle = Angle(-43.114, 0, 0)},
	["body 1"] = { type = "Model", model = "models/sg/weapons/sunrust/c_357.mdl", bone = "Python", rel = "", pos = Vector(3.838, 3.944, -29.147), angle = Angle(10.763, 91.102, 89.786), size = Vector(0.5, 0.5, 0.5), color = Color(163, 140, 132, 255), surpresslightning = false, bonemerge = true, highrender = false, nocull = true, material = "", skin = 0, bodygroup = {} },
	["body clip"] = { type = "ClipPlane", bone = "Python", rel = "body 1", pos = Vector(9.977, -29.758, -1.189), angle = Angle(90, 79.76, 0)},
	["bottom frame"] = { type = "Model", model = "models/props_junk/ibeam01a.mdl", bone = "Python", rel = "barrel", pos = Vector(-0.022, 0.488, 0), angle = Angle(0, 0, 180), size = Vector(0.04, 0.04, 0.06), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/metal/metalwall085a", skin = 0, bodygroup = {} },
	["bottom wood"] = { type = "Model", model = "models/props_forest/axe.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "bottom frame", pos = Vector(-0.53, -0.27, 0), angle = Angle(-180, -95.094, 180), size = Vector(-0.7, -0.27, -0.466), color = Color(172, 149, 135, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = true, material = "models/sg/wood/offdra", skin = 0, bodygroup = {} },
	["cyl"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "Cylinder", rel = "", pos = Vector(0, 0, -0.21), angle = Angle(0, 180, 180), size = Vector(0.044, 0.044, 0.051), color = Color(255, 203, 171, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/metal/metalfloor005a", skin = 0, bodygroup = {} },
	["front sight"] = { type = "Model", model = "models/props_mining/railroad_spike01.mdl", bone = "Python", rel = "wood top", pos = Vector(3.669, 0, 0.03), angle = Angle(-90, 0, 180), size = Vector(0.04, 0.04, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["rail thing"] = { type = "Model", model = "models/props_junk/wood_crate002a.mdl", bone = "Python", rel = "top frame", pos = Vector(-5.21, -0.14, 0), angle = Angle(-90, -90, 0), size = Vector(0.019, 0.05, 0.01), color = Color(193, 173, 173, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["screw l1"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "bottom wood", pos = Vector(0.288, 0.328, 0.123), angle = Angle(0, 4.528, 90), size = Vector(0.04, 0.04, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["screw l1+"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "wood top", pos = Vector(-0.44, 0, 0.04), angle = Angle(0, 0, -90), size = Vector(0.04, 0.01, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["screw l1++"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "wood top", pos = Vector(2.67, 0, 0.04), angle = Angle(0, 0, -90), size = Vector(0.04, 0.01, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["screw l2"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "bottom wood", pos = Vector(0.529, 3.404, 0.19), angle = Angle(0, 4.528, 90), size = Vector(0.04, 0.04, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["screw r1"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "bottom wood", pos = Vector(0.288, 0.328, -0.123), angle = Angle(0, 4.528, -90), size = Vector(0.04, 0.04, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["screw r2"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "bottom wood", pos = Vector(0.529, 3.404, -0.19), angle = Angle(0, 4.528, -90), size = Vector(0.04, 0.04, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["top frame"] = { type = "Model", model = "models/props_junk/ibeam01a.mdl", bone = "Python", rel = "barrel", pos = Vector(-0.022, -0.49, 0), angle = Angle(0, 0, 0), size = Vector(0.04, 0.04, 0.06), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/metal/metalwall085a", skin = 0, bodygroup = {} },
	["wood clip"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_Spine4", rel = "bottom wood", pos = Vector(-0.511, -3.478, -0.976), angle = Angle(0, -6.467, 90)},
	["wood clip+"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_Spine4", rel = "bottom wood", pos = Vector(-0.627, -3.499, -1.004), angle = Angle(0, 94.85, 90)},
	["wood top"] = { type = "Model", model = "models/props_phx/construct/wood/wood_boardx1.mdl", bone = "Python", rel = "top frame", pos = Vector(0.23, -0.28, 0), angle = Angle(0, 0, 90), size = Vector(0.157, 0.09, 0.09), color = Color(172, 149, 135, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/wood/offdra", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["back sight"] = { type = "Model", model = "models/props_wasteland/light_spotlight02_base.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "top frame", pos = Vector(-7.209, -0.281, 0.025), angle = Angle(0, 0, -90), size = Vector(0.16, 0.1, 0.06), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/metal/metalfloor005a", skin = 0, bodygroup = {} },
	["barrel"] = { type = "Model", model = "models/props_mining/pipe_goopit01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.141, 0.858, -4.725), angle = Angle(-3.816, 0.647, -86.783), size = Vector(0.015, 0.012, 0.012), color = Color(170, 151, 145, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["blade"] = { type = "Model", model = "models/weapons/w_knife_ct.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom wood", pos = Vector(-3.779, -4.863, -0.031), angle = Angle(0, -24.906, 90), size = Vector(1.085, 0.5, 1.085), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = true, material = "models/sg/customs/gunmetal4", skin = 0, bodygroup = {} },
	["blade clip"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_R_Hand", rel = "blade", pos = Vector(2.806, -0.181, 4.508), angle = Angle(-43.114, 0, 0)},
	["body 1"] = { type = "Model", model = "models/weapons/w_357.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrel", pos = Vector(-6.693, -24.716, -4.386), angle = Angle(82.418, -98.811, -85.143), size = Vector(0.5, 0.5, 0.5), color = Color(206, 168, 152, 255), surpresslightning = false, bonemerge = true, highrender = false, nocull = true, material = "", skin = 0, bodygroup = {} },
	["body clip"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_R_Hand", rel = "body 1", pos = Vector(8.595, -33.894, 5.143), angle = Angle(180, 90, 0)},
	["bottom frame"] = { type = "Model", model = "models/props_junk/ibeam01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrel", pos = Vector(-0.02193, 0.488, 0), angle = Angle(0, 1e-05, 180), size = Vector(0.04, 0.04, 0.06), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/metal/metalwall085a", skin = 0, bodygroup = {} },
	["bottom wood"] = { type = "Model", model = "models/props_forest/axe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom frame", pos = Vector(-0.53, -0.27, 0), angle = Angle(-180, -95.094, 180), size = Vector(-0.7, -0.27, -0.466), color = Color(172, 149, 135, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = true, material = "models/sg/wood/offdra", skin = 0, bodygroup = {} },
	["cyl"] = { type = "Model", model = "models/props_wasteland/laundry_basket001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrel", pos = Vector(-5.37095, 0.65499, 0.00201), angle = Angle(89.99998, 1e-05, 0), size = Vector(0.051, 0.051, 0.051), color = Color(255, 203, 171, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/metal/metalfloor005a", skin = 0, bodygroup = {} },
	["front sight"] = { type = "Model", model = "models/props_mining/railroad_spike01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "wood top", pos = Vector(3.669, 0, 0.03), angle = Angle(-90, 0, 180), size = Vector(0.04, 0.04, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["rail thing"] = { type = "Model", model = "models/props_junk/wood_crate002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "top frame", pos = Vector(-5.246, -0.127, -0.007), angle = Angle(-90, -90, 0), size = Vector(0.021, 0.05, 0.01), color = Color(193, 173, 173, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "", skin = 0, bodygroup = {} },
	["screw l1"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom wood", pos = Vector(0.288, 0.328, 0.123), angle = Angle(0, 4.528, 90), size = Vector(0.04, 0.04, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["screw l1+"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "wood top", pos = Vector(-0.44, 0, 0.04), angle = Angle(0, 0, -90), size = Vector(0.04, 0.01, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["screw l1++"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "wood top", pos = Vector(2.67, 0, 0.04), angle = Angle(0, 0, -90), size = Vector(0.04, 0.01, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["screw l2"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom wood", pos = Vector(0.529, 3.404, 0.19), angle = Angle(0, 4.528, 90), size = Vector(0.04, 0.04, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["screw r1"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom wood", pos = Vector(0.288, 0.328, -0.123), angle = Angle(0, 4.528, -90), size = Vector(0.04, 0.04, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["screw r2"] = { type = "Model", model = "models/props_wasteland/gear02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom wood", pos = Vector(0.529, 3.404, -0.19), angle = Angle(0, 4.528, -90), size = Vector(0.04, 0.04, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "metal2", skin = 0, bodygroup = {} },
	["top frame"] = { type = "Model", model = "models/props_junk/ibeam01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrel", pos = Vector(-0.02197, -0.48999, -6e-05), angle = Angle(0, 0, 0), size = Vector(0.04, 0.04, 0.06), color = Color(255, 255, 255, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/metal/metalwall085a", skin = 0, bodygroup = {} },
	["wood clip"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom wood", pos = Vector(-0.511, -3.478, -0.976), angle = Angle(0, -6.467, 90)},
	["wood clip+"] = { type = "ClipPlane", bone = "ValveBiped.Bip01_R_Hand", rel = "bottom wood", pos = Vector(-0.627, -3.499, -1.004), angle = Angle(0, 94.85, 90)},
	["wood top"] = { type = "Model", model = "models/props_phx/construct/wood/wood_boardx1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "top frame", pos = Vector(0.23, -0.28, 0), angle = Angle(0, 0, 90), size = Vector(0.157, 0.09, 0.09), color = Color(172, 149, 135, 255), surpresslightning = false, bonemerge = false, highrender = false, nocull = false, material = "models/sg/wood/offdra", skin = 0, bodygroup = {} }
}

SWEP.ViewModelBoneMods = {}
