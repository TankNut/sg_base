module("sg.SCK", package.seeall)

Types = Types or {}

function AddType(name, data)
	Types[name] = data
end

local function fixPos(pos)
	pos = Vector(pos)
	pos.y = -pos.y

	return pos
end

local function fixAng(ang)
	ang = Angle(ang)
	ang.p = -ang.p

	return ang
end

-- Fix for a discrepancy between the old and new positioning logic
function FixElementPositions(element)
	if element.pos then element.pos = fixPos(element.pos) end
	if element.angle then element.angle = fixAng(element.angle) end
end

local meta = {
	__tostring = function(self)
		return string.format("SCK_%s[%s]", self.type, self.name)
	end
}

function InitElements(self, tab)
	local renderorder = {}

	for name, element in pairs(tab) do
		setmetatable(element, meta)

		element.name = name

		 -- Animation proxy
		element._proxy = setmetatable({}, {__index = element})

		local definition = Types[element.type]

		if definition then
			element.renderorder = element.renderorder or definition.RenderOrder

			definition.Init(self, tab, element)
			table.insert(renderorder, element)
		else
			sg.ThrowError("Ignoring unimplemented SCK type: %s", element.type)
		end
	end

	table.sort(renderorder, function(a, b)
		return a.renderorder > b.renderorder
	end)

	return renderorder
end

function DrawElement(self, tab, element, ent, flags, rendergroups)
	if element._proxy.hide then
		return
	end

	Types[element.type].Render(self, tab, element, ent, flags, rendergroups)
	render.UpdateRefractTexture()
end
