AddCSLuaFile()
DEFINE_BASECLASS("sg_base")

local vmRatio = 0.4

if CLIENT then
	local developerMode = sg.DeveloperMode

	function SWEP:CalcView(ply, pos, ang, fov)
		if ply:GetViewEntity() != ply then
			return
		end

		return pos, ang - ply:GetViewPunchAngles() * vmRatio, fov
	end

	local const = math.pi / 360

	function SWEP:GetViewModelPosition(pos, ang)
		local ply = self:GetOwner()

		if developerMode:GetBool() and sg.DebugVMPos then
			self.ViewModelFOV = ply:GetFOV()

			return sg.DebugVMPos, sg.DebugVMAng
		else
			self.ViewModelFOV = self.InitialViewModelFOV
		end

		local punch = ply:GetViewPunchAngles()

		ang:Sub(punch)

		local fov, vm = ply:GetFOV(), self.ViewModelFOV

		local min = math.tan(math.min(fov, vm) * const)
		local max = math.tan(math.max(fov, vm) * const)
		local ratio = (min / max) * vmRatio

		ang:Add(punch * (1 - ratio))

		return pos, ang
	end
end
