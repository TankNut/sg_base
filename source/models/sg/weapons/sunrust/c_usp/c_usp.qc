// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_usp.mdl"
$body studio "usp_mirrored_ref.smd"

$bodygroup "silencer"
{
	blank
	studio "silencer.smd"
}

$surfaceprop "default"
$contents "solid"

$illumposition -4.567 -19.749 -8.768

$cdmaterials "models\weapons\V_models\pist_usp\"

$attachment "1" "v_weapon.USP_Parent" 0 3.67 -8.67 rotate 0 180 180
$attachment "2" "v_weapon.USP_Parent" 0 3.87 -0.93 rotate 0 160 0

$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999927 -90.000037 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033348 1.000767 1.93766 -73.711859 168.619339 91.48048 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028145 0.000003 0.000002 2.740172 -33.534306 -90.717152 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692553 0.000081 -0.000007 0.000003 -3.46181 -0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481672 -0.000089 -0.000024 -6.11139 2.510759 90.349947 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859703 -0.142414 -1.191975 8.682488 -50.431634 -26.821815 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312561 -0.000008 0.000003 -0.000173 -25.194269 0.000005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729368 -0.000004 0 -0.000171 -13.997587 0.000063 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942329 0.046756 -0.431443 4.194166 -46.466357 -8.696353 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539095 0.000004 -0.000005 0.000344 -14.197383 -0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196321 -0.000004 0.000004 -0.0004 -24.683706 0.000056 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.883694 -0.046778 0.431443 1.251054 -33.68218 4.921823 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.719578 -0.000011 0.000009 0.31593 -20.997752 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209183 -0.000002 0.000003 0.177102 -12.398462 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859859 -0.137959 1.332466 -2.449451 -30.465598 20.30849 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719433 0.000002 -0.000005 0.233707 -20.798597 -0.000229 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099672 -0.000006 0.000004 0.148681 -13.999188 0.000287 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806042 -0.348925 1.321258 -38.916215 -45.196052 -70.054634 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.789783 0 -0.000008 -0.000058 13.093468 -0.00012 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.207001 0.000001 0 -0.000057 20.790467 0.000111 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.93761 73.71203 168.618779 -95.596496 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028141 0 -0.000002 -0.46209 -33.624144 93.947661 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692554 0 0 -0.000005 -3.459061 -0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481705 -0.000001 -0.000009 6.108236 2.530754 -89.676607 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.85968 -0.13255 1.193109 -9.056627 -50.35251 26.713239 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312561 -0.000002 -0.000002 0.000059 -25.191461 0.00012 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729366 -0.000004 0.000001 0.000174 -13.995976 0.000005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942299 0.050344 0.431044 -4.537251 -46.420995 8.598779 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539101 -0.000002 0.000002 -0.00017 -14.196006 0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196323 -0.000002 -0.000002 0.000116 -24.680952 -0.000172 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883663 -0.050307 -0.431042 -1.512608 -33.672225 -4.921994 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719584 0 0.000006 -0.45676 -20.995354 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209185 0 0.000005 -0.256053 -12.39709 0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859833 -0.148923 -1.331282 2.209956 -30.481362 -20.306938 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719427 0.000008 0.000012 -0.378781 -20.79665 0.000167 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099663 0.000002 0.000008 -0.241329 -13.997983 0.000225 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806026 -0.359835 -1.318335 38.596146 -45.467186 69.981408 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789785 -0.000008 -0.000006 -0.000064 13.095012 -0.000109 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.207003 0 -0.000004 -0.000122 20.793211 0.000231 0 0 0 0 0 0
$definebone "v_weapon.USP_Parent" "" -5.597123 -19.339581 -6.532116 0.691593 -179.993694 89.791402 0 0 0 0 0 0
$definebone "v_weapon.USP_Clip" "v_weapon.USP_Parent" -0.00381 2.312519 1.197218 0.000573 0 -0.001547 0 0 0 0 0 0
$definebone "v_weapon.USP_Hammer" "v_weapon.USP_Parent" 0.00123 3.011752 2.415958 0 0 -0.001432 0 0 0 0 0 0
$definebone "v_weapon.USP_Release" "v_weapon.USP_Parent" 0.001228 2.742167 -1.331091 -0.000057 0 -0.001547 0 0 0 0 0 0
$definebone "v_weapon.USP_Slide" "v_weapon.USP_Parent" 0.001229 3.617197 0.62591 0 0 -0.001547 0 0 0 0 0 0
$definebone "v_weapon.USP_Switch" "v_weapon.USP_Parent" 0.00126 2.691445 2.738224 0.002521 0 -0.001547 0 0 0 0 0 0
$definebone "v_weapon.USP_Trigger" "v_weapon.USP_Parent" 0.001231 2.716781 -0.95805 0 0 -0.001547 0 0 0 0 0 0
$definebone "v_weapon.USP_Silencer" "v_weapon.USP_Parent" 0.00123 3.682984 -5.953835 -0.000057 0 0 0 0 0 0 0 0

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

