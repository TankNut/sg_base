local TRAIT = {}

TRAIT.Zoom = 3 -- Can (soon) be a table to enable scroll switching zoom levels
TRAIT.Range = nil -- Optional range to use while aiming
TRAIT.Recoil = 0 -- Recoil modifier while aiming

TRAIT.AimTime = 0.35 -- Seconds to fully transition to/from

TRAIT.Offset = Vector() -- Position offset to use while aiming

function TRAIT:SetupNetworkVars(ent)
	ent:NetworkVar("Float", "AimState")
end

function TRAIT:ShouldAim(ent)
	return ent:GetOwner():KeyDown(IN_ATTACK2)
end

function TRAIT:IsAiming(ent)
	return ent:GetAimState() > 0.2
end

function TRAIT:GetState(ent, from, to)
	local state

	if from then
		state = sg.RemapC(ent:GetAimState(), from, to, 0, 1)
	else
		state = ent:GetAimState()
	end

	return math.ease.InOutSine(state)
end

function TRAIT:GetZoom(ent)
	return Lerp(self:GetState(ent, 0.25, 1), 1, self.Zoom)
end

function TRAIT:Hook_Think(ent)
	ent:SetAimState(math.Approach(ent:GetAimState(), self:ShouldAim(ent) and 1 or 0, FrameTime() / self.AimTime))
end

function TRAIT:Hook_MultiplyRecoil(ent, val)
	return val + self.Recoil * self:GetState(ent)
end

function TRAIT:Hook_GetRange(ent, val)
	if self.Range then
		return Lerp(self:GetState(ent), val, self.Range)
	end
end

function TRAIT:Hook_TranslateFOV(ent, fov)
	local target = fov / self:GetZoom(ent)

	if CLIENT then
		ent.ViewModelFOV = ent.BaseViewModelFOV + (fov - target) * 0.75
	end

	return target
end

if CLIENT then
	function TRAIT:Hook_GetViewModelPosition(ent, pos, ang)
		local state = self:GetState(ent, 0, 0.8)

		local offset = Vector(self.Offset)
		offset:Rotate(ang)

		pos:Add(offset * state)
	end
end

sg.RegisterTrait("SecondaryAim", TRAIT)
