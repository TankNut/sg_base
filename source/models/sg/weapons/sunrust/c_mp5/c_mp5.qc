// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_mp5.mdl"
$body studio "c_smg_mp5_mp5_mirrored_ref.smd"

$surfaceprop "default"
$contents "solid"

$illumposition -3.173 -13.048 -8.115

$cdmaterials "models\weapons\V_models\smg_mp5\"
$cdmaterials "models\sg\shells"

$attachment "1" "v_weapon.MP5_Parent" 0.13 3.87 -17.47 rotate 90 0 0
$attachment "2" "v_weapon.MP5_Parent" 0 4.67 -6 rotate 0 20 0

$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999927 -90.000037 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033348 1.000767 1.93766 -73.711859 168.619339 91.48048 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028145 0.000003 0.000002 2.740114 -33.53431 -90.717104 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692553 0.000081 -0.000005 0.000003 -3.461696 -0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481672 -0.000089 -0.000024 -6.111391 2.510702 90.349947 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859703 -0.142416 -1.191975 8.682489 -50.431573 -26.821816 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312563 -0.00001 0.000004 -0.000173 -25.194268 -0.000005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729363 0 0.000003 -0.000174 -13.997585 0.000053 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942329 0.046754 -0.431444 4.194167 -46.466364 -8.696352 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539093 0.000006 -0.000006 0.000346 -14.197383 -0.000118 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196322 -0.000006 0.000003 -0.000401 -24.683653 0.000053 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.88369 -0.046784 0.431443 1.251055 -33.682187 4.921822 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.719582 -0.00001 0.000009 0.31593 -20.997755 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209181 -0.000006 0.000003 0.177102 -12.398462 0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859856 -0.137963 1.332466 -2.449451 -30.465601 20.308487 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719435 0 -0.000005 0.233709 -20.798594 -0.000224 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099678 -0.000006 0.000003 0.148685 -13.999192 0.000292 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806042 -0.348929 1.321258 -38.916219 -45.196058 -70.054634 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.789783 0 -0.000008 -0.000055 13.093456 -0.000123 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.207001 0.000001 -0.000002 -0.000054 20.790456 0.000108 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.93761 73.71203 168.618779 -95.596496 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028141 0 -0.000002 -0.461861 -33.624144 93.947661 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692556 0 -0.000002 -0.000003 -3.45866 -0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481703 -0.000001 -0.000005 6.10824 2.530525 -89.676607 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859676 -0.132545 1.19311 -9.056628 -50.352513 26.713244 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312559 -0.000004 -0.000001 0.000061 -25.191464 0.000118 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729365 -0.000002 -0.000001 0.000176 -13.995983 0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942299 0.050347 0.431044 -4.537252 -46.420995 8.598778 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539106 0 0.000001 -0.000172 -14.196006 0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196321 -0.000004 -0.000002 0.000116 -24.680953 -0.000168 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883663 -0.050304 -0.431042 -1.512608 -33.672221 -4.921994 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719582 0.000002 0.000006 -0.456761 -20.995356 0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209183 0.000002 0.000006 -0.256054 -12.39709 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859837 -0.148918 -1.331282 2.209956 -30.481362 -20.30694 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719429 0.000008 0.000011 -0.37878 -20.796712 0.000172 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099665 0 0.000006 -0.241327 -13.99799 0.000231 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806025 -0.359831 -1.318334 38.596152 -45.467132 69.981408 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789782 -0.000008 -0.000004 -0.000065 13.095012 -0.000111 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.207003 -0.000002 -0.000008 -0.000123 20.793213 0.000229 0 0 0 0 0 0
$definebone "v_weapon.MP5_Parent" "" -5.157886 -13.330607 -8.648888 -0.001757 -179.998229 90.001963 0 0 0 0 0 0
$definebone "v_weapon.MP5_Clip" "v_weapon.MP5_Parent" 0.02815 2.046865 -7.394535 0 0 -0.000401 0 0 0 0 0 0
$definebone "v_weapon.MP5_Bolt" "v_weapon.MP5_Parent" 0.028148 5.078109 -12.500008 0 0 -0.000401 0 0 0 0 0 0
$definebone "v_weapon.MP5_ClipRelease" "v_weapon.MP5_Parent" 0.02815 1.326164 -6.433592 0 0 -0.000401 0 0 0 0 0 0
$definebone "v_weapon.MP5_Trigger" "v_weapon.MP5_Parent" 0.025025 1.444311 -3.791368 0 0 -0.000401 0 0 0 0 0 0
$definebone "v_weapon.MP5_Clip2" "v_weapon.MP5_Parent" 5.02815 2.046713 -7.394381 0 -0.000172 -0.000401 0 0 0 0 0 0

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
	{ event 5004 17 "Weapon_MP5Navy.Slideback" }
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