$animation "a_adjustment_corrective_animation" "anims\a_adjustment_corrective_animation.smd" {
	fps 30
}

$animation "a_adjustment_ref" "anims\a_adjustment_ref.smd" {
	fps 30
}

$sequence "fire" {
	"anims\fire.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "fire_empty" {
	"anims\fire_empty.smd"
	activity "ACT_VM_PRIMARYATTACK_EMPTY" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "reload" {
	"anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	{ event 5004 15 "Weapon_USP.Slideback2" }
	{ event 5004 18 "Weapon_USP.Clipout" }
	{ event 5004 85 "Weapon_USP.Clipin" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_empty" {
	"anims\reload_empty.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
	{ event 5004 15 "Weapon_USP.Slideback2" }
	{ event 5004 18 "Weapon_USP.Clipout" }
	{ event 5004 80 "Weapon_USP.Clipin" }
	{ event 5004 126 "Weapon_USP.Sliderelease" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "add_silencer" {
	"anims\add_silencer.smd"
	activity "ACT_VM_ATTACH_SILENCER" 1
	{ event 5004 50 "Weapon_USP.AttachSilencer" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "detach_silencer" {
	"anims\detach_silencer.smd"
	activity "ACT_VM_DETACH_SILENCER" 1
	{ event 5004 40 "Weapon_USP.DetachSilencer" }
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "draw" {
	"anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	{ event 5004 27 "Weapon_USP.Slideback" }
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

$sequence "inspect_slinger" {
	"anims\inspect_slinger.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "fire_slinger" {
	"anims\fire_slinger.smd"
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "reload_slinger" {
	"anims\reload_slinger.smd"
	fadein 0
	fadeout 0.2
	fps 60
}

$sequence "shoot1_unsil" {
	"anims\shoot1_unsil.smd"
	activity "ACT_VM_PRIMARYATTACK_1" 1
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_9mm 2 100" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "shoot2_unsil" {
	"anims\shoot2_unsil.smd"
	activity "ACT_VM_PRIMARYATTACK_1" 1
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_9mm 2 100" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "shoot3_unsil" {
	"anims\shoot3_unsil.smd"
	activity "ACT_VM_PRIMARYATTACK_1" 1
	{ event 5001 0 "1" }
	{ event AE_CLIENT_EFFECT_ATTACH 0 "EjectBrass_9mm 2 100" }
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "_reload_unsil" {
	"anims\c_reload_unsil.smd"
	{ event 5004 0 "Weapon_USP.Slideback2" }
	{ event 5004 17 "Weapon_USP.Clipout" }
	{ event 5004 40 "Weapon_USP.Clipin" }
	{ event 5004 82 "Weapon_USP.Sliderelease" }
	fadein 0.2
	fadeout 0.2
	fps 37
}

$sequence "_draw_unsil" {
	"anims\c_draw_unsil.smd"
	{ event 5004 26 "Weapon_USP.Slideback" }
	fadein 0.2
	fadeout 0.2
	fps 48
}
