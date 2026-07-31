module("sg", package.seeall)

-- Tries to find which two keyframes to lerp between, returns only one if we're at the start or end
local function findFrames(t, keyframes)
	for k, frame in ipairs(keyframes) do
		if frame[1] >= t then
			if k == 1 then
				return frame
			else
				return keyframes[k - 1], frame
			end
		end
	end

	return keyframes[#keyframes]
end

-- Only needed when we're specifically not lerping so we don't return (and potentially modify) the original keyframe data
local function copy(val)
	if isvector(val) then
		return Vector(val)
	elseif isangle(val) then
		return Angle(val)
	elseif IsColor(val) then
		return val:Copy()
	else
		return val
	end
end

-- Since there's no universal way to do this
local function lerp(fraction, v1, v2)
	if isvector(v1) then
		return LerpVector(fraction, v1, v2)
	elseif isangle(v1) then
		return LerpAngle(fraction, v1, v2)
	elseif IsColor(v1) then
		return v1:Lerp(v2, fraction)
	else
		return Lerp(fraction, v1, v2)
	end
end

-- Individual keyframes use the format {t, val, ease}
function Keyframe(t, data)
	if isentity(t) then t = t:GetCycle() end

	local output = {}

	-- Support multiple 'tracks' that all get resolved in the same Keyframe call and returned as a table
	for name, keyframes in pairs(data) do
		local frame1, frame2 = findFrames(t, keyframes)

		-- We're either at the very start or very end of the keyframe data with nothing to lerp to/from, so return a copy of the data we do have
		if not frame2 then
			output[name] = copy(frame1[2])

			continue
		end

		local t1, v1 = unpack(frame1)
		local t2, v2, ease = unpack(frame2)

		local fraction = math.Remap(t, t1, t2, 0, 1)

		-- Very simplistic easing code but it's both simple and doesn't require a bunch of extra setup/configuration
		if ease then
			fraction = ease(fraction)
		end

		output[name] = lerp(fraction, v1, v2)
	end

	return output
end
