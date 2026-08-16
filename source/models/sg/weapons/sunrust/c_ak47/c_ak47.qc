// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_ak47.mdl"
$body studio "ak_ref.smd"

$surfaceprop "default"
$contents "solid"

$illumposition -2.423 -23.046 -9.328

$cdmaterials "models\weapons\V_models\rif_ak47\"

$attachment "muzzle" "v_weapon.AK47_Parent" 0 3.87 -25.53 rotate 90 0 0
$attachment "eject" "v_weapon.AK47_Parent" 0 5.47 -5.33 rotate 0 165 0

$definebone "ValveBiped.Bip01_L_Clavicle" "" 1.937664 1.989522 1.822811 16.28495 -0.330482 90.302559 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028142 -0.000009 0 2.738796 -33.527944 -90.505156 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692563 0.000017 0.000007 -0.000002 -3.458889 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481678 -0.000021 -0.000026 -6.108472 2.531843 90.136634 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806049 -0.348926 1.321255 -38.916034 -45.195881 -70.054464 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.789782 0.000008 0 -0.000003 13.093636 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.207001 0 0 -0.000061 20.79 0.000174 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859859 -0.137941 1.332452 -2.44928 -30.46542 20.308374 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719431 0.000004 -0.000005 0.233367 -20.798821 -0.000116 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099663 0.000006 -0.000006 0.149314 -13.998728 -0.00006 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.883686 -0.046764 0.431428 1.250766 -33.682528 4.921707 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.719576 0.000013 -0.000007 0.316215 -20.99735 -0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209181 0.000002 -0.000001 0.1767 -12.398856 0.000057 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942318 0.046774 -0.431457 4.194738 -46.465896 -8.696526 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539097 0 0.000004 -0.000116 -14.197889 0.000061 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196321 0 0 0.000115 -24.683023 -0.000055 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859699 -0.142406 -1.191988 8.682431 -50.431511 -26.822278 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312572 -0.000002 0.000001 -0.000058 -25.194268 0.000234 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729363 0.000011 0 -0.000113 -13.997418 -0.000225 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "" -1.937606 1.98952 1.822828 16.284643 -179.669629 85.581881 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028141 0.000005 -0.000003 -0.468336 -33.618133 93.935284 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692562 0.000004 0.00001 -0.000003 -3.458889 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481714 -0.000034 0.000002 6.101941 2.526114 -89.664408 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806011 -0.359833 -1.318336 38.596436 -45.467412 70.000259 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789787 0.000002 0.000002 -0.000005 12.999839 -0.000055 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.207003 0.000006 -0.000004 -0.000006 20.793208 0.000059 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859829 -0.148937 -1.331286 2.209668 -30.481362 -20.306656 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719431 -0.000004 -0.000003 -0.378897 -20.796598 -0.000116 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099665 -0.000002 -0.000001 -0.241101 -13.998225 -0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883659 -0.050333 -0.431045 -1.512895 -33.672279 -4.921993 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719576 -0.000013 -0.000003 -0.456934 -20.99524 -0.000057 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209177 -0.000002 -0.000003 -0.255367 -12.397658 -0.000057 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942287 0.050325 0.431041 -4.537424 -46.421213 8.598779 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539104 0.000002 -0.000004 0.000286 -14.19652 -0.000113 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196321 0.000004 0.000004 -0.000114 -24.680612 0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859676 -0.132571 1.193106 -9.056286 -50.353083 26.713356 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312571 -0.000002 0.000004 -0.000229 -25.190945 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729367 0 -0.000005 0.000172 -13.995921 0.000111 0 0 0 0 0 0
$definebone "control" "" 0 -20 0 0 0 0 0 0 0 0 0 0
$definebone "v_weapon.AK47_Clip" "control" -0.000007 -2.562422 -1.34064 0 179.999964 89.999982 0 0 0 0 0 0
$definebone "v_weapon.AK47_Bolt" "control" -0.000005 -1.784786 0.363803 0 179.999964 89.999982 0 0 0 0 0 0
$definebone "v_weapon.AK47_Trigger" "control" -0.000002 1.64097 -1.348884 0 179.999964 89.999982 0 0 0 0 0 0
$definebone "v_weapon.AK47_ClipRelease" "control" -0.000004 -0.403343 -3.067159 0 179.999964 89.999982 0 0 0 0 0 0
$definebone "v_weapon.AK47_Parent" "control" 0 3.034649 -4.869442 0 179.999964 89.999982 0 0 0 0 0 0

