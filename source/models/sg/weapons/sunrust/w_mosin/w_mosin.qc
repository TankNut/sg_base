// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/w_mosin.mdl"
$body studio "w_mosin_base.smd"

$bodygroup "variant"
{
	studio "bodygroup0_sniper.smd"
	studio "bodygroup1_carbine.smd"
	studio "bodygroup2_obrez.smd"
}

$surfaceprop "weapon"
$contents "solid"

$illumposition 0.874 1.085 -1.202

$cdmaterials "models\sg\weapons\"

$attachment "muzzle1" "muzzle1" 0 0 0 rotate 0 180 0
$attachment "muzzle2" "muzzle2" 0 0 0 rotate 0 180 0
$attachment "muzzle3" "muzzle3" 0 0 0 rotate 0 180 0
$attachment "eject" "eject" 0 0 0 rotate -25 90 0

$definebone "ValveBiped.Bip01_R_Hand" "" 0.312503 -16.21932 -0.217373 12.461602 88.326429 177.528802 0 0 0 0 0 0
$definebone "muzzle3" "" 0 10.4 1.564834 0 -89.999982 0 0 0 0 0 0 0
$definebone "muzzle2" "" 0 21.4 1.564834 0 -89.999982 0 0 0 0 0 0 0
$definebone "muzzle1" "" 0 29.249994 1.564833 0 -89.999982 0 0 0 0 0 0 0
$definebone "eject" "" 1 -7 2 0 -89.999982 0 0 0 0 0 0 0

$sequence "idle1" {
	"anims\idle1.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "fire" {
	"anims\fire.smd"
	activity "ACT_RANGE_ATTACK_AR2" 1
	{ event 3007 0 "1" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$collisionmodel "w_mosin_physics.smd"
{
	$mass 20
	$inertia 1
	$damping 0
	$rotdamping 0
	$rootbone "ValveBiped.Bip01_R_Hand"
}
