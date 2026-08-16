// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_sg552.mdl"
$body studio "sg552_mirrored_ref.smd"

$surfaceprop "default"
$contents "solid"

$illumposition -3.153 -21.059 -7.793

$cdmaterials "models\weapons\V_models\rif_sg552\"
$cdmaterials "models\weapons\v_models\snip_awp\"
$cdmaterials "models\sg\shells\"

$attachment "1" "v_weapon.sg552_Parent" 0 5.07 -22.27 rotate 90 0 0
$attachment "2" "v_weapon.sg552_Parent" 0 6.4 -4.8 rotate 5 168 0

$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999927 -90.000037 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033348 1.000767 1.93766 -73.711859 168.619339 91.48048 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028145 0.000003 0.000002 2.740114 -33.53431 -90.717104 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692553 0.000081 -0.000005 0.000003 -3.461696 -0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481672 -0.000089 -0.000024 -6.111334 2.510702 90.349947 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859699 -0.142417 -1.191975 8.68249 -50.431576 -26.821816 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312563 -0.000008 0.000005 -0.000173 -25.194268 -0.000009 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729362 -0.000008 0.000001 -0.000174 -13.997583 0.00005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942329 0.046753 -0.431444 4.194168 -46.466361 -8.696352 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539093 0.000006 -0.000007 0.000345 -14.19738 -0.00012 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196322 -0.000008 0.000002 -0.000402 -24.68365 0.00005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.88369 -0.046783 0.431443 1.251055 -33.68219 4.921822 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.71958 -0.00001 0.000009 0.31593 -20.997755 0.000116 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209183 -0.000004 0.000003 0.177103 -12.398462 0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859856 -0.137962 1.332466 -2.449451 -30.465601 20.308487 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719433 0.000002 -0.000004 0.23371 -20.798599 -0.00022 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099676 -0.000006 0.000003 0.148686 -13.999193 0.000294 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806042 -0.348929 1.321258 -38.916222 -45.196065 -70.054634 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.789782 0.000002 -0.000006 -0.000055 13.093456 -0.000123 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.206999 -0.000001 -0.000002 -0.000051 20.790456 0.000108 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.93761 73.71203 168.618779 -95.596496 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028141 0 -0.000002 -0.461861 -33.624144 93.947661 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692554 0 -0.000003 -0.000003 -3.45866 -0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481705 -0.000001 -0.000004 6.10824 2.530525 -89.676607 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859676 -0.132545 1.193109 -9.056628 -50.352513 26.713244 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312565 -0.000004 -0.000002 0.000061 -25.191464 0.000118 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729366 -0.000004 0 0.000176 -13.995983 0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942299 0.050349 0.431044 -4.537252 -46.420995 8.598778 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539104 0 0.000001 -0.000172 -14.196006 0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196322 0.000002 -0.000003 0.000116 -24.680953 -0.000168 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883663 -0.050303 -0.431042 -1.512608 -33.672221 -4.921994 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719584 0.000002 0.000006 -0.456761 -20.995356 0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209187 0.000004 0.000006 -0.256054 -12.39709 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859837 -0.148918 -1.331282 2.209956 -30.481362 -20.30694 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719431 0.000004 0.000013 -0.378779 -20.796654 0.000171 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099665 0 0.000007 -0.241328 -13.99799 0.000227 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806026 -0.359828 -1.318334 38.596152 -45.467132 69.981408 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789785 -0.000006 -0.00001 -0.000065 13.095012 -0.000111 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.206999 -0.000001 -0.000008 -0.000123 20.793213 0.000229 0 0 0 0 0 0
$definebone "v_weapon.sg552_Parent" "" -7.963447 -21.7759 -11.822129 0 -179.999623 89.997749 0 0 0 0 0 0
$definebone "v_weapon.sg552_Trigger" "v_weapon.sg552_Parent" -0.000002 3.287109 -0.573233 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.sg552_Release" "v_weapon.sg552_Parent" -0.000002 2.156256 -2.244137 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.sg552_Clip" "v_weapon.sg552_Parent" -0.000003 2.917979 -4.039055 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.sg552_Chamber" "v_weapon.sg552_Parent" -0.097351 5.335948 -3.37694 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.sg552_Clip2" "" -27.963417 -5.815069 -8.90431 0 -179.999623 89.997749 0 0 0 0 0 0

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
	{ event 5004 0 "Weapon_DEagle.Deploy" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "reload" {
	"anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	{ event 5004 32 "Weapon_SG552.Clipout" }
	{ event 5004 97 "Weapon_SG552.Clipin" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_tac" {
	"anims\reload_tac.smd"
	{ event 5004 48 "Weapon_SG552.Clipout" }
	{ event 5004 82 "Weapon_SG552.Clipin" }
	fadein 0.2
	fadeout 0
	fps 60
}

$sequence "reload_empty" {
	"anims\reload_empty.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
	{ event 5004 29 "Weapon_SG552.Clipout" }
	{ event 5004 84 "Weapon_SG552.Clipin" }
	{ event 5004 119 "Weapon_SG552.Boltpull" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_empty_tac" {
	"anims\reload_empty_tac.smd"
	{ event 5004 36 "Weapon_AK47.Clipout" }
	{ event 5004 83 "Weapon_SG552.Clipin" }
	{ event 5004 126 "Weapon_SG552.Boltpull" }
	fadein 0.2
	fadeout 0
	fps 60
}

$sequence "reload_empty_tac_boltpull" {
	"anims\reload_empty_tac_boltpull.smd"
	{ event 5004 36 "Weapon_AK47.Clipout" }
	{ event 5004 83 "Weapon_SG552.Clipin" }
	{ event 5004 119 "Weapon_SG552.Boltpull" }
	fadein 0.2
	fadeout 0
	fps 60
}

$sequence "reload_empty_tac_boltpull_rack" {
	"anims\reload_empty_tac_boltpull_rack.smd"
	{ event 5004 36 "Weapon_AK47.Clipout" }
	{ event 5004 83 "Weapon_SG552.Clipin" }
	{ event 5004 119 "Weapon_SG552.Boltpull" }
	fadein 0.2
	fadeout 0
	fps 60
}

$sequence "inspect" {
	"anims\inspect.smd"
	{ event 5004 29 "Weapon_AK47.Clipout" }
	{ event 5004 155 "Weapon_SG552.Clipin" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "fire" {
	"anims\fire.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_556 2 90" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "fire_empty" {
	"anims\fire_empty.smd"
	activity "ACT_VM_PRIMARYATTACK_EMPTY" 1
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_556 2 90" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "_reload" {
	"anims\c_reload.smd"
	{ event 5004 14 "Weapon_SG552.Clipout" }
	{ event 5004 48 "Weapon_SG552.Clipin" }
	{ event 5004 76 "Weapon_SG552.Boltpull" }
	fadein 0.2
	fadeout 0.2
	fps 37
}

$sequence "_draw" {
	"anims\c_draw.smd"
	{ event 5004 0 "Weapon_DEagle.Deploy" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 37
}

$sequence "_shoot1" {
	"anims\c_shoot1.smd"
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_556 2 90" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 35
}

$sequence "_shoot2" {
	"anims\c_shoot2.smd"
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_556 2 90" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 35
}

$sequence "_shoot3" {
	"anims\c_shoot3.smd"
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_556 2 90" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 35
}
