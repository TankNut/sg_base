module("sg", package.seeall)

-- Based on https://github.com/ValveSoftware/source-sdk-2013/blob/master/src/game/shared/hl2/hl2_gamerules.cpp#L1781-L1877
-- Need to massively divide the normal exaggeration value because gmod does some weird shit to bullet forces
local exaggeration = 3.5 / 500

-- Converts a velocity in ft/sec and a mass in grains to a source impulse (kg in/sec)
local function calculateImpulse(grains, ftpersec)
	local lbs = (0.002285 * grains) / 16
	local kg = lbs * (1 / 2.2)

	return ftpersec * 12 * kg * exaggeration
end

FORCE_DEFAULT = calculateImpulse(200, 1225) -- AR2, Pistol, SMG1
FORCE_357 = calculateImpulse(800, 5000) -- 357
FORCE_CROSSBOW = calculateImpulse(800, 8000) -- XBowBolt
FORCE_SHOTGUN = calculateImpulse(400, 1200) -- Buckshot
FORCE_DMR = calculateImpulse(150, 6000) -- SniperPenetratedRound
FORCE_SNIPER = calculateImpulse(650, 6000) -- SniperRound
FORCE_GAUSS = calculateImpulse(650, 8000) -- GaussEnergy
FORCE_COMBINECANNON = 1.5 * 750 * 12 -- CombineCannon
FORCE_AIRBOAT = calculateImpulse(10, 600) -- AirboatGun
