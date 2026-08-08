local TRAIT = {}

TRAIT.Zoom = 1.25 -- Can be a table to enable scroll switching zoom levels
TRAIT.ZoomRange = false -- Use the zoom value as a range multiplier, not compatible with TRAIT.Range

TRAIT.Firemode = nil
TRAIT.Range = nil -- Optional range to use while aiming
TRAIT.Recoil = 0 -- Recoil modifier while aiming

TRAIT.AimTime = 0.35 -- Seconds to fully transition to/from

TRAIT.Offset = Vector() -- Position offset to use while aiming

function TRAIT:SetupNetworkVars(ent)
	ent:NetworkVar("Float", "AimState")
	ent:NetworkVar("Float", "ZoomIndex")

	if SERVER then
		ent:SetZoomIndex(1)
	end
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
	local zoom = self.Zoom

	if istable(zoom) then
		zoom = zoom[ent:GetZoomIndex()]
	end

	return Lerp(self:GetState(ent, 0.25, 1), 1, zoom)
end

function TRAIT:Hook_Think(ent)
	ent:SetAimState(math.Approach(ent:GetAimState(), self:ShouldAim(ent) and 1 or 0, FrameTime() / self.AimTime))

	if istable(self.Zoom) and self:IsAiming(ent) then
		local cmd = ent:GetOwner():GetCurrentCommand()
		local wheel = math.Clamp(cmd:GetMouseWheel(), -1, 1)

		if wheel != 0 then
			local index = ent:GetZoomIndex() + wheel

			if index > 0 and index <= #self.Zoom then
				ent:EmitSound("Default.Zoom")
				ent:SetZoomIndex(index)
			end
		end
	end
end

function TRAIT:Hook_OverrideFiremode(ent, firemode)
	if self.Firemode != nil and self:IsAiming(ent) then
		return self.Firemode
	end
end

function TRAIT:Hook_MultiplyRecoil(ent, val)
	return val + self.Recoil * self:GetState(ent)
end

function TRAIT:Hook_GetRange(ent, val)
	if self.ZoomRange then
		return Lerp(self:GetState(ent), val, val * self:GetZoom(ent))
	elseif self.Range then
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

	function TRAIT:Hook_HUDShouldDraw(ent, hud)
		if hud == "CHudWeaponSelection" and self:IsAiming(ent) then
			return false
		end
	end
end

sg.RegisterTrait("SecondaryAim", TRAIT)
