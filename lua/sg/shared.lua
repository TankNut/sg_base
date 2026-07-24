module("sg", package.seeall)

function client(path) if CLIENT then include(path) else AddCSLuaFile(path) end end
function server(path) if SERVER then include(path) end end
function shared(path) AddCSLuaFile(path) include(path) end

-- Console commands
InfiniteAmmo = CreateConVar("sg_infiniteammo", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY})
DeveloperMode = CreateConVar("sg_developer", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY})

client("cl_render.lua")
shared("sh_sounds.lua")

function RemapC(val, inMin, inMax, outMin, outMax)
	return math.Clamp(math.Remap(val, inMin, inMax, outMin, outMax), math.min(outMin, outMax), math.max(outMin, outMax))
end

if CLIENT then
	concommand.Add("sg_dev_freezevm", function()
		local lp = LocalPlayer()

		sg.DebugVMPos = lp:EyePos()
		sg.DebugVMAng = lp:EyeAngles()
	end)

	concommand.Add("sg_dev_unfreezevm", function()
		sg.DebugVMPos = nil
		sg.DebugVMAng = nil
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

		if not weapons.IsBasedOn(swep:GetClass(), "sg_base") then
			return
		end

		flatten(swep.VElements, LocalPlayer():GetViewModel(), swep.BoneCache)
		flatten(swep.WElements, swep)
	end)
end
]]
