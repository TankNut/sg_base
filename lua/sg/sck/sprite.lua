module("sg.SCK", package.seeall)

AddType("Sprite", {
	RenderOrder = -5,
	Init = function(self, tab, element)
		if element.quad then
			element.angle = element.angle or angle_zero
		end

		FixElementPositions(element)

		local mat = Material(element.sprite)

		-- Check if the material we're using exists
		if mat:IsError() then
			self:ThrowError("Cannot add %s: Base material is invalid", element)

			return
		end

		local materialName = mat:GetName() .. "-sck-"
		local materialParameters = {
			-- This fixes a potential issue where the sprite material name doesn't match the sprite texture name
			["$basetexture"] = mat:GetTexture("$basetexture"):GetName()
		}

		-- Allow for setting a number of extra sprite keys
		for _, key in ipairs({"nocull", "additive", "vertexalpha", "vertexcolor", "ignorez"}) do
			local value = tobool(element[key]) and 1 or 0

			materialParameters["$" .. key] = value
			materialName = materialName .. value
		end

		element._material = CreateMaterial(materialName, "UnlitGeneric", materialParameters)
	end,
	Render = function(self, tab, element, ent, flags, rendergroups)
		-- Don't render during worldmodel opaque pass
		if rendergroups and bit.band(flags, STUDIO_TRANSPARENCY) == 0 then return end
		if not element._material then return end

		local matrix = GetBoneOrientation(tab, element, ent)
		if not matrix then return end

		render.SetMaterial(element._material)

		local proxy = element._proxy

		if element.quad then
			render.DrawQuadEasy(matrix:GetTranslation(), matrix:GetForward(), proxy.size.x, proxy.size.y, proxy.color, matrix:GetAngles().r + 180)
		else
			render.DrawSprite(matrix:GetTranslation(), proxy.size.x, proxy.size.y, proxy.color)
		end
	end
})
