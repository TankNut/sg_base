module("sg", package.seeall)

if CLIENT then
	EffectQueue = EffectQueue or {}
end

function Effect(classname, origin, data, filter, owner)
	if CLIENT then
		local effect = EffectData()
		effect:SetOrigin(origin)
		effect:SetHitBox(table.insert(EffectQueue, data))

		util.Effect(classname, effect, true)
	else
		if not filter then
			filter = RecipientFilter()
			filter:AddPAS(origin)

			-- SuppressHostEvents standin
			if not game.SinglePlayer() and owner:IsValid() then
				filter:RemovePlayer(owner)
			end
		end

		net.Start("sg_effect")
			net.WriteString(classname)
			net.WriteVector(origin)

			net.WriteUInt(table.Count(data), 8)

			for k, v in pairs(data) do
				net.WriteString(k)
				net.WriteType(v)
			end
		net.Send(filter)
	end
end

if CLIENT then
	function GetEffectData(effectdata)
		local index = effectdata:GetHitBox()
		local data = EffectQueue[index]

		EffectQueue[index] = nil

		return data
	end

	function GetEffectOrigin(data)
		local ent = data.Entity
		local pos = data.Start or data.Origin
		local ang = data.Angle or angle_zero

		if data.Attachment and IsValid(ent) and not ent:IsDormant() then
			local pos2, ang2 = ent:GetCustomAttachment(data.Attachment)

			return pos2 or pos, ang2 or ang
		end

		return pos, ang
	end

	-- function GetEffectOrigin(data)
	-- 	local ent = data.Entity
	-- 	local pos = data.Start or data.Origin or Vector()

	-- 	if data.Detach or not ent or not ent:IsWeapon() or ent:IsDormant() then
	-- 		return pos
	-- 	end

	-- 	return ent:GetTracerOrigin()
	-- end

	net.Receive("sg_effect", function()
		local classname = net.ReadString()
		local origin = net.ReadVector()
		local data = {
			Origin = origin
		}

		for i = 1, net.ReadUInt(8) do -- If you have more than 255 values being passed to an effect... what
			data[net.ReadString()] = net.ReadType()
		end

		Effect(classname, origin, data)
	end)
else
	util.AddNetworkString("sg_effect")
end
