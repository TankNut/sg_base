module("sg.Animation", package.seeall)

--[[
A basic explanation of how this stuff works:

The version of SCK's client library that's built into this addon has been modified to give each element a proxy table, this table is __indexed to the element itself and is used for most internal getters for positioning and rendering.

This animation system works by emptying out and writing to this proxy table every time it updates, clearing old values and writing up-to-date ones. Meaning that if a value stops animating at any point, it's removed from the proxy and the element falls back on whatever was set before (either by other programmatic methods or the element's base definition)

Animations themselves are split into tables, elements, layers and if used, keyframes. A table (e.g. VElements) contains a number of elements it wants to edit, these element tables contain layers (each distinct animation _thing_ is a single layer) which contains the actual data, either a table of keyframes (indexed 0-1 floats) or a callback function. An example of the raw data:

anim = {
	VElements = { -- Table
		["element1"] = { -- Element
			[1] = { -- Keyframe layer
				[0] = {pos2 = Vector(0, 0, 0)}, -- Keyframe
				[1] = {pos2 = Vector(0, 0, 1)}
			},
			[2] = function(ent, element, cycle) -- Callback layer
				return {pos2 = Vector(0, 0, cycle)}
			end
		}
	}
}

If multiple layers modify the same key, the values are mixed together either additively (vectors, angles and numbers), lerped (colors) or plain overwritten (everything else)
]]

BASE = BASE or {}

function BASE:Insert(tab, name, data)
	if not tab[name] then
		tab[name] = {data}
	else
		table.insert(tab[name], data)
	end
end

function BASE:AddEvent(frame, event, data)
	self:Insert(self.Events, frame, {event, data})

	return self
end

function BASE:RunAnimationEvent(ent, rate, event, data)
	if event == "VMSequence" then
		local vm = ent:GetViewModel()
		local sequence

		if istable(data) then
			sequence = data[1]
			rate = rate * (data[2] or 1)
		else
			sequence = data
		end

		sequence = sg.GetSequenceIndex(vm, sequence)

		if sequence == -1 then
			return
		end

		if game.SinglePlayer() then -- Fix for a weird issue to do with thirdperson
			vm:SendViewModelMatchingSequence(-1)
		end

		vm:SendViewModelMatchingSequence(sequence)
		vm:SetPlaybackRate(rate)
	elseif event == "Sound" then
		ent:EmitSound(data)
	elseif event == "PlayerAnimation" then
		ent:PlayWorldAnimation(data)
	elseif event == "Callback" then
		local func = ent[data]

		if func then
			func(ent)
		end
	else
		sg.ThrowError("Unhandled animation event: %s", event)
	end
end

function BASE:HandleAnimationEffects(ent, rate, lastCycle, cycle)
	if lastCycle == cycle then
		return
	end

	for frame, events in pairs(self.Events) do
		if frame > lastCycle and frame <= cycle then
			for _, event in ipairs(events) do
				self:RunAnimationEvent(ent, rate, unpack(event))
			end
		end
	end
end

if CLIENT then
	function BASE:Lerp(from, to, cycle)
		if isvector(from) then
			return LerpVector(cycle, from, to)
		elseif isangle(from) then
			return LerpAngle(cycle, from, to)
		elseif IsColor(from) then
			return from:Lerp(to, cycle)
		else
			return Lerp(cycle, from, to)
		end
	end

	-- Properly adds a value to a shadow table, adding or mixing where necessary
	function BASE:WriteProxy(element, key, value)
		local proxy = element._proxy
		local existing = rawget(proxy, key)

		if not existing then
			proxy[key] = value

			return
		end

		if isvector(value) or isangle(value) then
			existing:Add(value)
		elseif IsColor(value) then
			-- Really need to change this, post-processing step where colors are added to a table and then averaged? Make everything additive?
			proxy[key] = existing:Lerp(value, 0.5)
		elseif isnumber(value) then
			proxy[key] = existing + value
		else
			proxy[key] = value
		end
	end

	-- Processes a single key for a single layer
	function BASE:ProcessLayerKey(layer, key, cycle, fallback)
		local frame1, value1
		local frame2, value2
		local ease = false

		for frame, data in SortedPairs(layer) do
			local easeData = data[1]

			if easeData then
				if isfunction(easeData) then
					ease = easeData
				elseif easeData[key] != nil then
					ease = easeData[key]
				end
			end

			-- This frame doesn't have our key
			if not data[key] then
				continue
			end

			if frame < cycle then
				frame1, value1 = frame, data[key]
			elseif frame >= cycle then
				frame2, value2 = frame, data[key]
				break
			end
		end

		if not frame1 then
			frame1 = 0
			value1 = fallback
		end

		if not frame2 then
			frame2 = 1
			value2 = fallback
		end

		if value1 == nil or value2 == nil then
			return
		end

		local localCycle = math.Remap(cycle, frame1, frame2, 0, 1)

		if ease then
			localCycle = ease(localCycle)
		end

		return self:Lerp(value1, value2, localCycle)
	end

	-- Gets all of the keys a layer uses
	function BASE:GetLayerKeys(layer)
		local keys = {}

		for frame, data in pairs(layer) do
			for key in pairs(data) do
				if key != 1 and not keys[key] then
					keys[key] = true
				end
			end
		end

		return keys
	end

	-- Populates a single element's proxy table with the animation results
	function BASE:PopulateElementProxy(ent, element, layers, cycle)
		for _, layer in ipairs(layers) do
			if isfunction(layer) then
				local callback = layer(ent, element, cycle)

				if not istable(callback) then
					continue
				end

				for k, v in pairs(callback) do
					self:WriteProxy(element, k, v)
				end
			else
				local keys = self:GetLayerKeys(layer)

				for key in pairs(keys) do
					local val = self:ProcessLayerKey(layer, key, cycle, element[key])

					if val then
						self:WriteProxy(element, key, val)
					end
				end
			end
		end
	end

	-- Processes a single animation table
	function BASE:ProcessAnimationTable(ent, source, target, cycle)
		for name, element in pairs(target) do
			local proxy = element._proxy

			for key in pairs(proxy) do
				proxy[key] = nil
			end

			local layers = source[name]
			if not layers then continue end

			self:PopulateElementProxy(ent, element, layers, cycle)
		end
	end

	function BASE:UpdateSCK(ent, cycle)
	end

	function BASE:ProcessKeyframeTable(frame, dest, data)
		if data == nil then return end

		for name, element in pairs(data) do
			if not dest[name] then dest[name] = {} end
			local layer = dest[name]

			layer[frame] = element
		end
	end

	function BASE:FixElements(data)
		if data == nil then return end

		for _, element in pairs(data) do
			sg.SCK.FixElementPositions(element)
		end
	end
