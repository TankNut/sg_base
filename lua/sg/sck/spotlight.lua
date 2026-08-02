module("sg.SCK", package.seeall)

AddType("Spotlight", {
	RenderOrder = -10,
	Init = function(self, tab, element)
		fixPositions(element)

		element.pixvis = util.GetPixelVisibleHandle()
	end,
	Render = function(self, tab, element, ent, flags, rendergroups)
		-- Don't render during worldmodel opaque pass
		if rendergroups and bit.band(flags, STUDIO_TRANSPARENCY) == 0 then
			return
		end

		local proxy = element._proxy

		local matrix = self:GetBoneOrientation(tab, element, ent)
		sg.DrawSpotlight(matrix:GetTranslation(), matrix:GetForward(), proxy.length, proxy.width, proxy.color, element.pixvis)
	end
})
