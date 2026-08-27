local TRAIT = {}

TRAIT.Distance = 1000
TRAIT.Multiplier = 1

local developerMode = sg.Convars.DeveloperMode
local color_red = Color(255, 0, 0)
local debugTime = 20

local STEP_SIZE = 4

function TRAIT:HandlePenetration(ent, attacker, tr, bullet, damage, distance)
	if distance <= 0 or not tr.Hit or tr.StartSolid then
		return
	end

	local start = tr.HitPos
	local dir = tr.Normal

	local trace
	local hit = false

	for i = STEP_SIZE, distance + STEP_SIZE, STEP_SIZE do
		local pos = start + dir * i
		local contents = util.PointContents(pos)

		if bit.band(contents, MASK_SHOT) == 0 or bit.band(contents, CONTENTS_HITBOX) == CONTENTS_HITBOX then
			-- We're back in the world, trace back to find our exit point
			trace = util.TraceLine({
				start = pos,
				endpos = pos - dir * STEP_SIZE,
				mask = bit.bor(MASK_SHOT, CONTENTS_HITBOX),
			})

			if not trace.StartSolid then
				hit = true

				break
			end
		end
	end

	if hit then
		distance = distance - start:Distance(trace.HitPos)

		-- 0 thickness surface, nudge ourselves forward so we don't end up infinitely hitting the same spot
		if trace.HitPos == start then
			trace.HitPos:Add(dir)
		end

		local newDamage = bullet.Damage * Lerp(distance / self.Distance, self.Multiplier, 1)

		if newDamage <= 1 then
			return
		end

		if developerMode:GetBool() then
			debugoverlay.Cross(start, 5, debugTime, color_red, true)
			debugoverlay.Cross(trace.HitPos, 5, debugTime, color_red, true)
			debugoverlay.Line(start, trace.HitPos, debugTime, color_red, true)
			debugoverlay.Text(trace.HitPos, string.format("%i/%i (%i)", distance, self.Distance, newDamage), debugTime, false)
		end

		local effect = EffectData()
		effect:SetEntity(trace.Entity)
		effect:SetOrigin(trace.HitPos)
		effect:SetStart(trace.StartPos)
		effect:SetSurfaceProp(trace.SurfaceProps)
		effect:SetDamageType(DMG_BULLET)
		effect:SetHitBox(trace.HitBox)

		util.Effect("Impact", effect, false)

		local callback = function(_, tr2)
			local tracer = EffectData()
			tracer:SetStart(tr2.StartPos)
			tracer:SetEntity(ent)
			tracer:SetOrigin(tr2.HitPos)
			tracer:SetAttachment(0) -- Force an invalid attachment so we render at the start pos rather than the weapon's muzzle

			util.Effect(bullet.TracerName, tracer, true)

			self:HandlePenetration(ent, attacker, tr2, bullet, damage, distance)
		end

		attacker:FireBullets({
			Inflictor = ent,

			Src = trace.HitPos,
			Dir = dir,

			Num = 1,
			Damage = newDamage,
			Force = bullet.Force,
			Spread = vector_origin,

			Tracer = 0,
			TracerName = "",

			Callback = callback,
			IgnoreEntity = tr.Entity
		})
	elseif developerMode:GetBool() then
		debugoverlay.Cross(start, 5, debugTime, color_red, true)
		debugoverlay.Text(start, "0", debugTime, false)
	end
end

function TRAIT:Hook_BulletCallback(ent, attacker, tr, dmg, bullet)
	self:HandlePenetration(ent, attacker, tr, bullet, bullet.Damage, self.Distance)
end

sg.RegisterTrait("Penetration", TRAIT)
