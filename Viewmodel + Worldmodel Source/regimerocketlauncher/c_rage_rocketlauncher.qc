// Created by Crowbar 0.12.0.0

$modelname "weapons\c_rage_rocketlauncher.mdl"
$model "reference" "reference.smd"

$bodygroup "Rocket1"
{
	studio "Rocket1.smd"
	studio "Viper1.smd"
    blank
}

$bodygroup "Rocket2"
{
	studio "Rocket2.smd"
	studio "Viper2.smd"
    blank
}

$bodygroup "Rocket3"
{
	studio "Rocket3.smd"
	studio "Viper3.smd"
    blank
}

$bodygroup "Rocket4"
{
	studio "Rocket4.smd"
	studio "Viper4.smd"
    blank
}

$bodygroup "Mag"
{
	studio "Mag.smd"
	studio "Drum.smd"
    blank
}


$attachment "1" "RocketLauncher" 8.00 -21.00 -4.90 rotate 13 -53 103

$proceduralbones c_arms_vrd.vrd

$cdmaterials "models\Rage\Weapons\RocketLauncher"


$surfaceprop "default"
$contents "solid"
$illumposition 3.995 -9.538 -6.393

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

$sequence "shoot1" "anims\shoot1.smd" {
	fps 30
	"ACT_VM_PRIMARYATTACK" 1
	snap
    { event 5004 21 "Weapon_RAGE_RocketLauncher.Load" }
}

$sequence "shoot1_iron" "anims\shoot1_iron.smd" {
	fps 30
	"ACT_VM_DEPLOYED_IRON_FIRE" 1
	snap
    { event 5004 21 "Weapon_RAGE_RocketLauncher.Load" }
}

$sequence "aim_in" "anims\aim_in.smd" {
	fps 30
	"ACT_VM_IDLE_TO_LOWERED" 1
	snap
	{ event 5004 0 "Weapon_RAGE_RocketLauncher.Aimin" }
}

$sequence "aim_out" "anims\aim_out.smd" {
	fps 30
	"ACT_VM_LOWERED_TO_IDLE" 1
	snap
	{ event 5004 0 "Weapon_RAGE_RocketLauncher.Aimout" }
}

$sequence "reload" "anims\reload.smd" {
	fps 30
	"ACT_VM_RELOAD" 1
	snap
	{ event 5004 11 "Weapon_RAGE_RocketLauncher.Magout" }
	{ event 5004 35 "Weapon_RAGE_RocketLauncher.Magin" }
	{ event 5004 53 "Weapon_RAGE_RocketLauncher.Magslap" }
}

$sequence "reload_empty" "anims\reload_empty.smd" {
	fps 30
	"ACT_VM_RELOAD_EMPTY" 1
	snap
	{ event 5004 11 "Weapon_RAGE_RocketLauncher.Magout" }
	{ event 5004 35 "Weapon_RAGE_RocketLauncher.Magin" }
	{ event 5004 53 "Weapon_RAGE_RocketLauncher.Magslap" }
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