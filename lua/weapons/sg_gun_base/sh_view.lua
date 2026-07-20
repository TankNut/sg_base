AddCSLuaFile()
DEFINE_BASECLASS("sg_base")

function SWEP:HasCameraControl(ply)
	if CLIENT and not ply:ShouldDrawLocalPlayer() then
		return true
	end

	return ply:GetViewEntity() == ply
end

local vmRatio = 0.4

if CLIENT then
	function SWEP:CalcView(ply, pos, ang, fov)
		if not self:HasCameraControl(ply) then
			return
		end

		return pos, ang - ply:GetViewPunchAngles() * vmRatio, fov
	end

	function SWEP:GetViewModelPosition(pos, ang)
		local ply = self:GetOwner()
		local punch = ply:GetViewPunchAngles()

		ang:Sub(punch)

		local const = math.pi / 360
		local fov, vm = ply:GetFOV(), self.ViewModelFOV

		local min = math.tan(math.min(fov, vm) * const)
		local max = math.tan(math.max(fov, vm) * const)
		local ratio = (min / max) * vmRatio

		ang:Add(punch * (1 - ratio))

		return pos, ang
	end
end
