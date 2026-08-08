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

function SWEP:RunHooks(name, callback, ...)
	for _, trait in ipairs(self.Traits) do
		local func = trait["Hook_" .. name]

		if not func then
			continue
		end

		if callback then
			local wrapper = function(...)
				return func(trait, self, ...)
			end

			local res = {callback(wrapper)}

			if #res > 0 then
				return unpack(res)
			end
		else
			func(trait, self, ...)
		end
	end
end