$bonemerge "ValveBiped.Bip01_L_Clavicle"
$bonemerge "ValveBiped.Bip01_L_UpperArm"
$bonemerge "ValveBiped.Bip01_L_Forearm"
$bonemerge "ValveBiped.Bip01_L_Hand"
$bonemerge "ValveBiped.Bip01_L_Finger0"
$bonemerge "ValveBiped.Bip01_L_Finger01"
$bonemerge "ValveBiped.Bip01_L_Finger02"
$bonemerge "ValveBiped.Bip01_L_Finger1"
$bonemerge "ValveBiped.Bip01_L_Finger11"
$bonemerge "ValveBiped.Bip01_L_Finger12"
$bonemerge "ValveBiped.Bip01_L_Finger2"
$bonemerge "ValveBiped.Bip01_L_Finger21"
$bonemerge "ValveBiped.Bip01_L_Finger22"
$bonemerge "ValveBiped.Bip01_L_Finger3"
$bonemerge "ValveBiped.Bip01_L_Finger31"
$bonemerge "ValveBiped.Bip01_L_Finger32"
$bonemerge "ValveBiped.Bip01_L_Finger4"
$bonemerge "ValveBiped.Bip01_L_Finger41"
$bonemerge "ValveBiped.Bip01_L_Finger42"
$bonemerge "ValveBiped.Bip01_R_Clavicle"
$bonemerge "ValveBiped.Bip01_R_UpperArm"
$bonemerge "ValveBiped.Bip01_R_Forearm"
$bonemerge "ValveBiped.Bip01_R_Hand"
$bonemerge "ValveBiped.Bip01_R_Finger0"
$bonemerge "ValveBiped.Bip01_R_Finger01"
$bonemerge "ValveBiped.Bip01_R_Finger02"
$bonemerge "ValveBiped.Bip01_R_Finger1"
$bonemerge "ValveBiped.Bip01_R_Finger11"
$bonemerge "ValveBiped.Bip01_R_Finger12"
$bonemerge "ValveBiped.Bip01_R_Finger2"
$bonemerge "ValveBiped.Bip01_R_Finger21"
$bonemerge "ValveBiped.Bip01_R_Finger22"
$bonemerge "ValveBiped.Bip01_R_Finger3"
$bonemerge "ValveBiped.Bip01_R_Finger31"
$bonemerge "ValveBiped.Bip01_R_Finger32"
$bonemerge "ValveBiped.Bip01_R_Finger4"
$bonemerge "ValveBiped.Bip01_R_Finger41"
$bonemerge "ValveBiped.Bip01_R_Finger42"

$sequence "ak47_idle" {
	"anims\ak47_idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 15
	loop
}

$sequence "ak47_inspect" {
	"anims\ak47_inspect.smd"
	fadein 0.3
	fadeout 0.3
	fps 30
}

$sequence "ak47_fire1" {
	"anims\ak47_fire1.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_762Nato 2 150" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "ak47_fire2" {
	"anims\ak47_fire2.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_762Nato 2 150" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "ak47_fire3" {
	"anims\ak47_fire3.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_762Nato 2 150" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "ak47_draw" {
	"anims\ak47_draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "ak47_reload_empty" {
	"anims\ak47_reload_empty.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
	{ event 5004 16 "Weapon_AK47.Clipout" }
	{ event 5004 47 "Weapon_AK47.Clipin" }
	{ event 5004 65 "Weapon_AK47.BoltPull" }
	fadein 0.2
	fadeout 0.2
	fps 37
}

$sequence "ak47_reload" {
	"anims\ak47_reload.smd"
	activity "ACT_VM_RELOAD" 1
	{ event 5004 21 "Weapon_AK47.Clipout" }
	{ event 5004 55 "Weapon_AK47.Clipin" }
	fadein 0.2
	fadeout 0.2
	fps 37
}

$sequence "ak47_reload_empty1" {
	"anims\ak47_reload_empty1.smd"
	{ event 5004 16 "Weapon_AK47.Clipout" }
	{ event 5004 47 "Weapon_AK47.Clipin" }
	{ event 5004 65 "Weapon_AK47.BoltPull" }
	fadein 0.2
	fadeout 0.2
	fps 37
}

$sequence "ak47_reload_empty2" {
	"anims\ak47_reload_empty2.smd"
	{ event 5004 16 "Weapon_AK47.Clipout" }
	{ event 5004 47 "Weapon_AK47.Clipin" }
	{ event 5004 65 "Weapon_AK47.BoltPull" }
	fadein 0.2
	fadeout 0.2
	fps 37
}
