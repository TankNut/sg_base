local TRAIT = {}

TRAIT.Force = 1000 -- A reminder to put in your own config
TRAIT.Cartoony = false -- If enabled, applies knockback when crouching and while in the air

function TRAIT:Hook_PostFireWeapon(ent)
	local ply = ent:GetOwner()

	if ply:IsPlayer() and IsFirstTimePredicted() then
		if not self.Cartoony and (ply:Crouching() or not ply:IsOnGround()) then
			return
		end

		ply:SetVelocity(ent:GetShootDir() * -self.Force)
	end
end

sg.RegisterTrait("SelfKnockback", TRAIT)
