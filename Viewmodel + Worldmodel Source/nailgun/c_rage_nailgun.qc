// Created by Crowbar 0.12.0.0

$modelname "weapons\c_rage_nailgun.mdl"
$model "studio" "Reference.smd"

$bodygroup "Mod"
{
	studio "NailGun.smd"
	studio "RebarGun.smd"
	studio "RailGun.smd"
    blank
}

$proceduralbones c_arms_vrd.vrd

$cdmaterials "models\Rage\Weapons\NailGun"

$attachment "1" "Mod" -0.60 -5.00 -1.75 rotate 13 -53 103

$sequence "idle" "anims\idle.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
	snap
}

$sequence "idle_empty" "anims\idle_empty.smd" {
	fps 30
	"ACT_VM_IDLE_EMPTY" 1
	loop
	snap
}

$sequence "draw" "anims\draw.smd" {
	fps 30
	"ACT_VM_DRAW" 1
	snap
	{ event 5004 0 "Weapon_RAGE_Generic.Draw" }
}

$sequence "draw_empty" "anims\draw_empty.smd" {
	fps 30
	"ACT_VM_DRAW_EMPTY" 1
	snap
	{ event 5004 0 "Weapon_RAGE_Generic.Draw" }
}

$sequence "shoot_nailgun" "anims\shoot_nailgun.smd" {
	fps 30
	"ACT_VM_PRIMARYATTACK_1" 1
	snap
    { event 5001 1 "1" }
}

$sequence "shoot_nailgun_iron" "anims\shoot_nailgun_iron.smd" {
	fps 30
	snap
	"ACT_VM_PRIMARYATTACK_DEPLOYED_1" 1
    { event 5001 1 "1" }
}

$sequence "shoot_rebargun" "anims\shoot_rebargun.smd" {
	fps 30
	"ACT_VM_PRIMARYATTACK_2" 1
	snap
}

$sequence "shoot_rebargun_iron" "anims\shoot_rebargun_iron.smd" {
	fps 30
	"ACT_VM_PRIMARYATTACK_DEPLOYED_2" 1
	snap
}

$sequence "shoot_railgun" "anims\shoot_railgun.smd" {
	fps 30
	"ACT_VM_PRIMARYATTACK_3" 1
	snap
    { event 5001 1 "1" }
	{ event 5004 0 "Weapon_RAGE_NailGun.Coil" }
}

$sequence "aim_in" "anims\aim_in.smd" {
	fps 30
	"ACT_VM_IDLE_TO_LOWERED" 1
	snap
	{ event 5004 0 "Weapon_RAGE_Generic.IronIn" }
}

$sequence "aim_out" "anims\aim_out.smd" {
	fps 30
	"ACT_VM_LOWERED_TO_IDLE" 1
	snap
	{ event 5004 0 "Weapon_RAGE_Generic.IronOut" }
}

$sequence "reload_nailgun" "anims\reload_nailgun.smd" {
	fps 30
    snap
	"ACT_VM_RELOAD" 1
    { event 5004 0 "Weapon_RAGE_Sniper.Move3" }
	{ event 5004 8 "Weapon_RAGE_NailGun.Magout" }
	{ event 5004 44 "Weapon_RAGE_NailGun.Magin" }
}

$sequence "reload_rebargun" "anims\reload_rebargun.smd" {
	fps 30
    snap
	"ACT_VM_RELOAD_EMPTY" 1
    { event 5004 0 "Weapon_RAGE_Sniper.Move3" }
	{ event 5004 20 "Weapon_RAGE_NailGun.Reload" }
	{ event 5004 52 "Weapon_RAGE_NailGun.Load" }
}

$sequence "changemod" "anims\changemod.smd" {
	fps 46
    snap
	"ACT_VM_RELOAD_INSERT" 1
	{ event 5004 19 "Weapon_RAGE_NailGun.ModOut" }
    { event 5004 69 "Weapon_RAGE_Sniper.Move1" }
    { event 5004 70 "Weapon_RAGE_NailGun.Move" }
    { event 5004 115 "Weapon_RAGE_NailGun.ModIn" }
}

$sequence "changemod_empty" "anims\changemod_empty.smd" {
	fps 46
    snap
	"ACT_VM_RELOAD_INSERT_EMPTY" 1
	{ event 5004 19 "Weapon_RAGE_NailGun.ModOut" }
    { event 5004 69 "Weapon_RAGE_Sniper.Move1" }
    { event 5004 70 "Weapon_RAGE_NailGun.Move" }
    { event 5004 115 "Weapon_RAGE_NailGun.ModIn" }
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