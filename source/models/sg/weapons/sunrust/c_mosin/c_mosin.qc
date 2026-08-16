// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_mosin.mdl"
$body studio "mosin_ref.smd"

$bodygroup "variant"
{
	studio "body_group0_sniper.smd"
	studio "body_group1_carbine.smd"
	studio "body_group2_obrez.smd"
}


$surfaceprop "default"
$contents "solid"

$illumposition 0 0 0

$ambientboost

$cdmaterials "models\sg\weapons\"

$attachment "muzzle1" "control" 0 -32.5 1 rotate 0 -90 0
$attachment "muzzle2" "control" 0 -25 1 rotate 0 -90 0
$attachment "muzzle3" "control" 0 -13.5 1 rotate 0 -90 0
$attachment "eject" "control" 0 4 1 rotate -30 -165 0

$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999873 -90.000098 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033349 1.000767 1.93766 -73.711859 168.619271 91.480542 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028141 0 0 2.738853 -33.527944 -90.505156 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692554 0.000001 0.000002 -0.000002 -3.459061 -0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481674 0.000001 -0.000032 -6.108474 2.532073 90.136743 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859709 -0.142404 -1.191975 8.682204 -50.431569 -26.82204 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312555 -0.000002 0.000001 -0.000001 -25.194097 0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729363 -0.000002 -0.000002 0.000002 -13.997298 0.00001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942335 0.046767 -0.431443 4.194397 -46.466006 -8.696352 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539097 0 0 0 -14.197714 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196326 -0.000002 -0.000001 0 -24.683134 0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.883696 -0.046765 0.431443 1.250768 -33.682286 4.921822 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.71957 -0.000004 -0.000001 0.316047 -20.997627 0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209171 -0.000002 0 0.176703 -12.398792 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859865 -0.137947 1.332466 -2.449393 -30.465191 20.308437 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719429 0.000002 -0.000001 0.23343 -20.798874 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099665 0 0 0.148747 -13.999133 -0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806053 -0.348925 1.321258 -38.916041 -45.19599 -70.054231 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.78978 -0.000002 0.000002 -0.000009 13.093407 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.207006 0 0 -0.00001 20.79035 -0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.93761 73.712037 168.618779 -95.596496 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028144 0 0 -0.46209 -33.623802 93.935243 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692554 0.000001 0.000003 -0.000003 -3.459062 0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481697 0.000001 0.000002 6.108073 2.532072 -89.664285 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859678 -0.13257 1.193109 -9.056514 -50.352981 26.713353 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312557 -0.000002 0.000001 -0.000005 -25.191363 -0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729365 0.000002 -0.000002 -0.000003 -13.995702 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942305 0.050327 0.431044 -4.537309 -46.42134 8.598834 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539099 -0.000002 0 -0.000002 -14.19624 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196321 0.000008 0 -0.000001 -24.680788 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883661 -0.050323 -0.431042 -1.512838 -33.672464 -4.921996 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719578 0.000004 0 -0.456876 -20.995257 -0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209185 0.000002 0 -0.255596 -12.397447 -0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859838 -0.148937 -1.331282 2.209728 -30.481423 -20.306714 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719423 0.000002 0 -0.37889 -20.796659 0.000005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099667 0.000002 0 -0.241267 -13.99806 -0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806021 -0.359837 -1.318334 38.596446 -45.467538 69.98164 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789782 0 -0.000004 -0.000009 13.095232 0.000007 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.206999 0.000003 0.000002 -0.000009 20.792926 0.000003 0 0 0 0 0 0
$definebone "mosin_strip_clip" "" 0 9.5 5.149681 0 0 0 0 0 0 0 0 0
$definebone "control" "" 0 -3.5 -1 0 0 0 0 0 0 0 0 0
$definebone "mosin_trigger" "control" 0 7.169887 -1.514632 0 0 0 0 0 0 0 0 0
$definebone "mosin_bolt_base" "control" 0 6.25 0.998666 0 0 0 0 0 0 0 0 0
$definebone "mosin_bolt_handle" "mosin_bolt_base" 0 -2.75 0 0 0 0 0 0 0 0 0 0
$definebone "mosin_bolt_hammer" "mosin_bolt_base" 0 2.052265 0 0 0 0 0 0 0 0 0 0
$definebone "mosin_strip_bullets_top" "" 0 9.5 7.984681 0 0 4.999974 0 0 0 0 0 0
$definebone "mosin_strip_bullets_group" "" 0 9.5 6.425001 0 0 0 0 0 0 0 0 0
$definebone "mosin_bullet_single" "" 0 8.5 3.986 0 0 0 0 0 0 0 0 0

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

$sequence "idle" {
	"anims\idle.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.1
	fadeout 0.2
	fps 30
	loop
}

$sequence "draw" {
	"anims\draw.smd"
	activity "ACT_VM_DRAW" 1
	fadein 0.1
	fadeout 0.2
	fps 30
}

$sequence "fire_bolt0" {
	"anims\fire_bolt0.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "fire_bolt1" {
	"anims\fire_bolt1.smd"
	activity "ACT_VM_PRIMARYATTACK_1" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "bayonet_to" {
	"anims\bayonet_to.smd"
	activity "ACT_VM_DEPLOY" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "bayonet_attack" {
	"anims\bayonet_attack.smd"
	activity "ACT_VM_SECONDARYATTACK" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 30
}

$sequence "bayonet_from" {
	"anims\bayonet_from.smd"
	activity "ACT_VM_UNDEPLOY" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "reload_clip" {
	"anims\reload_clip.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
	fadein 0.2
	fadeout 0.2
	fps 35
}

$sequence "reload_start_bolt0" {
	"anims\reload_start_bolt0.smd"
	activity "ACT_SHOTGUN_RELOAD_START" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "reload_start_bolt1" {
	"anims\reload_start_bolt1.smd"
	activity "ACT_RELOAD_START" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "shell_load" {
	"anims\shell_load.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$sequence "reload_end_bolt0" {
	"anims\reload_end_bolt0.smd"
	activity "ACT_SHOTGUN_RELOAD_FINISH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}

$sequence "reload_end_bolt1" {
	"anims\reload_end_bolt1.smd"
	activity "ACT_RELOAD_FINISH" 1
	fadein 0.2
	fadeout 0.2
	fps 30
}
