// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_annabelle.mdl"
$body body "x_annabelle_annabelle.smd"
$body shell "x_annabelle_rifleshell.smd"
$body eject "shell_338mag_338mag_reference.smd"

$surfaceprop "default"
$contents "solid"

$illumposition -6.122 -19.28 -8.06

$cdmaterials "models\sg\shells\"
$cdmaterials "models\sg\weapons\"

$attachment "0" "attachment_muzzleflash" 0 0 0 rotate 0 0 0
$attachment "1" "ejaculator" 0 0 0 rotate 0 0 0

$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999873 -90.000098 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033348 1.000767 1.937659 -73.711859 168.619339 91.48048 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.02814 0.000007 0.000003 2.738797 -33.534251 -90.717152 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692572 0 -0.000019 0.000063 -3.458258 -0.000058 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481682 -0.000163 -0.000038 -6.111276 2.508582 90.349831 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859703 -0.142405 -1.191976 8.682548 -50.431228 -26.821873 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312561 -0.00001 0.000002 -0.00012 -25.194386 0.000051 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729367 -0.000004 0 -0.000179 -13.997586 0.000108 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942326 0.046766 -0.431443 4.194168 -46.466019 -8.696351 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539099 -0.000002 -0.000007 0.000346 -14.197379 -0.000062 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196324 -0.000004 0.000003 -0.000402 -24.683645 0.000053 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.88369 -0.046767 0.431443 1.251055 -33.681838 4.921822 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.719576 -0.000013 0.000009 0.315931 -20.997759 0.000059 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209185 -0.00001 0.000003 0.177104 -12.398466 0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859859 -0.137949 1.332466 -2.449566 -30.465079 20.30849 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719433 -0.000006 -0.000003 0.233714 -20.798711 -0.00022 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099669 -0.000008 0.000002 0.148689 -13.999192 0.000236 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806044 -0.348926 1.321258 -38.916164 -45.195826 -70.054573 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.789782 0.000002 -0.000008 -0.000059 13.093513 -0.00012 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.207005 0 0 -0.000057 20.790341 0.000051 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.93761 73.71203 168.61882 -95.596496 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028139 0 -0.000002 -0.460543 -33.624027 93.947544 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692549 0 0.000003 0 -3.455566 -0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481695 -0.00008 0.000006 6.108188 2.528749 -89.676545 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859676 -0.132517 1.193109 -9.056512 -50.352346 26.713242 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312561 0.000002 -0.000001 0.00011 -25.191522 0.000229 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729367 0.000004 0.000001 0.000166 -13.995983 0.000055 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942295 0.050373 0.431044 -4.537194 -46.420937 8.598835 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539099 0.000011 0 -0.000173 -14.196006 0.00017 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196325 0.000004 -0.000003 0.000055 -24.680964 -0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883663 -0.05028 -0.431043 -1.512608 -33.671477 -4.921938 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.71958 -0.000008 0.000006 -0.456818 -20.995301 0.000057 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209188 -0.000013 0.000006 -0.256053 -12.397779 0.000056 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859833 -0.148894 -1.331282 2.21007 -30.480621 -20.306771 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719427 -0.000006 0.00001 -0.378836 -20.79746 0.000002 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099665 0.000011 0.000004 -0.241325 -13.997933 0.000171 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806026 -0.359824 -1.318335 38.596269 -45.46679 69.98164 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.789783 -0.000004 -0.000002 -0.000005 13.095119 -0.000172 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.207001 -0.000002 -0.000006 -0.000062 20.793153 0.000056 0 0 0 0 0 0
$definebone "root" "" -7.715595 -14.254342 -6.59865 -2.7692 -176.989736 90.395074 0 0 0 0 0 0
$definebone "slide" "root" -0.000001 1.365388 -0.536964 0.000057 0 -90.000098 0 0 0 0 0 0
$definebone "lever" "root" -0.000001 -0.513253 -0.829849 0 -179.999909 64.246037 0 0 0 0 0 0
$definebone "trigger" "root" 0 -0.854954 0.683403 0 -179.999909 8.88073 0 0 0 0 0 0
$definebone "slot" "root" -0.456437 0.63419 -1.470296 0.000057 0 -90.000037 0 0 0 0 0 0
$definebone "attachment_muzzleflash" "root" 0.000008 1.368782 -31.679443 0 0 -90.000037 0 0 0 0 0 0
$definebone "ejaculator" "root" -0.000002 1.728255 -2.285901 0 -33.399833 -90.000037 0 0 0 0 0 0
$definebone "hammer" "root" -0.10238 0.431843 0.420865 0.000057 0 -90.000037 0 0 0 0 0 0
$definebone "root.002" "root" 0 0.30683 -0.617118 0 0 -89.999982 0 0 0 0 0 0

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

$sequence "fire" {
	"anims\fire.smd"
	activity "ACT_VM_PRIMARYATTACK" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "fire_irons" {
	"anims\fire_irons.smd"
	fadein 0.2
	fadeout 0.2
	snap
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

$sequence "inspect" {
	"anims\inspect.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "inspect_birdshot" {
	"anims\inspect_birdshot.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "inspect_clarinet" {
	"anims\inspect_clarinet.smd"
	fadein 0.2
	fadeout 0.2
	fps 50
}

$sequence "reload_start" {
	"anims\reload_start.smd"
	activity "ACT_SHOTGUN_RELOAD_START" 1
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload" {
	"anims\reload.smd"
	activity "ACT_VM_RELOAD" 1
	fadein 0.2
	fadeout 0.2
	fps 60
	loop
}

$sequence "reload_start_empty" {
	"anims\reload_start_empty.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_end" {
	"anims\reload_end.smd"
	activity "ACT_SHOTGUN_RELOAD_FINISH" 1
	fadein 0.5
	fadeout 0.2
	fps 60
}

$sequence "reload_end_empty" {
	"anims\reload_end_empty.smd"
	fadein 0.5
	fadeout 0.2
	fps 60
}

$sequence "draw_birdshot" {
	"anims\draw_birdshot.smd"
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "fire_birdshot" {
	"anims\fire_birdshot.smd"
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "fire_clarinet" {
	"anims\fire_clarinet.smd"
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "reload_start_birdshot" {
	"anims\reload_start_birdshot.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_birdshot" {
	"anims\reload_birdshot.smd"
	fadein 0.2
	fadeout 0.1
	fps 60
	loop
}

$sequence "reload_end_birdshot" {
	"anims\reload_end_birdshot.smd"
	fadein 0.5
	fadeout 0.2
	fps 60
}
