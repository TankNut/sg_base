module("sg", package.seeall)

function RemapC(val, inMin, inMax, outMin, outMax)
	return math.Clamp(math.Remap(val, inMin, inMax, outMin, outMax), math.min(outMin, outMax), math.max(outMin, outMax))
end

function RemapTime(start, finish, from, to)
	local fraction = math.Clamp(math.TimeFraction(start, finish, CurTime()), 0, 1)

	return Lerp(fraction, from, to)
end

function TimeFraction(start, finish)
	return math.Clamp(math.TimeFraction(start, finish, CurTime()), 0, 1)
end
