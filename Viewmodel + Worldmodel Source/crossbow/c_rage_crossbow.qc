// Created by Crowbar 0.12.0.0

$modelname "weapons\c_rage_crossbow.mdl"
$model "studio" "reference.smd"

$attachment "1" "Crossbow" 16.00 -22.00 -6.90 rotate 13 -53 103
$attachment "Arrow" "Arrow" 0.00 0.00 0.00 rotate 15 -50 100


$proceduralbones c_arms_vrd.vrd

$cdmaterials "models\Rage\Weapons\Crossbow"

$illumposition 3.995 -9.538 -6.393

$bodygroup "arrow"
{
	studio "arrow.smd"
	studio "arrow_electric.smd"
	studio "arrow_explosive.smd"
	studio "arrow_syringe.smd"
	blank
}

$sequence "idle" "anims\idle.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
	snap
}

$sequence "draw" "anims\draw.smd" {
	fps 30
	"ACT_VM_DRAW" 1
	snap
	{ event 5004 0 "Weapon_RAGE_Generic.Draw" }
}

$sequence "shoot" "anims\shoot.smd" {
	fps 30
	"ACT_VM_PRIMARYATTACK" 1
	snap
    { event 5004 1 "Weapon_RAGE_Crossbow.Stringstress" }
    { event 5004 18 "Weapon_RAGE_Crossbow.Reload" }
}

$sequence "idle_empty" "anims\idle_empty.smd" {
	fps 30
	"ACT_VM_IDLE_EMPTY" 1
	loop
	snap
}

$sequence "draw_empty" "anims\draw_empty.smd" {
	fps 30
	"ACT_VM_DRAW_EMPTY" 1
	snap
	{ event 5004 0 "Weapon_RAGE_Generic.Draw" }
}

$sequence "shoot_empty" "anims\shoot_empty.smd" {
	fps 30
	"ACT_VM_PRIMARYATTACK_EMPTY" 1
	snap
    { event 5004 1 "Weapon_RAGE_Crossbow.Stringstress" }
    { event 5004 18 "Weapon_RAGE_Crossbow.Reload" }
}

$sequence "reload" "anims\reload.smd" {
	fps 30
	"ACT_VM_RELOAD" 1
	snap
    { event 5004 24 "Weapon_RAGE_Crossbow.Magout" }
    { event 5004 48 "Weapon_RAGE_Crossbow.Magin" }
    { event 5004 60 "Weapon_RAGE_Crossbow.Magslap" }
}

$sequence "reload_empty" "anims\reload_empty.smd" {
	fps 30
	"ACT_VM_RELOAD_EMPTY" 1
	snap
    { event 5004 24 "Weapon_RAGE_Crossbow.Magout" }
    { event 5004 48 "Weapon_RAGE_Crossbow.Magin" }
    { event 5004 60 "Weapon_RAGE_Crossbow.Magslap" }
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