end

function BASE:Initialize()
	self.Events = {}
end



WEAPON = WEAPON or setmetatable({}, {__index = BASE})

if CLIENT then
	function WEAPON:AddVElementLayer(name, data) self:Insert(self.VElements, name, data) return self end
	function WEAPON:AddWElementLayer(name, data) self:Insert(self.WElements, name, data) return self end
	function WEAPON:AddVBoneModLayer(name, data) self:Insert(self.VBoneMods, name, data) return self end
	function WEAPON:AddViewModelOffsets(data) self.VMOffsets = data end

	-- For adding to both at the same time
	function WEAPON:AddElementLayer(name, data) self:Insert(self.VElements, name, data) self:Insert(self.WElements, name, data) return self end

	function WEAPON:UpdateSCK(ent, cycle)
		self:ProcessAnimationTable(ent, self.VElements, ent.VElements, cycle)
		self:ProcessAnimationTable(ent, self.WElements, ent.WElements, cycle)

		self:ProcessAnimationTable(ent, self.VBoneMods, ent.ViewModelBoneMods, cycle)
	end

	function WEAPON:GetViewModelOffset(pos, ang, cycle)
		local offsetPos, offsetAng

		if isfunction(self.VMOffsets) then
			offsetPos, offsetAng = self.VMOffsets(ent, cycle)
		else
			offsetPos = self:ProcessLayerKey(self.VMOffsets, "pos", cycle, vector_origin)
			offsetAng = self:ProcessLayerKey(self.VMOffsets, "angle", cycle, angle_zero)
		end

		if offsetPos then pos:Add(offsetPos) end
		if offsetAng then ang:Add(offsetAng) end
	end

	function WEAPON:ImportKeyframes(data)
		local vBoneMods = {}
		local vElements = {}
		local wElements = {}

		local elements = {}

		for frame, tables in SortedPairs(data) do
			if isnumber(tables) then
				tables = data[tables]
			else
				self:FixElements(tables.VElements)
				self:FixElements(tables.WElements)
				self:FixElements(tables.Elements)
			end

			self:ProcessKeyframeTable(frame, vBoneMods, tables.ViewModelBoneMods)

			self:ProcessKeyframeTable(frame, vElements, tables.VElements)
			self:ProcessKeyframeTable(frame, wElements, tables.WElements)
			self:ProcessKeyframeTable(frame, elements, tables.Elements)
		end

		for name, layerData in pairs(vBoneMods) do self:AddVBoneModLayer(name, layerData) end
		for name, layerData in pairs(vElements) do self:AddVElementLayer(name, layerData) end
		for name, layerData in pairs(wElements) do self:AddWElementLayer(name, layerData) end
		for name, layerData in pairs(elements) do self:AddElementLayer(name, layerData) end
	end
end

function WEAPON:Initialize()
	BASE.Initialize(self)

	self.VElements = {}
	self.WElements = {}

	self.VBoneMods = {}
	self.VMOffsets = {}
end

function Weapon(duration)
	local anim = setmetatable({Duration = duration}, {__index = WEAPON})
	anim:Initialize()

	return anim
end

function WeaponSequence(sequence)
	local anim = setmetatable({Sequence = sequence}, {__index = WEAPON})
	anim:Initialize()
	anim:AddEvent(0, "VMSequence", sequence)

	return anim
end
