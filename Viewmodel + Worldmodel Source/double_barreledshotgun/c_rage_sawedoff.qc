// Created by Crowbar 0.12.0.0

$modelname "weapons\c_rage_sawedoff.mdl"
$model "studio" "reference.smd"

$proceduralbones c_arms_vrd.vrd

$cdmaterials "models\Rage\Weapons\Shotgun"
$cdmaterials "models\Rage\Weapons\SawedOff"
$cdmaterials "models\Rage\Weapons\Pistol"

$attachment "1" "Breach" 3.70 -7.20 -2.30 rotate 13 -53 103
$attachment "2" "SawedOff" 0.00 3.00 0.00 rotate 20 110 120

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
}

$sequence "aim_in" "anims\aim_in.smd" {
	fps 30
	"ACT_VM_IDLE_TO_LOWERED" 1
	snap
	{ event 5004 1 "Weapon_RAGE_Generic.Monocolein" }
}

$sequence "aim_out" "anims\aim_out.smd" {
	fps 30
	"ACT_VM_LOWERED_TO_IDLE" 1
	snap
	{ event 5004 1 "Weapon_RAGE_Generic.Monocoleout" }
}

$sequence "reload" "anims\reload.smd" {
	fps 30
	"ACT_VM_RELOAD" 1
	{ event 5004 6 "Weapon_RAGE_SawedOff.Open" }
	{ event 6001 10 "2" }
	{ event 6001 10 "2" }
	{ event 5004 20 "Weapon_RAGE_SawedOff.Load" }
	{ event 5004 37 "Weapon_RAGE_SawedOff.Close" }
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