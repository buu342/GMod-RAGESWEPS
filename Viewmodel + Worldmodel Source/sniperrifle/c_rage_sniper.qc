// Created by Crowbar 0.12.0.0

$modelname "weapons\c_rage_sniper.mdl"
$model "studio" "reference.smd"

$proceduralbones c_arms_vrd.vrd

$cdmaterials "models\Rage\Weapons\Sniper"

$attachment "1" "Rifle" 18.50 -27.00 -8.90 rotate 13 -53 103
$attachment "2" "Rifle" -2.00 -4.00 0.00 rotate 80 0 -130

$illumposition 3.995 -9.538 -6.393

$sequence "idle" "anims\idle.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
	snap
}

$sequence "idle_upgrade_empty" "anims\idle_upgrade_empty.smd" {
	fps 30
	"ACT_VM_IDLE_DEPLOYED_EMPTY" 1
	loop
	snap
}

$sequence "draw" "anims\draw.smd" {
	fps 30
	"ACT_VM_DRAW" 1
	snap
	{ event 5004 0 "Weapon_RAGE_Generic.Draw" }
}

$sequence "draw_upgrade_empty" "anims\draw_upgrade_empty.smd" {
	fps 30
	"ACT_VM_DRAW_DEPLOYED" 1
	snap
	{ event 5004 0 "Weapon_RAGE_Generic.Draw" }
}

$sequence "shoot1" "anims\shoot1.smd" {
	fps 30
	snap
	"ACT_VM_PRIMARYATTACK" 1
	{ event 5001 0 "1" }
    { event 5004 20 "Weapon_RAGE_Sniper.Move1" }
    { event 5004 32 "Weapon_RAGE_Sniper.Bolt" }
	{ event 6001 39 "1" }
    { event 5004 56 "Weapon_RAGE_Sniper.Move2" }
}

$sequence "shoot1_last" "anims\shoot1_last.smd" {
	fps 30
	snap
	"ACT_VM_PRIMARYATTACK_EMPTY" 1
	{ event 5001 0 "1" }
}

$sequence "shoot1_upgrade" "anims\shoot1_upgrade.smd" {
	fps 30
	snap
	"ACT_VM_PRIMARYATTACK_DEPLOYED" 1
	{ event 5001 0 "1" }
	{ event 6001 5 "1" }
}

$sequence "shoot1_upgrade_last" "anims\shoot1_upgrade_last.smd" {
	fps 30
	snap
	"ACT_VM_PRIMARYATTACK_DEPLOYED_EMPTY" 1
	{ event 5001 0 "1" }
	{ event 6001 5 "1" }
}

$sequence "reload" "anims\reload.smd" {
	fps 30
    snap
	"ACT_VM_RELOAD" 1
	{ event 5004 30 "Weapon_RAGE_Sniper.Magout" }
	{ event 5004 57 "Weapon_RAGE_Sniper.Magin" }
	{ event 5004 82 "Weapon_RAGE_Sniper.Move3" }
}

$sequence "reload_last" "anims\reload_last.smd" {
	fps 30
    snap
	"ACT_VM_RELOAD_EMPTY" 1
    { event 5004 4 "Weapon_RAGE_Sniper.Move1" }
    { event 5004 20 "Weapon_RAGE_Sniper.Bolt" }
	{ event 6001 25 "1" }
	{ event 5004 50 "Weapon_RAGE_Sniper.Magout" }
	{ event 5004 74 "Weapon_RAGE_Sniper.Magin" }
	{ event 5004 105 "Weapon_RAGE_Sniper.Move3" }
}

$sequence "reload_upgrade_last" "anims\reload_upgrade_last.smd" {
	fps 30
    snap
	"ACT_VM_DEPLOYED_RELOAD_EMPTY" 1
	{ event 5004 27 "Weapon_RAGE_Sniper.Magout" }
	{ event 5004 53 "Weapon_RAGE_Sniper.Magin" }
	{ event 5004 87 "Weapon_RAGE_Sniper.Move3" }
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