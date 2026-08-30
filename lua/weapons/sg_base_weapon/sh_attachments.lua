AddCSLuaFile()

SWEP.ViewModelAttachments = {}
SWEP.WorldModelAttachments = {}

-- Used to translate viewmodel attachments into the correct perspective/FOV
local function translatePos(pos)
	local setup = render.GetViewSetup()

	local worldx = math.tan(setup.fov * (math.pi / 360))
	local viewx = math.tan(setup.fovviewmodel * (math.pi / 360))

	local factor = worldx / viewx
	local tmp = pos - setup.origin

	local eye = setup.angles
	local transformed = Vector(eye:Right():Dot(tmp), eye:Up():Dot(tmp), eye:Forward():Dot(tmp))

	transformed.x = transformed.x * factor
	transformed.y = transformed.y * factor

	local out = (eye:Right() * transformed.x) + (eye:Up() * transformed.y) + (eye:Forward() * transformed.z)

	return setup.origin + out
end

local function translateAng(ang)
	local setup = render.GetViewSetup()

	local worldx = math.tan(setup.fov * (math.pi / 360))
	local viewx = math.tan(setup.fovviewmodel * (math.pi / 360))

	local factor = 1 - (viewx / worldx)

	if factor != 0 then
		local diff = setup.angles - ang
		local sub = Angle(diff.x * factor, diff.y * factor, 0)

		ang:Sub(sub)
	end

	return ang
end

local matrix = Matrix()

local function getAttachment(ent, data)
	if ent:IsWeapon() then ent:SetupBones() end

	if data.Bone then
		ent:CopyBoneMatrix(ent:LookupBone(data.Bone) or 0, matrix)
	else
		local index = data.Attachment and ent:LookupAttachment(data.Attachment) or 1
		local attachment = sg.GetModelInfo(ent:GetModel()).Attachments[index]

		if attachment then
			ent:CopyBoneMatrix(attachment.Bone, matrix)
			matrix:Mul(attachment.Offset)
		else
			ent:CopyBoneMatrix(0, matrix)
		end
	end

	local pos = data.Pos or vector_origin
	local ang = data.Angle or angle_zero

	return LocalToWorld(pos, ang, matrix:GetTranslation(), matrix:GetAngles())
end

function SWEP:GetCustomAttachment(name)
	local tab = self.WorldModelAttachments
	local ent = self
	local isViewModel = false

	if CLIENT then
		local ply = self:GetOwner()

		if self:IsCarriedByLocalPlayer() and not ply:ShouldDrawLocalPlayer() then
			tab = self.ViewModelAttachments
			ent = ply:GetViewModel()
			isViewModel = true
		end
	end

	local func = self["Get" .. (isViewModel and "View" or "World") .. name .. "Attachment"]
	local pos, ang

	if func then
		pos, ang = getAttachment(ent, func(self))
	elseif tab[name] then
		pos, ang = getAttachment(ent, tab[name])
	else
		return
	end

	if isViewModel then
		pos = translatePos(pos)
		ang = translateAng(ang)
	end

	return pos, ang
end
