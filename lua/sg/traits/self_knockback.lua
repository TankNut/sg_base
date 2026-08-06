local TRAIT = {}

TRAIT.Force = 1000 -- A reminder to put in your own config

function TRAIT:Hook_PostFireWeapon(ent)
	local ply = ent:GetOwner()

	if ply:IsPlayer() and IsFirstTimePredicted() then
		ply:SetVelocity(ent:GetShootDir() * -self.Force)
	end
end

sg.RegisterTrait("SelfKnockback", TRAIT)
