// Created by Crowbar 0.12.0.0

$modelname "weapons\c_rage_machinegun.mdl"
$model "studio" "reference.smd"

$bodygroup "mag"
{
	studio "mag1.smd"
	studio "mag2.smd"
}

$proceduralbones c_arms_vrd.vrd

$cdmaterials "models\Rage\Weapons\MachineGun"

$attachment "1" "Snap" 0.00 1.50 9.50 rotate -90 -90 0
$attachment "2" "Snap" 1.70 1.50 2.70 rotate -0 -30 0

$illumposition 3.995 -9.538 -6.393

$sequence "idle" "anims\idle.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
	snap
	node "Ready"
}

$sequence "draw" "anims\draw.smd" {
	fps 30
	"ACT_VM_DRAW" 1
	snap
	node "Ready"
	{ event 5004 0 "Weapon_RAGE_Generic.Draw" }
}

$sequence "shoot1" "anims\shoot1.smd" {
	fps 30
	snap
	"ACT_VM_PRIMARYATTACK" 1
	{ event 5001 0 "1" }
	{ event 6001 0 "1" }
}


$sequence "reload" "anims\reload.smd" {
	fps 30
    snap
	"ACT_VM_RELOAD" 1
	{ event 5004 8 "Weapon_RAGE_MachineGun.Open" }
	{ event 5004 20 "Weapon_RAGE_MachineGun.Dump" }
	{ event 5004 44 "Weapon_RAGE_MachineGun.Insert" }
	{ event 5004 59 "Weapon_RAGE_MachineGun.Close" }
}

$bonemerge "ValveBiped.Bip01_Spine4"
$bonemerge "ValveBiped.Bip01_L_Clavicle"
$bonemerge "ValveBiped.Bip01_L_UpperArm"
$bonemerge "ValveBiped.Bip01_L_Forearm"
$bonemerge "ValveBiped.Bip01_L_Hand"
$bonemerge "ValveBiped.Bip01_L_Wrist"
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
$bonemerge "ValveBiped.Bip01_R_Wrist"
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