// Created by Crowbar 0.12.0.0

$modelname "weapons\c_rage_rifle.mdl"
$model "studio" "reference.smd"

$attachment "1" "Rifle" 16.00 -26.00 -8.90 rotate 13 -53 103
$attachment "2" "Rifle" 1.00 -9.00 -3.00 rotate -73 -66 -167

$proceduralbones c_arms_vrd.vrd

$cdmaterials "models\Rage\Weapons\Rifle"

$bodygroup "mag"
{
	studio "mag1.smd"
	studio "mag2.smd"
}

$bodygroup "muzzle"
{
	studio "muzzle1.smd"
	studio "muzzle2.smd"
}

$bodygroup "stabilizer"
{
	blank
	studio "stabilizer.smd"
}

$bodygroup "sight"
{
    blank
	studio "scope.smd"
}

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
	fps 60
	snap
	"ACT_VM_PRIMARYATTACK" 1
	{ event 5001 0 "1" }
	{ event 6001 1 "1" }
}

$sequence "shoot_last" "anims\shoot_last.smd" {
	fps 60
	snap
	"ACT_VM_PRIMARYATTACK_EMPTY" 1
	{ event 5001 0 "1" }
	{ event 6001 1 "1" }
    { event 5004 6 "Weapon_RAGE_Rifle.Last" }
}

$sequence "shoot1_iron" "anims\shoot1_iron.smd" {
	fps 60
	snap
	"ACT_VM_DEPLOYED_IRON_FIRE" 1
	{ event 5001 0 "1" }
	{ event 6001 0 "1" }
}

$sequence "shoot_last_iron" "anims\shoot_last_iron.smd" {
	fps 60
	snap
	"ACT_VM_DEPLOYED_IRON_DRYFIRE" 1
	{ event 5001 0 "1" }
	{ event 6001 0 "1" }
    { event 5004 6 "Weapon_RAGE_Rifle.Last" }
}

$sequence "reload" "anims\reload.smd" {
	fps 30
	"ACT_VM_RELOAD" 1
	{ event 5004 8 "Weapon_RAGE_Rifle.Magout" }
	{ event 5004 22 "Weapon_RAGE_Rifle.Magin" }
	{ event 5004 38 "Weapon_RAGE_Rifle.Slide" }
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