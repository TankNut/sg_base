module("sg.SCK", package.seeall)

AddType("Laser", {
	RenderOrder = -10,
	Init = function(self, tab, element)
		FixElementPositions(element)

		element.pixvis = util.GetPixelVisibleHandle()
	end,
	Render = function(self, tab, element, ent, flags, rendergroups)
		-- Don't render during worldmodel opaque pass
		if rendergroups and bit.band(flags, STUDIO_TRANSPARENCY) == 0 then
			return
		end

		local proxy = element._proxy

		local matrix = self:GetBoneOrientation(tab, element, ent)
		sg.DrawLaser(matrix:GetTranslation(), matrix:GetForward(), proxy.length, proxy.width, proxy.color, proxy.brightness, element.pixvis)
	end
})
