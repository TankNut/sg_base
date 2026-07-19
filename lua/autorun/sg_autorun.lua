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
