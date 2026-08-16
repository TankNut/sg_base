// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_aug.mdl"
$body studio "aug_mirrored_ref.smd"

$surfaceprop "default"
$contents "solid"

$illumposition -5.808 -20.794 -13.245

$cdmaterials "models\weapons\V_models\rif_aug\"
$cdmaterials "models\weapons\v_models\snip_awp\"
$cdmaterials "models\sg\shells\"

$attachment "1" "v_weapon.aug_Parent" -0.27 3.65 -18 rotate 87 180 180
$attachment "2" "v_weapon.aug_Parent" 0.4 4.4 7.33 rotate 30 -165 0

$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999873 -90.000098 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033348 1.000767 1.937659 -73.711859 168.619339 91.48048 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028134 0.000014 0.000009 2.739369 -33.53431 -90.717207 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692564 0 -0.000005 0.000009 -3.459233 -0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481682 -0.000157 -0.000034 -6.111386 2.508983 90.349886 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859713 -0.142404 -1.191936 8.682319 -50.431808 -26.821588 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312567 -0.000002 0.000011 -0.000115 -25.193697 0.000162 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729366 -0.00001 0.000005 -0.000172 -13.99764 0.000164 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942327 0.046765 -0.431404 4.194225 -46.465852 -8.696067 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539097 -0.000002 0.000005 0.000288 -14.197496 0.000109 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196321 -0.000008 0.000009 -0.000344 -24.683586 0.000167 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.883688 -0.046772 0.431482 1.250768 -33.68179 4.922109 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.719585 -0.000019 0.000016 0.315988 -20.997759 0.000174 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209179 -0.000011 0.000009 0.177103 -12.398403 0.000059 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859846 -0.13795 1.332505 -2.449852 -30.465147 20.308724 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719433 -0.000006 0.000001 0.233766 -20.798773 -0.000166 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.09967 -0.000006 0.000008 0.148684 -13.999075 0.00035 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806028 -0.348923 1.321268 -38.916844 -45.196629 -70.054177 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.789785 0.000011 0.000002 -0.00011 13.093403 -0.000178 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.207005 0.000008 0.000002 -0.000165 20.790515 -0.000178 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.93761 73.71203 168.61882 -95.596496 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028141 0.000001 -0.000004 -0.462033 -33.624144 93.947661 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692552 0.000002 0.000001 0.000002 -3.459061 -0.000172 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481703 0.000003 -0.00001 6.108247 2.530755 -89.676607 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859692 -0.132568 1.193081 -9.056515 -50.352677 26.71307 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312563 -0.000006 -0.000003 0 -25.191524 0.000116 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729368 0 0 0.000172 -13.996043 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942303 0.050324 0.431015 -4.537024 -46.42121 8.598491 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539103 -0.000006 0.000001 -0.000114 -14.196113 0.000116 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196322 -0.000002 -0.000001 0.000115 -24.680901 -0.000172 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883663 -0.050332 -0.43107 -1.512208 -33.672669 -4.92228 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719582 0.000006 0.000009 -0.45682 -20.995296 0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209183 0.000002 0.000007 -0.256056 -12.397031 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859821 -0.148942 -1.331309 2.2103 -30.481864 -20.307057 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719427 0.00001 0.000014 -0.378843 -20.796642 0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099663 0.000002 0.000006 -0.241333 -13.997866 0.000169 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806015 -0.359837 -1.318339 38.596275 -45.46775 69.981237 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789783 -0.00001 -0.000006 0.000003 13.095175 -0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.207001 -0.000011 -0.000006 0.000002 20.793271 0.000232 0 0 0 0 0 0
$definebone "v_weapon.aug_Parent" "" -7.795943 -20.645304 -7.423518 -10.539845 -169.133133 87.377039 0 0 0 0 0 0
$definebone "v_weapon.aug_Trigger" "v_weapon.aug_Parent" 0.302582 2.075997 0.307262 0 -0.000114 0 0 0 0 0 0 0
$definebone "v_weapon.aug_Bolt" "v_weapon.aug_Parent" 1.216779 3.836114 -3.150469 -0.000058 -0.000056 0.000057 0 0 0 0 0 0
$definebone "v_weapon.aug_Handle" "v_weapon.aug_Parent" 1.56962 2.679692 -6.263414 -0.000001 -0.000057 0 0 0 0 0 0 0
$definebone "v_weapon.aug_Clip" "v_weapon.aug_Parent" -0.846638 1.574635 6.326852 -0.002578 0.006016 0.001146 0 0 0 0 0 0
$definebone "v_weapon.aug_Clip2" "" -27.82188 5.711969 -5.747292 -10.545575 -169.135592 87.379102 0 0 0 0 0 0

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
	{ event 5004 26 "Weapon_AUG.Boltslap" }
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
	{ event 5004 46 "Weapon_AUG.Clipout" }
	{ event 5004 128 "Weapon_M4A1.Clipin" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_empty" {
	"anims\reload_empty.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
	{ event 5004 17 "Weapon_AUG.Boltpull" }
	{ event 5004 62 "Weapon_AUG.Clipout" }
	{ event 5004 146 "Weapon_FAMAS.Clipin" }
	{ event 5004 172 "Weapon_AUG.Boltslap" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "inspect" {
	"anims\inspect.smd"
	{ event 5004 35 "Weapon_AUG.Clipout" }
	{ event 5004 113 "Weapon_AUG.Clipin" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "draw_simple" {
	"anims\draw_simple.smd"
	activity "ACT_VM_DEPLOY" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "_shoot1" {
	"anims\c_shoot1.smd"
	activity "ACT_VM_PRIMARYATTACK_1" 1
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_762Nato 2 150" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 35
}

$sequence "_shoot2" {
	"anims\c_shoot2.smd"
	activity "ACT_VM_PRIMARYATTACK_1" 2
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_762Nato 2 150" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 35
}

$sequence "_shoot3" {
	"anims\c_shoot3.smd"
	activity "ACT_VM_PRIMARYATTACK_1" 3
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_762Nato 2 150" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 35
}

$sequence "_draw" {
	"anims\c_draw.smd"
	activity "ACT_VM_PRIMARYATTACK_2" 1
	{ event 5004 9 "Weapon_AUG.Forearm" }
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "_reload" {
	"anims\c_reload.smd"
	activity "ACT_VM_PRIMARYATTACK_3" 1
	{ event 5004 10 "Weapon_AUG.Boltpull" }
	{ event 5004 50 "Weapon_AUG.Clipout" }
	{ event 5004 88 "Weapon_AUG.Clipin" }
	{ event 5004 112 "Weapon_AUG.Boltslap" }
	fadein 0.2
	fadeout 0.2
	fps 35
}
