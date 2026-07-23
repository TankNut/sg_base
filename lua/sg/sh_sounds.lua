module("sg", package.seeall)

-- Standardized sound levels
LEVEL_MISC = 75
LEVEL_GUNFIRE = 105

sound.Add({
	name = "Weapon_SG.Empty",
	channel = CHAN_STATIC,
	volume = 0.7,
	level = LEVEL_MISC,
	pitch = 100,
	sound = ")weapons/pistol/pistol_empty.wav"
})

sound.Add({
	name = "Weapon_SG.Pump",
	channel = CHAN_STATIC,
	volume = 0.7,
	level = LEVEL_MISC,
	pitch = 100,
	sound = ")weapons/shotgun/shotgun_cock.wav"
})

