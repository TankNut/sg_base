local TRAIT = {}

TRAIT.ShotsToOverheat = 1

TRAIT.CoolingDelay = 1
TRAIT.CoolingTime = 10

function TRAIT:SetupNetworkVars(ent)
	ent:NetworkVar("Float", "Heat")
	ent:NetworkVar("Bool", "Overheating")
end

function TRAIT:OnOverheat(ent)
	if ent.OnOverheat then
		ent:OnOverheat()
	end

	ent:SetOverheating(true)
end

function TRAIT:OnCool(ent)
	if ent.OnCool then
		ent:OnCool()
	end

	ent:SetOverheating(false)
end

function TRAIT:Hook_Think(ent)
	local heat = ent:GetHeat()

	if heat > 0 and CurTime() - ent:GetLastAttack() > self.CoolingDelay then
		heat = math.Approach(heat, 0, (1 / self.CoolingTime) * FrameTime())

		ent:SetHeat(heat)

		if heat == 0 then
			self:OnCool(ent)
		end
	end
end

function TRAIT:Hook_PostFireWeapon(ent)
	local heat = math.min(ent:GetHeat() + (1 / self.ShotsToOverheat), 1)

	ent:SetHeat(heat)

	if heat == 1 then
		self:OnOverheat(ent)
	end
end

sg.RegisterTrait("Heat", TRAIT)
