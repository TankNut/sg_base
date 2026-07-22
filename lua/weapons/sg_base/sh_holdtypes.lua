AddCSLuaFile()
DEFINE_BASECLASS("weapon_base")

local baseHoldtypes = {
	["pistol"]   = ACT_HL2MP_IDLE_PISTOL,
	["smg"]      = ACT_HL2MP_IDLE_SMG1,
	["grenade"]  = ACT_HL2MP_IDLE_GRENADE,
	["ar2"]      = ACT_HL2MP_IDLE_AR2,
	["shotgun"]  = ACT_HL2MP_IDLE_SHOTGUN,
	["rpg"]      = ACT_HL2MP_IDLE_RPG,
	["physgun"]  = ACT_HL2MP_IDLE_PHYSGUN,
	["crossbow"] = ACT_HL2MP_IDLE_CROSSBOW,
	["melee"]    = ACT_HL2MP_IDLE_MELEE,
	["slam"]     = ACT_HL2MP_IDLE_SLAM,
	["normal"]   = ACT_HL2MP_IDLE,
	["fist"]     = ACT_HL2MP_IDLE_FIST,
	["melee2"]   = ACT_HL2MP_IDLE_MELEE2,
	["passive"]  = ACT_HL2MP_IDLE_PASSIVE,
	["knife"]    = ACT_HL2MP_IDLE_KNIFE,
	["duel"]     = ACT_HL2MP_IDLE_DUEL,
	["camera"]   = ACT_HL2MP_IDLE_CAMERA,
	["magic"]    = ACT_HL2MP_IDLE_MAGIC,
	["revolver"] = ACT_HL2MP_IDLE_REVOLVER
}

local holdtypes = {}
local aiHoldtypes = {}

for k, v in pairs(baseHoldtypes) do
	holdtypes[k] = {
		[ACT_MP_STAND_IDLE]                = v,
		[ACT_MP_WALK]                      = v + 1,
		[ACT_MP_RUN]                       = v + 2,
		[ACT_MP_CROUCH_IDLE]               = v + 3,
		[ACT_MP_CROUCHWALK]                = v + 4,
		[ACT_MP_ATTACK_STAND_PRIMARYFIRE]  = v + 5,
		[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] = v + 5,
		[ACT_MP_RELOAD_STAND]              = v + 6,
		[ACT_MP_RELOAD_CROUCH]             = v + 6,
		[ACT_MP_JUMP]                      = v + 7,
		[ACT_RANGE_ATTACK1]                = v + 8,
		[ACT_MP_SWIM_IDLE]                 = v + 8,
		[ACT_MP_SWIM]                      = v + 9
	}
end

local function addHoldType(name, base, aiBase)
	aiHoldtypes[name] = aiBase or base
	holdtypes[name] = table.Copy(holdtypes[base])
end

-- By manipulating the holdtypes table, we can overwrite animations or even add completely new sets
holdtypes.normal[ACT_MP_JUMP] = ACT_HL2MP_JUMP_SLAM

holdtypes.passive[ACT_MP_CROUCH_IDLE] = ACT_HL2MP_IDLE_CROUCH
holdtypes.passive[ACT_MP_CROUCHWALK] = ACT_HL2MP_WALK_CROUCH

addHoldType("sniper", "ar2")

holdtypes.sniper[ACT_MP_ATTACK_STAND_PRIMARYFIRE] = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
holdtypes.sniper[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW

addHoldType("shotgun2", "shotgun")

holdtypes.shotgun2[ACT_MP_STAND_IDLE] = ACT_HL2MP_IDLE_AR2
holdtypes.shotgun2[ACT_MP_WALK] = ACT_HL2MP_WALK_AR2
holdtypes.shotgun2[ACT_MP_RUN] = ACT_HL2MP_RUN_AR2
holdtypes.shotgun2[ACT_MP_CROUCH_IDLE] = ACT_HL2MP_IDLE_CROUCH_AR2
holdtypes.shotgun2[ACT_MP_CROUCHWALK] = ACT_HL2MP_WALK_CROUCH_AR2
holdtypes.shotgun2[ACT_MP_JUMP] = ACT_HL2MP_JUMP_AR2
holdtypes.shotgun2[ACT_MP_SWIM_IDLE] = ACT_HL2MP_SWIM_IDLE_AR2
holdtypes.shotgun2[ACT_MP_SWIM] = ACT_HL2MP_SWIM_AR2

function SWEP:SetWeaponHoldType(name)
	self.ActivityTranslate2 = holdtypes[name] or holdtypes.normal

	while aiHoldtypes[name] do
		name = aiHoldtypes[name]
	end

	self:SetupWeaponHoldTypeForAI(name)
end

function SWEP:TranslateActivity(act)
	if self:GetOwner():IsNPC() then
		return self.ActivityTranslateAI[act] or -1
	end

	return self.ActivityTranslate2 and self.ActivityTranslate2[act] or -1
end

function SWEP:GetTargetHoldType()
	return self.HoldType
end

function SWEP:UpdateHoldType()
	local target = self:GetTargetHoldType()

	if self:GetHoldType() != target then
		self:SetHoldType(target)
	end
end
