module("sg.SCK", package.seeall)

local scaleMatrix = Matrix()

local badShaders = {
	["LightmappedGeneric"] = true
}

AddType("Model", {
	RenderOrder = 0,
	Init = function(self, tab, element)
		FixElementPositions(element)

		-- Check if we're creating a valid model
		if not element.model or string.GetExtensionFromFilename(element.model) != "mdl" or not file.Exists(element.model, "GAME") then
			sg.ThrowError("Cannot add %s: File not found (%s)", element, element.model)
			return
		end

		local flipCount = 0

		for _, v in ipairs({element.size:Unpack()}) do
			if v < 0 then
				flipCount = flipCount + 1
			end
		end

		if flipCount % 2 == 1 then
			element.inverted = not tobool(element.inverted)
		end

		-- Check for bad materials
		if #element.material > 0 then
			local shader = Material(element.material):GetShader()

			if badShaders[shader] then
				sg.ThrowError("Clearing %s.material: Bad shader (%s)", element, shader)

				element.material = ""
			end
		end

		local ent = self:CreateCSEnt(element.model)
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:SetParent(self)
		ent:SetNoDraw(true)

		element._entity = ent
	end,
	Render = function(self, tab, element, ent, flags, rendergroups)
		local csent = element._entity
		if not IsValid(csent) then return end

		if rendergroups and not rendergroups[csent:GetRenderGroup()] then
			return
		end

		local matrix = GetBoneOrientation(tab, element, ent)
		if not matrix then return end

		local pos = matrix:GetTranslation()
		local ang = matrix:GetAngles()

		if self.ViewModelFlip and ent:GetClass() == "viewmodel" then
			ang.r = -ang.r
		end

		csent:SetPos(pos)
		csent:SetAngles(ang)

		local proxy = element._proxy

		if proxy.size != element._size then
			-- Re-using a single matrix here for optimization
			scaleMatrix:Identity()
			scaleMatrix:SetScale(proxy.size)

			element._size = Vector(proxy.size)

			csent:EnableMatrix("RenderMultiply", scaleMatrix)
		end

		local parent = element.bonemerge and ent or self

		if csent:GetParent() != parent then
			csent:SetParent(parent)
		end

		if csent:IsEffectActive(EF_BONEMERGE) != element.bonemerge then
			if element.bonemerge then
				csent:AddEffects(EF_BONEMERGE)
			else
				csent:RemoveEffects(EF_BONEMERGE)
			end
		end

		if proxy.skin != ent:GetSkin() then
			csent:SetSkin(proxy.skin)
		end

		for id, index in pairs(proxy.bodygroup) do
			if csent:GetBodygroup(id) != index then
				csent:SetBodygroup(id, index)
			end
		end

		if element._material != proxy.material then
			element._material = proxy.material
			csent:SetMaterial(proxy.material)
		end

		if proxy.suppresslightning then
			render.SuppressEngineLighting(true)
		end

		render.SetColorModulation(proxy.color.r / 255, proxy.color.g / 255, proxy.color.b / 255)
		render.SetBlend(proxy.color.a / 255)

		local mode = proxy.color.a < 255 and RENDERMODE_TRANSCOLOR or RENDERMODE_NORMAL

		if csent:GetRenderMode() != mode then
			csent:SetRenderMode(mode)
		end

		if proxy.inverted then
			render.CullMode(MATERIAL_CULLMODE_CW)
		end

		if element.clipplanes then
			render.EnableClipping(true)

			for _, clip in ipairs(element.clipplanes) do
				local clipAng = Angle(ang)
				local clipPos = csent:GetPos()

				clipPos:Add(ang:Forward() * clip.pos.x)
				clipPos:Add(ang:Right() * clip.pos.y)
				clipPos:Add(ang:Up() * clip.pos.z)

				clipAng:RotateAroundAxis(clipAng:Up(), clip.angle.y)
				clipAng:RotateAroundAxis(clipAng:Right(), clip.angle.p)
				clipAng:RotateAroundAxis(clipAng:Forward(), clip.angle.r)

				render.PushCustomClipPlane(clipAng:Up(), clipAng:Up():Dot(clipPos))
			end
		end

		csent:DrawModel(flags)

		if proxy.nocull then
			render.CullMode(proxy.inverted and MATERIAL_CULLMODE_CCW or MATERIAL_CULLMODE_CW)
			csent:DrawModel(flags)
		end

		if element.clipplanes then
			for i = 1, #element.clipplanes do
				render.PopCustomClipPlane()
			end

			render.EnableClipping(false)
		end

		-- All of this is just restoring to the default gmod state, so we don't actually have to check if anything changed
		render.CullMode(MATERIAL_CULLMODE_CCW)

		render.SetBlend(1)
		render.SetColorModulation(1, 1, 1)

		render.SuppressEngineLighting(false)
	end
})

AddType("ClipPlane", {
	RenderOrder = 0,
	Init = function(self, tab, element)
		local parent = tab[element.rel]

		if not parent or parent.type != "Model" then
			sg.ThrowError("Cannot add %s: Parent is missing or not a model", element)

			return
		end

		element.pos = Vector(element.pos)
		element.angle = Angle(element.angle)

		parent.clipplanes = parent.clipplanes or {}
		parent.clipcount = parent.clipcount or 0

		if parent.clipcount >= 2 then
			sg.ThrowError("Cannot add %s: Maximum clip limit reached (2)", element)

			return
		end

		table.insert(parent.clipplanes, element)

		parent.clipcount = parent.clipcount + 1
	end,
	Render = function(self, ent, tab, element)
	end
})
