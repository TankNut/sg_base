local TRAIT = {}

TRAIT.x = 1
TRAIT.y = 1

function TRAIT:Hook_ModifyBullet(ent, bullet)
	bullet.Spread.x = bullet.Spread.x * self.x
	bullet.Spread.y = bullet.Spread.y * self.y
end

sg.RegisterTrait("SpreadMod", TRAIT)
