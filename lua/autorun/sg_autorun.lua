module("sg", package.seeall)

InfiniteAmmo = CreateConVar("sg_infiniteammo", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY})

if CLIENT then
	local dir = Vector()

	-- Returns false if done rendering
	function Tracer(startpos, endpos, velocity, length, time, callback)
		dir:Set(endpos)
		dir:Sub(startpos)

		local distance = dir:Length()

		dir:Normalize()

		-- Minimum length
		if distance <= 128 then
			return false
		end

		local lifetime = (distance + length) / velocity

		if time > lifetime then
			return false
		end

		local startDistance = velocity * time
		local endDistance = startDistance - length

		startDistance = math.Clamp(startDistance, 0, distance)
		endDistance = math.Clamp(endDistance, 0, distance)

		-- Is this backwards? I don't know
		local startPoint = startpos + dir * startDistance
		local endPoint = startpos + dir * endDistance

		local uv1 = math.abs(startDistance - endDistance) / length
		local uv2 = 0

		callback(startPoint, endPoint, uv1, uv2)

		return true
	end
end

sound.Add({
	name = "Weapon_SG.Empty",
	channel = CHAN_STATIC,
	volume = 0.7,
	level = 75,
	pitch = 100,
	sound = ")weapons/pistol/pistol_empty.wav"
})

-- Disabled/unfinished, found to have no discernable impact on performance

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
