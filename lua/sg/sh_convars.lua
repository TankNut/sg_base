module("sg.Convars", package.seeall)

-- Client settings
if CLIENT then
	ViewModelSway = CreateClientConVar("sg_vm_sway", 1, true, false)
	LODMultiplier = CreateClientConVar("sg_sck_lod", 1, true, false)
	DrawWorldSCK = CreateClientConVar("sg_sck_worldmodels", 1, true, false)
end

-- Server settings
InfiniteAmmo = CreateConVar("sg_infiniteammo", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY})
MovementModifiers = CreateConVar("sg_movement", 1, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY})

-- Experimental settings
Exp_Recoil = CreateConVar("sg_exp_recoil", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY})

-- Developer stuff
DeveloperMode = CreateConVar("sg_developer", 0, {FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY})
