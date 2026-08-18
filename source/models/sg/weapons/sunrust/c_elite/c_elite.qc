// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_elite.mdl"
$body studio "v_elite_ref.smd"

$surfaceprop "default"
$contents "solid"

$illumposition 0.005 -16.172 -8.621

$cdmaterials "models\weapons\v_models\pist_elite\"

$attachment "1" "v_weapon.elite_right" 0 2.88 7.81 rotate -90 0 0
$attachment "2" "v_weapon.elite_left" 0.04 3.16 8.04 rotate -90 0 0
$attachment "3" "v_weapon.elite_right" -0.16 2.74 2.92 rotate 0 120 0
$attachment "4" "v_weapon.elite_left" 0.01 3.04 3.39 rotate 0 60 0

$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999927 -90.000037 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033348 1.000767 1.93766 -73.711859 168.619339 91.48048 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028145 0.000003 0.000002 2.740114 -33.53431 -90.717104 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692553 0.000081 -0.000006 0.000003 -3.461696 -0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.48167 -0.000089 -0.000026 -6.111334 2.510702 90.349947 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859701 -0.142417 -1.191976 8.68249 -50.431576 -26.821816 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312561 -0.000008 0.000005 -0.000173 -25.194268 -0.000009 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729362 -0.000008 0.000003 -0.000174 -13.997583 0.00005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942327 0.046754 -0.431443 4.194168 -46.466361 -8.696352 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539093 0.000008 -0.000007 0.000345 -14.19738 -0.00012 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196322 -0.000004 0.000002 -0.000402 -24.68365 0.00005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.883692 -0.046784 0.431443 1.251055 -33.68219 4.921822 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.719578 -0.00001 0.000009 0.31593 -20.997755 0.000116 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209183 -0.000006 0.000004 0.177103 -12.398462 0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859858 -0.137962 1.332466 -2.449451 -30.465601 20.308487 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719431 0.000002 -0.000005 0.23371 -20.798599 -0.00022 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099674 -0.000004 0.000002 0.148686 -13.999193 0.000294 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.80604 -0.348928 1.321258 -38.916222 -45.196065 -70.054634 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.78978 -0.000002 -0.000008 -0.000055 13.093456 -0.000123 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.207001 0 0 -0.000051 20.790456 0.000108 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.93761 73.71203 168.618779 -95.596496 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028141 0 -0.000002 -0.461861 -33.624144 93.947661 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692554 0 -0.000001 -0.000003 -3.45866 -0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481703 -0.000001 -0.000004 6.10824 2.530525 -89.676607 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859676 -0.132545 1.19311 -9.056628 -50.352513 26.713244 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312559 -0.000004 0.000001 0.000061 -25.191464 0.000118 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729368 -0.000004 -0.000002 0.000176 -13.995983 0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942295 0.050346 0.431044 -4.537252 -46.420995 8.598778 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539106 0 0.000001 -0.000172 -14.196006 0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196321 -0.000002 -0.000002 0.000116 -24.680953 -0.000168 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883663 -0.050303 -0.431042 -1.512608 -33.672221 -4.921994 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719582 0.000002 0.000006 -0.456761 -20.995356 0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209183 0.000004 0.000006 -0.256054 -12.39709 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859833 -0.148919 -1.331282 2.209956 -30.481362 -20.30694 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719431 0.000008 0.00001 -0.37878 -20.796712 0.000172 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099665 0.000002 0.000007 -0.241327 -13.99799 0.000231 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806023 -0.359832 -1.318335 38.596152 -45.467132 69.981408 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789785 -0.000004 -0.000004 -0.000065 13.095012 -0.000111 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.207003 -0.000002 -0.000008 -0.000123 20.793213 0.000229 0 0 0 0 0 0
$definebone "v_weapon.elite_left" "" 6.449219 -21.140621 -6.460938 -0.735907 -0.169538 90.12397 0 0 0 0 0 0
$definebone "v_weapon.magazine_left" "v_weapon.elite_left" -0.011983 -1.990234 0.033049 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.hammer_left" "v_weapon.elite_left" -0.01199 2.845705 -0.610838 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.trigger_left" "v_weapon.elite_left" -0.00976 1.361326 2.511719 0 0 0.000115 0 0 0 0 0 0
$definebone "v_weapon.slide_left" "v_weapon.elite_left" -0.011991 2.8457 5.746098 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.elite_right" "" -6.535155 -21.359371 -6.183594 -0.937474 0.017533 90.113657 0 0 0 0 0 0
$definebone "v_weapon.magazine_right" "v_weapon.elite_right" -0.005428 -2.294923 -0.251936 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.hammer_right" "v_weapon.elite_right" -0.005429 2.539058 -0.896008 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.trigger_right" "v_weapon.elite_right" -0.005428 1.052747 2.226559 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.slide_right" "v_weapon.elite_right" -0.005429 2.539093 5.460926 0 0 0 0 0 0 0 0 0

