module("sg", package.seeall)

-- Combines math.Remap with math.Clamp
function RemapC(val, inMin, inMax, outMin, outMax)
	local fraction = math.min(math.max((val - inMin) / (inMax - inMin), 0), 1)

	return outMin + (outMax - outMin) * fraction
end

-- Clamps math.TimeFraction to 0-1
function TimeFraction(start, finish)
	return math.min(math.max((CurTime() - start) / (finish - start), 0), 1)
end

function RotateAroundPivot(matrix, ang, pivot)
	matrix:Translate(pivot)
	matrix:Rotate(ang)
	matrix:Translate(-pivot)
end
