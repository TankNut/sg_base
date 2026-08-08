AddCSLuaFile()
DEFINE_BASECLASS("sg_base")

local vmRatio = 0.4
local developerMode = sg.DeveloperMode

function SWEP:TranslateFOV(fov)
	local ply = self:GetOwner()

	if ply:GetViewEntity() != ply then
		return fov
	end

	if developerMode:GetBool() and sg.DebugVMPos then
		self.ViewModelFOV = ply:GetFOV()
	else
		self.ViewModelFOV = self.BaseViewModelFOV
	end

	self:RunHooks("TranslateFOV", function(func)
		local override = func(fov)

		if override != nil then
			fov = override
		end
	end)

	return fov
end

if CLIENT then
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
			return sg.DebugVMPos, sg.DebugVMAng
		else
			if sg.DebugVMPos then
				sg.DebugVMPos = nil
				sg.DebugVMAng = nil
			end
		end

		pos = LocalToWorld(self.ViewModelOffset, angle_zero, pos, ang)

		self:RunHooks("GetViewModelPosition", nil, pos, ang)

		local punch = ply:GetViewPunchAngles()

		ang:Sub(punch)

		local fov, vm = ply:GetFOV(), self.ViewModelFOV

		local min = math.tan(math.min(fov, vm) * const)
		local max = math.tan(math.max(fov, vm) * const)
		local ratio = (min / max) * vmRatio

		ang:Add(punch * (1 - ratio))

		return pos, ang
	end

	local ratio = GetConVar("zoom_sensitivity_ratio")

	function SWEP:AdjustMouseSensitivity(sensitivity, localFOV, defaultFOV)
		if localFOV == defaultFOV then
			return 1
		end

		return (localFOV / defaultFOV) * ratio:GetFloat()
	end
end