$bonemerge "ValveBiped.Bip01_Spine4"
$bonemerge "ValveBiped.Bip01_L_Clavicle"
$bonemerge "ValveBiped.Bip01_L_UpperArm"
$bonemerge "ValveBiped.Bip01_L_Forearm"
$bonemerge "ValveBiped.Bip01_L_Hand"
$bonemerge "ValveBiped.Bip01_L_Finger4"
$bonemerge "ValveBiped.Bip01_L_Finger41"
$bonemerge "ValveBiped.Bip01_L_Finger42"
$bonemerge "ValveBiped.Bip01_L_Finger3"
$bonemerge "ValveBiped.Bip01_L_Finger31"
$bonemerge "ValveBiped.Bip01_L_Finger32"
$bonemerge "ValveBiped.Bip01_L_Finger2"
$bonemerge "ValveBiped.Bip01_L_Finger21"
$bonemerge "ValveBiped.Bip01_L_Finger22"
$bonemerge "ValveBiped.Bip01_L_Finger1"
$bonemerge "ValveBiped.Bip01_L_Finger11"
$bonemerge "ValveBiped.Bip01_L_Finger12"
$bonemerge "ValveBiped.Bip01_L_Finger0"
$bonemerge "ValveBiped.Bip01_L_Finger01"
$bonemerge "ValveBiped.Bip01_L_Finger02"
$bonemerge "ValveBiped.Bip01_R_Clavicle"
$bonemerge "ValveBiped.Bip01_R_UpperArm"
$bonemerge "ValveBiped.Bip01_R_Forearm"
$bonemerge "ValveBiped.Bip01_R_Hand"
$bonemerge "ValveBiped.Bip01_R_Finger4"
$bonemerge "ValveBiped.Bip01_R_Finger41"
$bonemerge "ValveBiped.Bip01_R_Finger42"
$bonemerge "ValveBiped.Bip01_R_Finger3"
$bonemerge "ValveBiped.Bip01_R_Finger31"
$bonemerge "ValveBiped.Bip01_R_Finger32"
$bonemerge "ValveBiped.Bip01_R_Finger2"
$bonemerge "ValveBiped.Bip01_R_Finger21"
$bonemerge "ValveBiped.Bip01_R_Finger22"
$bonemerge "ValveBiped.Bip01_R_Finger1"
$bonemerge "ValveBiped.Bip01_R_Finger11"
$bonemerge "ValveBiped.Bip01_R_Finger12"
$bonemerge "ValveBiped.Bip01_R_Finger0"
$bonemerge "ValveBiped.Bip01_R_Finger01"
$bonemerge "ValveBiped.Bip01_R_Finger02"

$sequence "fire_left" {
	"anims\fire_left.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 5011 1 "2" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_9mm 4 90" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "fire_right" {
	"anims\fire_right.smd"
	activity "ACT_VM_SECONDARYATTACK" 1
	{ event 5001 1 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_9mm 3 90" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "reload" {
	"anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	{ event 5004 0 "Weapon_ELITE.Reloadstart" }
	{ event 5004 32 "Weapon_ELITE.Clipout" }
	{ event 5004 44 "Weapon_ELITE.Clipout" }
	{ event 5004 75 "Weapon_ELITE.Rclipin" }
	{ event 5004 105 "Weapon_ELITE.Lclipin" }
	{ event 5004 135 "Weapon_ELITE.Deploy" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_empty" {
	"anims\reload_empty.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
	{ event 5004 0 "Weapon_ELITE.Reloadstart" }
	{ event 5004 32 "Weapon_ELITE.Clipout" }
	{ event 5004 44 "Weapon_ELITE.Clipout" }
	{ event 5004 75 "Weapon_ELITE.Rclipin" }
	{ event 5004 105 "Weapon_ELITE.Lclipin" }
	{ event 5004 135 "Weapon_ELITE.Reloadstart" }
	{ event 5004 171 "Weapon_ELITE.Sliderelease" }
	fadein 0.1
	fadeout 0.2
	fps 60
}

$sequence "draw" {
	"anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	{ event 5004 1 "Weapon_ELITE.Deploy" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "inspect" {
	"anims\inspect.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}
