AddCSLuaFile()
DEFINE_BASECLASS("sg_base_weapon")

local vmRatio = 0.4

local developerMode = sg.Convars.DeveloperMode
local expRecoil = sg.Convars.Exp_Recoil

function SWEP:TranslateFOV(fov)
	local ply = self:GetOwner()

	if ply:GetViewEntity() != ply then
		return fov
	end

	if developerMode:GetBool() and sg.DebugVMPos then
		self.ViewModelFOV = ply:GetFOV()

		return
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

		if expRecoil:GetBool() then
			return pos, ang, fov
		end

		return pos, ang - ply:GetViewPunchAngles() * vmRatio, fov
	end

	-- We can do both of these things with local variables because there's only ever going to be one viewmodel being drawn
	local _crouch = 0

	local function getCrouchState(ply)
		local target = math.TimeFraction(ply:GetViewOffset().z, ply:GetViewOffsetDucked().z, ply:GetCurrentViewOffset().z)
		local diff = math.abs(target - _crouch)

		_crouch = math.Approach(_crouch, target, FrameTime() * 5 * diff)

		return math.ease.InOutSine(_crouch)
	end

	local _roll = 0

	local function getSidewaysState(ply)
		local vel = ply:GetVelocity()
		local sideways = vel:GetNormalized():Dot(ply:EyeAngles():Right()) * vel:Length()
		local run = ply:GetRunSpeed()

		local target = sg.RemapC(sideways, -run, run, -1, 1)
		local diff = math.abs(target - _roll)

		_roll = math.Approach(_roll, target, FrameTime() * 10 * diff)

		return _roll
	end

	function SWEP:AddComputedOffsets(pos, ang)
		local ply = self:GetOwner()
		local eye = ply:EyeAngles()

		do -- Roll
			local roll = 10
			local state = getSidewaysState(ply)

			ang.r = ang.r + (state * roll)
		end

		do -- Pitch
			local pitch = math.ease.InSine(math.Remap(eye.p, 0, 90, 0, 1))

			if eye.p > 0 then
				pos.z = pos.z + pitch
			else
				pos.z = pos.z - pitch * 3
			end
		end

		local crouch = getCrouchState(ply)

		pos.x = pos.x - crouch
		pos.z = pos.z - (crouch * 1.5)

		ang.p = ang.p - crouch
		ang.r = ang.r - (crouch * 5)
	end

	local const = math.pi / 360
	local vmSway = sg.Convars.ViewModelSway

	function SWEP:GetViewModelPosition(pos, ang)
		local ply = self:GetOwner()

		if developerMode:GetBool() and sg.DebugVMPos then
			local animPos, animAng = Vector(), Angle()

			self:GetViewModelOffset(animPos, animAng)

			return sg.DebugVMPos, sg.DebugVMAng
		else
			if sg.DebugVMPos then
				sg.DebugVMPos = nil
				sg.DebugVMAng = nil
			end
		end

		local offsetPos = Vector(self.ViewModelOffset)
		local offsetAng = Angle(angle_zero)

		self:GetViewModelOffset(offsetPos, offsetAng)

		self:RunHooks("GetViewModelPosition", nil, offsetPos, offsetAng)

		if vmSway:GetBool() then
			self:AddComputedOffsets(offsetPos, offsetAng)
		end

		pos, ang = LocalToWorld(offsetPos, offsetAng, pos, ang)

		if not expRecoil:GetBool() then
			local punch = ply:GetViewPunchAngles()

			ang:Sub(punch)

			local fov, vm = ply:GetFOV(), self.ViewModelFOV

			local min = math.tan(math.min(fov, vm) * const)
			local max = math.tan(math.max(fov, vm) * const)
			local ratio = (min / max) * vmRatio

			ang:Add(punch * (1 - ratio))
		end

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
