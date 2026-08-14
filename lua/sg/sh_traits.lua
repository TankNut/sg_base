module("sg", package.seeall)

Traits = Traits or {}

function RegisterTrait(class, trait)
	if Traits[class] then
		table.Empty(Traits[class])
		table.Merge(Traits[class], trait)
	else
		Traits[class] = trait
	end
end

function Trait(class, config)
	return function(ent)
		local definition = Traits[class]

		if not config then
			config = {}
		end

		if not definition then
			sg.ThrowError("%s tried to initialize an unknown trait type: %s", ent, class)

			return
		end

		return setmetatable(config, {__index = definition})
	end
end
