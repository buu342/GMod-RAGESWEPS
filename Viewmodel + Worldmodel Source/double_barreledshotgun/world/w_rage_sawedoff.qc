// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_sawedoff.mdl"
$model "studio" "reference.smd"

$attachment "muzzle" "ValveBiped.Weapon_bone" 11.50 0.20 -2.50 rotate 9 0 178
$attachment "1" "ValveBiped.Weapon_bone" 1.50 0.10 -2.40 rotate -0 180 -87

$cdmaterials "models\Rage\Weapons\Shotgun"
$cdmaterials "models\Rage\Weapons\SawedOff"

$surfaceprop "weapon"

$contents "solid"


$Sequence "idle" {
	"reference.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "attack1" {
	"reference.smd"
	activity "ACT_RANGE_ATTACK_SMG1" 1
	{ event AE_NPC_MUZZLEFLASH 0 "SMG1 MUZZLE" }
	{ event 3002 0 "" }
	fps 30
}

$Sequence "attackoffcenter" {
	"reference.smd"
	{ event AE_NPC_MUZZLEFLASH 0 "SMG1 MUZZLE" }
	{ event 3002 0 "lefthand" }
	fps 30
}

$sequence "reload" "anims\reload.smd" {
	fps 30
	"ACT_VM_RELOAD" 1
    snap
	{ event 5004 6 "Weapon_RAGE_SawedOff.Open" }
	{ event 6001 10 "2" }
	{ event 6001 10 "2" }
	{ event 5004 20 "Weapon_RAGE_SawedOff.Load" }
	{ event 5004 37 "Weapon_RAGE_SawedOff.Close" }
}

$collisionmodel "reference.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "reference.smd" "lods/lod1_reference.smd"
}

$lod 25
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
}

$lod 50
{
    replacemodel "reference.smd" "lods/lod3_reference.smd"
}

$shadowlod
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
}