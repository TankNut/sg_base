AddCSLuaFile()

-- Called once when firing, updates TracerNum
function SWEP:CreateEffects(tr)
	self:CreateMuzzleEffect()

	if self.Tracer == 0 or self.TracerName == "" then
		return
	end

	local should = true

	if self.Tracer > 1 then
		local num = (self:GetTracerNum() + 1) % self.Tracer
		should = num == 0

		self:SetTracerNum(num)
	end

	if should then
		self:CreateTracer(tr.StartPos, tr.HitPos)
	end
end

function SWEP:CreateMuzzleEffect()
	-- TODO
end

function SWEP:CreateTracer(start, origin, detach)
	if not IsFirstTimePredicted() then
		return
	end

	local data = {
		Start = start,
		Entity = self,
		Detach = detach
	}

	for k, v in pairs(self.TracerConfig) do
		if k != "BaseClass" then
			data[k] = v
		end
	end

	sg.Effect(self.TracerName, origin, data, nil, self:GetOwner())
end

if CLIENT then
	function SWEP:GetViewModelMuzzle()
		return self.ViewModelMuzzle or {}
	end

	function SWEP:GetWorldModelMuzzle()
		return self.WorldModelMuzzle or {}
	end

	local function translate(pos, inverse)
		local setup = render.GetViewSetup()

		local worldx = math.tan(setup.fov * (math.pi / 360))
		local viewx = math.tan(setup.fovviewmodel * (math.pi / 360))

		local factor = Vector(worldx / viewx, worldx / viewx, 0)
		local tmp = pos - setup.origin

		local eye = setup.angles
		local transformed = Vector(eye:Right():Dot(tmp), eye:Up():Dot(tmp), eye:Forward():Dot(tmp))

		if inverse then
			transformed.x = transformed.x / factor.x
			transformed.y = transformed.y / factor.y
		else
			transformed.x = transformed.x * factor.x
			transformed.y = transformed.y * factor.y
		end

		local out = (eye:Right() * transformed.x) + (eye:Up() * transformed.y) + (eye:Forward() * transformed.z)

		return setup.origin + out
	end

	local matrix = Matrix()

	local function getMuzzle(ent, data)
		-- Wack
		if ent:IsWeapon() then
			ent:SetupBones()
		end

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

	function SWEP:GetTracerOrigin()
		local ply = self:GetOwner()
		local vm = self:IsCarriedByLocalPlayer() and not ply:ShouldDrawLocalPlayer()
		local ent = vm and ply:GetViewModel() or self

		if vm then
			local pos, ang = getMuzzle(ent, self:GetViewModelMuzzle())

			return translate(pos), ang
		else
			return getMuzzle(ent, self:GetWorldModelMuzzle())
		end
	end
end
