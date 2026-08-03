AddCSLuaFile()

function SWEP:InitTraits(createNetworkVars)
	self.Traits = {}

	local traits = weapons.GetStored(self:GetClass()).Traits
	if not traits then return end

	for _, func in ipairs(traits) do
		local trait = func(self)

		if not trait then
			continue
		end

		if createNetworkVars and trait.SetupNetworkVars then
			trait:SetupNetworkVars(self)
		end

		table.insert(self.Traits, trait)
	end
end

function SWEP:RunHooks(name, ...)
	local a, b, c, d, e, f

	for _, trait in ipairs(self.Traits) do
		local func = trait["Hook_" .. name]

		if func then
			a, b, c, d, e, f = func(trait, self, ...)
		end

		if a != nil then
			return a, b, c, d, e, f
		end
	end

	if isfunction(self[name]) then
		return self[name](self, ...)
	end
end
