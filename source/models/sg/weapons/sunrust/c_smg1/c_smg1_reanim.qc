// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_smg1.mdl"
$body studio "Smg1_ref.smd"

$bodygroup "ironsight"
{
	studio "Smg1_ironsight.smd"
	blank
}

$surfaceprop "default"
$contents "solid"

$illumposition -2.095 -16.173 -16.236

$cdmaterials "models\weapons\v_smg1\"

$attachment "muzzle" "ValveBiped.base" 0.02 0.55 13.89 rotate -90 0 0
$attachment "1" "ValveBiped.base" -0.49 2.22 -1.37 rotate 0 -180 180

$definebone "ValveBiped.Bip01_Spine4" "" 0.000006 0 0 -79.749938 -89.999927 -90.000037 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Clavicle" "ValveBiped.Bip01_Spine4" 2.033348 1.000767 1.93766 -73.711859 168.619339 91.48048 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_UpperArm" "ValveBiped.Bip01_L_Clavicle" 6.028145 0.000003 0.000002 2.740114 -33.53431 -90.717104 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Forearm" "ValveBiped.Bip01_L_UpperArm" 11.692553 0.000081 -0.000005 0.000003 -3.461696 -0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Hand" "ValveBiped.Bip01_L_Forearm" 11.481672 -0.000089 -0.000024 -6.111334 2.510702 90.349947 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger4" "ValveBiped.Bip01_L_Hand" 3.859701 -0.142417 -1.191975 8.68249 -50.431576 -26.821816 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger41" "ValveBiped.Bip01_L_Finger4" 1.312563 -0.000008 0.000006 -0.000173 -25.194268 -0.000009 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger42" "ValveBiped.Bip01_L_Finger41" 0.729362 -0.000004 0.000003 -0.000174 -13.997583 0.00005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger3" "ValveBiped.Bip01_L_Hand" 3.942327 0.046755 -0.431444 4.194168 -46.466361 -8.696352 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger31" "ValveBiped.Bip01_L_Finger3" 1.539093 0.000006 -0.000007 0.000345 -14.19738 -0.00012 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger32" "ValveBiped.Bip01_L_Finger31" 1.196323 -0.000004 0.000002 -0.000402 -24.68365 0.00005 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger2" "ValveBiped.Bip01_L_Hand" 3.883688 -0.046782 0.431443 1.251055 -33.68219 4.921822 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger21" "ValveBiped.Bip01_L_Finger2" 1.719578 -0.000011 0.000009 0.31593 -20.997755 0.000116 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger22" "ValveBiped.Bip01_L_Finger21" 1.209183 -0.000004 0.000003 0.177103 -12.398462 0.000001 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger1" "ValveBiped.Bip01_L_Hand" 3.859858 -0.137962 1.332466 -2.449451 -30.465601 20.308487 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger11" "ValveBiped.Bip01_L_Finger1" 1.719431 0.000002 -0.000004 0.23371 -20.798599 -0.00022 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger12" "ValveBiped.Bip01_L_Finger11" 1.099676 -0.000006 0.000004 0.148686 -13.999193 0.000294 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger0" "ValveBiped.Bip01_L_Hand" 0.806042 -0.348928 1.321258 -38.916222 -45.196065 -70.054634 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger01" "ValveBiped.Bip01_L_Finger0" 1.789782 0.000002 -0.000006 -0.000055 13.093456 -0.000123 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_L_Finger02" "ValveBiped.Bip01_L_Finger01" 1.206999 0 -0.000002 -0.000051 20.790456 0.000108 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Clavicle" "ValveBiped.Bip01_Spine4" 2.033356 1.000772 -1.93761 73.71203 168.618779 -95.596496 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_UpperArm" "ValveBiped.Bip01_R_Clavicle" 6.028141 0 -0.000002 -0.461861 -33.624144 93.947661 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Forearm" "ValveBiped.Bip01_R_UpperArm" 11.692554 0 -0.000001 -0.000003 -3.45866 -0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Hand" "ValveBiped.Bip01_R_Forearm" 11.481705 -0.000001 -0.000008 6.10824 2.530525 -89.676607 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger4" "ValveBiped.Bip01_R_Hand" 3.859676 -0.132545 1.193109 -9.056628 -50.352513 26.713244 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger41" "ValveBiped.Bip01_R_Finger4" 1.312559 -0.000004 -0.000001 0.000061 -25.191464 0.000118 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger42" "ValveBiped.Bip01_R_Finger41" 0.729367 0 -0.000001 0.000176 -13.995983 0.000003 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger3" "ValveBiped.Bip01_R_Hand" 3.942295 0.050347 0.431044 -4.537252 -46.420995 8.598778 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger31" "ValveBiped.Bip01_R_Finger3" 1.539106 0 0.000001 -0.000172 -14.196006 0.000173 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger32" "ValveBiped.Bip01_R_Finger31" 1.196321 -0.000004 -0.000002 0.000116 -24.680953 -0.000168 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger2" "ValveBiped.Bip01_R_Hand" 3.883663 -0.050304 -0.431042 -1.512608 -33.672221 -4.921994 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger21" "ValveBiped.Bip01_R_Finger2" 1.719584 0.000002 0.000006 -0.456761 -20.995356 0.000114 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger22" "ValveBiped.Bip01_R_Finger21" 1.209183 0.000004 0.000006 -0.256054 -12.39709 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger1" "ValveBiped.Bip01_R_Hand" 3.859833 -0.148919 -1.331283 2.209956 -30.481362 -20.30694 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger11" "ValveBiped.Bip01_R_Finger1" 1.719427 0.000008 0.000011 -0.37878 -20.796712 0.000172 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger12" "ValveBiped.Bip01_R_Finger11" 1.099665 0.000002 0.000008 -0.241327 -13.99799 0.000231 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger0" "ValveBiped.Bip01_R_Hand" 0.806023 -0.359832 -1.318336 38.596152 -45.467132 69.981408 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger01" "ValveBiped.Bip01_R_Finger0" 1.78978 -0.000006 -0.000006 -0.000065 13.095012 -0.000111 0 0 0 0 0 0
$definebone "ValveBiped.Bip01_R_Finger02" "ValveBiped.Bip01_R_Finger01" 1.207001 -0.000002 -0.000006 -0.000123 20.793213 0.000229 0 0 0 0 0 0
$definebone "ValveBiped.base" "" -6.482446 -20.643698 -3.83088 0.000229 -0.000172 89.999579 0 0 0 0 0 0
$definebone "ValveBiped.trigger" "ValveBiped.base" 0.000007 -1.946088 0.068031 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.mag" "ValveBiped.base" 0.000007 -3.415848 -1.741976 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.handle" "ValveBiped.base" -0.000028 1.420049 -7.723435 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.Bip01" "" -0.000005 -9.614098 38.566917 0 0 89.999982 0 0 0 0 0 0

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
	fps 70
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
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "reload_empty" {
	"anims\reload_empty.smd"
	activity "ACT_VM_RELOAD_EMPTY" 1
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

$sequence "unjam" {
	"anims\unjam.smd"
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "ready" {
	"anims\ready.smd"
	activity "ACT_VM_READY" 1
	fadein 0.2
	fadeout 0.2
	fps 60
}

$sequence "_idle01" {
	"anims\c_idle01.smd"
	fadein 0.2
	fadeout 0.2
	node "Ready"
	fps 30
	loop
}

$sequence "_fire01" {
	"anims\c_fire01.smd"
	{ event AE_MUZZLEFLASH 0 "SMG1 MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "Fire"
	snap
	fps 30
}

$sequence "_fire02" {
	"anims\c_fire02.smd"
	{ event AE_MUZZLEFLASH 0 "SMG1 MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "Fire"
	snap
	fps 30
}

$sequence "_fire03" {
	"anims\c_fire03.smd"
	{ event AE_MUZZLEFLASH 0 "SMG1 MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "Fire"
	snap
	fps 30
}

$sequence "_fire04" {
	"anims\c_fire04.smd"
	{ event AE_MUZZLEFLASH 0 "SMG1 MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "Fire"
	snap
	fps 30
}

$sequence "_altfire" {
	"anims\c_altfire.smd"
	fadein 0.2
	fadeout 0.2
	node "Fire"
	snap
	fps 30
}

$sequence "_draw" {
	"anims\c_draw.smd"
	fadein 0.2
	fadeout 0.2
	node "Ready"
	snap
	fps 30
}

$sequence "_reload" {
	"anims\c_reload.smd"
	fadein 0.2
	fadeout 0.2
	node "Ready"
	fps 30
}
