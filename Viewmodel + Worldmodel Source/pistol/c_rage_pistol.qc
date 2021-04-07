// Created by Crowbar 0.12.0.0

$modelname "weapons\c_rage_pistol.mdl"
$model "studio" "reference.smd"

$proceduralbones c_arms_vrd.vrd

$cdmaterials "models\Rage\Weapons\Pistol"

$bodygroup "mag"
{
	studio "TwelveRound.smd"
	studio "SixRound.smd"
	studio "Killburst.smd"
}

$attachment "1" "Snap" 0.00 2.00 3.90 rotate -90 -90 0

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

$sequence "shoot1_last" "anims\shoot1.smd" {
	fps 30
	snap
	"ACT_VM_PRIMARYATTACK_EMPTY" 1
	{ event 5001 0 "1" }
    { event 5004 10 "Weapon_RAGE_Pistol.Click" }
}

$sequence "shoot1_iron" "anims\shoot1_iron.smd" {
	fps 30
	snap
	"ACT_VM_DEPLOYED_IRON_FIRE" 1
	{ event 5001 0 "1" }
}

$sequence "shoot1_last_iron" "anims\shoot1_iron.smd" {
	fps 30
	snap
	"ACT_VM_DEPLOYED_IRON_DRYFIRE" 1
	{ event 5001 0 "1" }
	{ event 5004 10 "Weapon_RAGE_Pistol.Click" }
}

$sequence "shoot1_killburst" "anims\shoot1_killburst.smd" {
	fps 30
	snap
	"ACT_VM_HITKILL" 1
	{ event 5001 0 "1" }
	{ event 5004 10 "Weapon_RAGE_Pistol.Click" }
	{ event 5004 13 "Weapon_RAGE_Pistol.Click" }
	{ event 5004 16 "Weapon_RAGE_Pistol.Click" }
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
    snap
	"ACT_VM_RELOAD" 1
	{ event 5004 2 "Weapon_RAGE_Pistol.Open" }
	{ event 5004 12 "Weapon_RAGE_Pistol.Dump" }
	{ event 5004 36 "Weapon_RAGE_Pistol.Insert" }
	{ event 5004 54 "Weapon_RAGE_Pistol.Close" }
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