$sequence "inspect" {
	"anims\inspect.smd"
	{ event 5004 109 "Weapon_MP5Navy.Clipout" }
	{ event 5004 372 "Weapon_MP5Navy.Clipin" }
	fadein 0.2
	fadeout 0.2
	fps 70
}

$sequence "reload_simple" {
	"anims\reload_simple.smd"
	activity "ACT_VM_RELOAD" 1
	{ event 5004 10 "Weapon_MP5Navy.Clipout" }
	{ event 5004 105 "Weapon_MP5Navy.Clipin" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_css_style" {
	"anims\reload_css_style.smd"
	{ event AE_CL_BODYGROUP_SET_VALUE 0 "bullet 1" }
	{ event AE_CL_BODYGROUP_SET_VALUE 60 "bullet 0" }
	{ event 5004 16 "Weapon_MP5Navy.Clipout" }
	{ event 5004 69 "Weapon_MP5Navy.Clipin" }
	{ event 5004 133 "Weapon_MP5Navy.Slideback" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_empty" {
	"anims\reload_empty.smd"
	{ event AE_CL_BODYGROUP_SET_VALUE 0 "bullet 1" }
	{ event AE_CL_BODYGROUP_SET_VALUE 60 "bullet 0" }
	{ event 5004 18 "Weapon_MP5Navy.Clipout" }
	{ event 5004 97 "Weapon_MP5Navy.Slideback" }
	{ event 5004 105 "Weapon_MP5Navy.Clipin" }
	{ event 5004 160 "Weapon_UMP45.Boltslap" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_empty_simple" {
	"anims\reload_empty_simple.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
	{ event AE_CL_BODYGROUP_SET_VALUE 0 "bullet 1" }
	{ event AE_CL_BODYGROUP_SET_VALUE 100 "bullet 0" }
	{ event 5004 21 "Weapon_MP5Navy.Slideback" }
	{ event 5004 47 "Weapon_MP5Navy.Clipout" }
	{ event 5004 102 "Weapon_MP5Navy.Clipin" }
	{ event 5004 158 "Weapon_UMP45.Boltslap" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_tactical" {
	"anims\reload_tactical.smd"
	{ event 5004 47 "Weapon_MP5Navy.Clipout" }
	{ event 5004 82 "Weapon_MP5Navy.Clipin" }
	fadein 0.2
	fadeout 0
	fps 60
}

$sequence "_reload1" {
	"anims\c_reload1.smd"
	{ event 5004 12 "Weapon_MP5Navy.Clipout" }
	{ event 5004 44 "Weapon_MP5Navy.Clipin" }
	{ event 5004 86 "Weapon_MP5Navy.Slideback" }
	fadein 0.2
	fadeout 0.2
	fps 38
}

$sequence "_draw" {
	"anims\c_draw.smd"
	{ event 5004 13 "Weapon_MP5Navy.Slideback" }
	fadein 0.2
	fadeout 0.2
	fps 35
}

$sequence "_shoot1" {
	"anims\c_shoot1.smd"
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_9mm 2 100" }
	{ event 5001 0 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "_shoot2" {
	"anims\c_shoot2.smd"
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_9mm 2 100" }
	{ event 5001 0 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "_shoot3" {
	"anims\c_shoot3.smd"
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_9mm 2 100" }
	{ event 5001 0 "1" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}
