// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_galil.mdl"
$body studio "v_galil_ref.smd"

$bodygroup "bottle"
{
	studio "bottle_ref.smd"
	blank
}


$surfaceprop "default"
$contents "solid"

$illumposition -3.67 -22.024 -9.223

$cdmaterials "models\weapons\v_models\rif_galil\"
$cdmaterials "models\props_junk\"

$attachment "1" "v_weapon.galil" 0.06 0.1 29.98 rotate -90 0 0
$attachment "2" "v_weapon.galil" 0.92 0.84 6.28 rotate 0 0 -180

$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999927 -90.000037 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033348 1.000767 1.93766 -73.711859 168.619339 91.48048 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028139 0.000008 0.000002 2.738625 -33.534248 -90.717207 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692572 0.000164 -0.000016 0.000007 -3.459118 -0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481691 -0.00008 -0.000043 -6.111217 2.509613 90.349947 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859707 -0.142409 -1.191976 8.682602 -50.431231 -26.821989 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312563 -0.000015 0.000004 -0.000118 -25.194382 0.000108 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729371 -0.000002 0 -0.000178 -13.99758 0.000108 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942329 0.046763 -0.431444 4.194166 -46.466074 -8.696351 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539099 0.000004 -0.000005 0.000344 -14.197317 -0.000061 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196325 -0.000006 0.000002 -0.000346 -24.683636 0.000054 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.88369 -0.046774 0.431442 1.251054 -33.681845 4.921765 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.719578 -0.000011 0.000009 0.315929 -20.997753 0.000058 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209183 -0.000008 0.000004 0.177102 -12.398456 0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859859 -0.137951 1.332466 -2.449509 -30.465314 20.308434 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719431 -0.000002 -0.000004 0.233711 -20.798592 -0.000169 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099672 -0.000004 0.000004 0.148685 -13.999124 0.000232 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806044 -0.348929 1.32126 -38.916092 -45.19583 -70.054634 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.789787 0 -0.000006 -0.000052 13.093408 -0.000121 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.207001 0.000002 0.000002 0.000008 20.790408 0.000053 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.937609 73.71203 168.618779 -95.596496 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028136 0.000001 -0.000003 -0.461803 -33.624144 93.947497 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692558 0.000002 0.000001 0.000055 -3.458546 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481697 -0.000001 -0.000002 6.108188 2.530468 -89.676661 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859676 -0.132547 1.193109 -9.056515 -50.352803 26.713177 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312563 0.000002 -0.000001 0.000114 -25.191464 0.000236 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729364 0.000004 -0.000002 0.000174 -13.996038 0.000063 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942295 0.050343 0.431044 -4.537196 -46.421449 8.598779 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539101 0.000011 0.000002 -0.000173 -14.196014 0.000172 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196321 0.000002 -0.000003 0.000114 -24.680962 -0.000171 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883656 -0.050304 -0.431042 -1.512608 -33.671934 -4.921994 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719584 -0.000004 0.000007 -0.456819 -20.995301 0.000057 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209188 -0.000004 0.000006 -0.256055 -12.397784 0.000057 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859829 -0.148921 -1.331282 2.210071 -30.481013 -20.306827 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719433 -0.000008 0.000011 -0.378782 -20.797456 -0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099669 0.000011 0.000006 -0.241329 -13.997995 0.000167 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806023 -0.359831 -1.318334 38.596282 -45.467186 69.98164 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789782 -0.000004 -0.000004 0.000053 13.095054 -0.000171 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.206997 -0.000003 -0.000006 -0.000064 20.793205 0.000059 0 0 0 0 0 0
$definebone "v_weapon.galil" "" -6.393696 -17.746056 -5.387151 0.001547 0.000802 90.003076 0 0 0 0 0 0
$definebone "v_weapon.trigger" "v_weapon.galil" 0.075562 -1.768556 0.900875 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.latch" "v_weapon.galil" 0.075562 -2.400394 3.259762 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.magazine" "v_weapon.galil" 0.075563 -1.355474 5.355465 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.handle" "v_weapon.galil" 0.661621 1.201162 9.453125 -0.000057 6.304942 89.999982 0 0 0 0 0 0
$definebone "v_weapon.bolt" "v_weapon.galil" 0.871582 1.61718 7.859375 0 0 0 0 0 0 0 0 0
$definebone "cap" "" 17.5725 19.893883 -7.710544 0 0 89.999982 0 0 0 0 0 0
$definebone "bottle" "" 17.5725 19.893883 -14.43742 0 0 89.999982 0 0 0 0 0 0

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

$sequence "draw" {
	"anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "fire" {
	"anims\fire.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "reload" {
	"anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	{ event 5004 45 "Weapon_Galil.Clipout" }
	{ event 5004 126 "Weapon_Galil.Clipin" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_empty" {
	"anims\reload_empty.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
	{ event 5004 21 "Weapon_Galil.Clipout" }
	{ event 5004 83 "Weapon_Galil.Clipin" }
	{ event 5004 125 "Weapon_Galil.Boltpull" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "inspect" {
	"anims\inspect.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "drink" {
	"anims\drink.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "_reload" {
	"anims\c_reload.smd"
	{ event 5004 16 "Weapon_Galil.Clipout" }
	{ event 5004 55 "Weapon_Galil.Clipin" }
	{ event 5004 91 "Weapon_Galil.Boltpull" }
	fadein 0.2
	fadeout 0.2
	fps 42
}

$sequence "_draw" {
	"anims\c_draw.smd"
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "_shoot1" {
	"anims\c_shoot1.smd"
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_556 2 75" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 35
}

$sequence "_shoot2" {
	"anims\c_shoot2.smd"
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_556 2 100" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 35
}

$sequence "_shoot3" {
	"anims\c_shoot3.smd"
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_556 2 115" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 35
}
