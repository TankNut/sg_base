module("sg", package.seeall)

function client(path) if CLIENT then include(path) else AddCSLuaFile(path) end end
function server(path) if SERVER then include(path) end end
function shared(path) AddCSLuaFile(path) include(path) end

shared("sh_enums.lua")
shared("sh_convars.lua")

client("cl_fonts.lua")
client("cl_render.lua")
client("cl_sck.lua")
client("cl_ui.lua")
shared("sh_animations.lua")
shared("sh_colortemp.lua")
shared("sh_effects.lua")
shared("sh_math.lua")
shared("sh_sounds.lua")
shared("sh_traits.lua")

client("sck/laser.lua")
client("sck/model.lua")
client("sck/quad.lua")
client("sck/spotlight.lua")
client("sck/sprite.lua")

shared("traits/add_recoil.lua")
shared("traits/add_spread.lua")
shared("traits/aiming.lua")
shared("traits/gatling.lua")
shared("traits/movement_modifier.lua")
shared("traits/penetration.lua")
shared("traits/self_knockback.lua")
shared("traits/spread_mod.lua")

local errorColor = Color(255, 100, 100)

function ThrowError(...)
	MsgC(errorColor, "[sg_base] ", string.format(...), "\n")
end

function GetSequenceIndex(ent, index)
	if isnumber(index) then
		return ent:SelectWeightedSequence(index)
	else
		return ent:LookupSequence(index)
	end
end

ModelCache = {}

function GetModelInfo(mdl)
	if not ModelCache[mdl] then
		ModelCache[mdl] = util.GetModelInfo(mdl)
	end

	return ModelCache[mdl]
end

if SERVER then
	function Explosion(pos, owner, damage, spawnflags, radius)
		local ent = ents.Create("env_explosion")

		ent:SetOwner(owner)
		ent:SetPos(pos)
		ent:SetKeyValue("spawnflags", bit.bor(32, spawnflags or 0)) -- We always disable sparks
		ent:SetKeyValue("iMagnitude", damage)

		if radius then
			ent:SetKeyValue("iRadiusOverride", radius)
		end

		ent:Spawn()
		ent:Activate()
		ent:Fire("Explode")
	end
end

if CLIENT then
	concommand.Add("sg_dev_freezevm", function()
		local lp = LocalPlayer()

		if DebugVMPos then
			DebugVMPos = nil
			DebugVMAng = nil
		else
			DebugVMPos = lp:EyePos()
			DebugVMAng = lp:EyeAngles()
		end
	end)
end

local function moveHook(name)
	hook.Add(name, "sg_base", function(ply, ...)
		local swep = ply:GetActiveWeapon()

		if swep:IsValid() and weapons.IsBasedOn(swep:GetClass(), "sg_base_weapon") and swep[name] then
			swep[name](swep, ply, ...)
		end
	end)
end

moveHook("StartCommand")
moveHook("SetupMove")
moveHook("Move")

if CLIENT then
	hook.Add("PlayerFireAnimationEvent", "sg_base", function(ply, ...)
		local swep = ply:GetActiveWeapon()

		if swep:IsValid() and weapons.IsBasedOn(swep:GetClass(), "sg_base_weapon") then
			return swep:FireAnimationEvent(...)
		end
	end)
end

-- Disabled/unfinished optimization tool, found to have no discernable impact on performance

--[[
if CLIENT then
	local function flatten(tab, ent, boneCache)
		for name, element in pairs(tab) do
			if element.type == "ClipPlane" then continue end
			if element.rel == "" then continue end

			local parent = tab[element.rel]

			while parent.rel != "" do
				parent = tab[parent.rel]
			end

			local matrix = element._matrix
			local index = ent:LookupBone(parent.bone)
			local boneMatrix = ent:GetBoneMatrix(index)

			if boneCache then
				local cache = boneCache[index]

				if cache then
					boneMatrix:Translate(cache.pos)
					boneMatrix:Rotate(cache.angle)
				end
			end

			local pos, ang = WorldToLocal(matrix:GetTranslation(), matrix:GetAngles(), boneMatrix:GetTranslation(), boneMatrix:GetAngles())

			element.pos = pos
			element.angle = ang

			element.bone = parent.bone
			element.rel = ""
		end
	end

	concommand.Add("sg_dev_flatten", function()
		if not game.SinglePlayer() then
			return
		end

		local swep = LocalPlayer():GetActiveWeapon()

		if not weapons.IsBasedOn(swep:GetClass(), "sg_base_weapon") then
			return
		end

		flatten(swep.VElements, LocalPlayer():GetViewModel(), swep.BoneCache)
		flatten(swep.WElements, swep)
	end)
end
]]
