// Created by Crowbar++ 0.74

$modelname "sg/weapons/sunrust/c_pistol.mdl"
$body studio "pistol.smd"

$bodygroup "bullet"
{
	studio "bullet.smd"
	blank
}

$surfaceprop "default"
$contents "solid"

$illumposition 0 0 0

$cdmaterials "models\weapons\v_pistol\"
$cdmaterials "models\sg\shells\"

$attachment "muzzle" "ValveBiped.parent" 0 1 7.5 rotate 0 0 0
$attachment "1" "ValveBiped.parent" 0 1.5 0.4 rotate 0 0 0

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
$definebone "ValveBiped.parent" "" -5.667645 -20.282417 -2.90606 1.555752 1.26893 90.324389 0 0 0 0 0 0
$definebone "ValveBiped.square" "ValveBiped.parent" 0.03947 0.828697 2.09041 0 0 0.000115 0 0 0 0 0 0
$definebone "ValveBiped.clip" "ValveBiped.parent" 0.039472 -2.12742 -0.174368 0 0 0 0 0 0 0 0 0
$definebone "ValveBiped.hammer" "ValveBiped.parent" 0.030305 0.405413 -1.879908 0 0 -0.000057 0 0 0 0 0 0
$definebone "ValveBiped.trigger" "ValveBiped.parent" -0.02206 -0.697964 1.867962 0 0 -0.000057 0 0 0 0 0 0
$definebone "ValveBiped.clip2" "ValveBiped.parent" -9.51165 -2.501287 -20.389124 0 0 -0.000802 0 0 0 0 0 0

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

$sequence "deploy" {
	"anims\deploy.smd"
	activity "ACT_VM_DEPLOY" 1
	fadein 0.2
	fadeout 0.2
	snap
	fps 60
}

$sequence "_draw" {
	"anims\c_draw.smd"
	fadein 0.2
	fadeout 0.2
	node "0"
	snap
	fps 30
}

$sequence "_fire" {
	"anims\c_fire.smd"
	{ event AE_MUZZLEFLASH 0 "PISTOL MUZZLE" }
	{ event 6001 0 "0" }
	fadein 0.2
	fadeout 0.2
	node "2"
	snap
	fps 30
}

$sequence "_reload" {
	"anims\c_reload.smd"
	fadein 0.2
	fadeout 0.2
	node "0"
	fps 30
}
