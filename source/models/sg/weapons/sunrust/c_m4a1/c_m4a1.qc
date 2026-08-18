// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_m4a1.mdl"
$body studio "m4a1_ref_so.smd"

$bodygroup "silencer"
{
	studio "silencer.smd"
	blank
}

$bodygroup "glock"
{
	studio "glock18_mirrored_ref.smd"
	blank
}

$surfaceprop "default"
$contents "solid"

$illumposition 0.638 -4.105 -13.472

$cdmaterials "models\weapons\V_models\rif_m4a1\"
$cdmaterials "models\weapons\v_models\pist_glock18\"

$attachment "1" "gun" 0 1 15 rotate 0 0 0

$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999927 -90.000037 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033348 1.000767 1.937659 -73.711859 168.619394 91.480426 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028141 0.000005 0.000002 2.738795 -33.527886 -90.504986 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.69256 0.000013 -0.000006 -0.000002 -3.459004 -0.000401 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481678 0.000006 -0.000039 -6.108707 2.532072 90.136975 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859705 -0.142418 -1.191975 8.682489 -50.431627 -26.821816 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312563 -0.000013 0.000002 -0.000174 -25.194271 0.000005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729365 -0.000006 -0.000001 -0.000174 -13.997589 0.000061 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942327 0.046753 -0.431444 4.194166 -46.466361 -8.696352 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539093 0.000008 -0.000006 0.000343 -14.197383 -0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196323 -0.000006 0.000002 -0.000401 -24.683716 0.000056 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.883688 -0.046781 0.431443 1.251053 -33.68218 4.921822 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.71958 -0.00001 0.000009 0.31593 -20.997755 0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209183 -0.000006 0.000003 0.177102 -12.398467 -0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859854 -0.137962 1.332467 -2.449452 -30.465598 20.308488 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719431 0 -0.000006 0.233709 -20.798601 -0.000231 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099672 0 0.000004 0.148683 -13.9992 0.00029 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806046 -0.348927 1.321259 -38.916219 -45.196048 -70.054634 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.78978 0.000002 -0.000006 -0.000064 13.093461 -0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.207005 0.000001 -0.000004 -0.000066 20.790459 0.000111 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Wrist" "ValveBiped.Bip01_L_Forearm" 11.481707 0.000006 -0.000005 0 -0.000401 0.073167 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.93761 73.712085 168.61882 -95.596496 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028142 0.000001 -0.000001 -0.461919 -33.623799 93.935175 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692555 0.000031 0.000001 0.000003 -3.459404 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481703 0.000105 0.000003 6.107674 2.532588 -89.664285 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859676 -0.132545 1.193109 -9.056628 -50.35251 26.713242 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312563 0 -0.000001 0.000059 -25.191464 0.000108 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729366 0.000002 0 0.000171 -13.995986 -0.000005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942295 0.050345 0.431044 -4.537253 -46.420981 8.598779 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539101 -0.000002 0.000002 -0.000172 -14.195999 0.000171 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196321 -0.000004 -0.000002 0.000057 -24.68096 -0.000174 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883659 -0.050304 -0.431042 -1.512609 -33.672211 -4.921993 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719584 0.000006 0.000006 -0.456762 -20.995351 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209185 0.000002 0.000006 -0.256056 -12.397088 0.000116 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859833 -0.148918 -1.331282 2.209954 -30.481348 -20.30694 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719429 0.000006 0.000011 -0.378784 -20.796644 0.000178 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099661 0.000002 0.000007 -0.24133 -13.997985 0.000236 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806019 -0.359832 -1.318334 38.596149 -45.467179 69.981408 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789782 -0.000008 -0.000008 -0.000057 13.095021 -0.000118 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.207003 -0.000002 -0.000002 -0.000113 20.793217 0.000225 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Wrist" "ValveBiped.Bip01_R_Forearm" 11.481703 0.000105 0.000003 0.000003 0.000803 0.008709 0 0 0 0 0 0
$definebone "gun" "" -6.131885 -12.866409 -5.743672 0 0 89.999982 0 0 0 0 0 0
$definebone "magazine" "gun" 0 -4.325217 2.197774 0 0 0 0 0 0 0 0 0
$definebone "dustcover" "gun" 0.75974 0.264293 2.354383 0 0 -90.446547 0 0 0 0 0 0
$definebone "charging_handle" "gun" -0.023242 0.746336 -3.528393 0 0 0 0 0 0 0 0 0
$definebone "trigger" "gun" 0 -2.479087 -0.773617 0 0 0 0 0 0 0 0 0
$definebone "magazine2" "" -26.131886 4.935818 -30.06889 0 0 89.999982 0 0 0 0 0 0
$definebone "silencer" "gun" 0.246049 -5.703599 -24.367022 0 0 -90.446547 0 0 0 0 0 0
$definebone "v_weapon.Glock_Parent" "" -24.276297 3.563665 -24.51889 -16.636517 90.721277 78.545181 0 0 0 0 0 0
$definebone "v_weapon.Glock_Trigger" "v_weapon.Glock_Parent" -0.163199 2.333981 0.38208 8.77769 -110.111016 173.954837 0 0 0 0 0 0
$definebone "v_weapon.Glock_Clip" "v_weapon.Glock_Parent" 1.417 1.884756 0.307373 9.263523 -91.043683 -6.405267 0 0 0 0 0 0
$definebone "v_weapon.Glock_Slide" "v_weapon.Glock_Parent" 2.720712 2.529284 0.412601 -2.667389 163.405937 -178.194322 0 0 0 0 0 0

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
$bonemerge "ValveBiped.Bip01_L_Wrist"
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
$bonemerge "ValveBiped.Bip01_R_Wrist"

$sequence "draw_simple" {
	"anims\draw_simple.smd"
	activity "ACT_VM_DRAW_DEPLOYED" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "reload" {
	"anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_tac" {
	"anims\reload_tac.smd"
	fadein 0.2
	fadeout 0
	fps 60
}

$sequence "draw" {
	"anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "reload_empty" {
	"anims\reload_empty.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_empty_boltrel" {
	"anims\reload_empty_boltrel.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_empty_tac" {
	"anims\reload_empty_tac.smd"
	fadein 0.2
	fadeout 0
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

$sequence "mag_check" {
	"anims\mag_check.smd"
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

$sequence "fire_reverse" {
	"anims\fire_reverse.smd"
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "reload_drum" {
	"anims\reload_drum.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_drum_empty" {
	"anims\reload_drum_empty.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "sidearm_to" {
	"anims\sidearm_to.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "sidearm_to_chamber" {
	"anims\sidearm_to_chamber.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "sidearm_fire" {
	"anims\sidearm_fire.smd"
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "sidearm_from" {
	"anims\sidearm_from.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}
