local TRAIT = {}

TRAIT.Mult = 0.1 -- The multiplier to use when in a hyper burst

function TRAIT:Hook_MultiplyRecoil(ent, val)
	if ent:IsBurstFire() and not ent:IsFinalBurstShot() then
		return val * self.Mult
	end
end

sg.RegisterTrait("HyperBurst", TRAIT)
