// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_machinegun.mdl"
$model "studio" "reference.smd"

$attachment "muzzle" "ValveBiped.Weapon_bone" 19.15 0.40 -3.30 rotate 0 0 180
$attachment "1" "ValveBiped.Weapon_bone" 12.00 -1.60 -3.00 rotate 2 -90 -81

$cdmaterials "models\Rage\Weapons\MachineGun"

$bodygroup "mag"
{
	studio "mag1.smd"
	studio "mag2.smd"
	blank
}

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
    replacemodel "mag1.smd" "lods/lod1_mag1.smd"
    replacemodel "mag2.smd" "lods/lod1_mag2.smd"
}

$lod 25
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag1.smd" "lods/lod2_mag1.smd"
    replacemodel "mag2.smd" "lods/lod_2mag2.smd"
}

$lod 50
{
    replacemodel "reference.smd" "lods/lod3_reference.smd"
    replacemodel "mag1.smd" "lods/lod3_mag1.smd"
    replacemodel "mag2.smd" "lods/lod3_mag2.smd"
}

$shadowlod
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag1.smd" "lods/lod2_mag1.smd"
    replacemodel "mag2.smd" "lods/lod2_mag2.smd"
}