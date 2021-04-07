// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_sniper.mdl"
$model "studio" "reference.smd"

$attachment "muzzle" "ValveBiped.Weapon_bone" 31.15 0.60 -5.50 rotate 9 0 177
$attachment "1" "ValveBiped.Weapon_bone" -1.00 1.10 -3.00 rotate 2 90 -81

$cdmaterials "models\Rage\Weapons\Sniper"

$bodygroup "mag"
{
	studio "mag.smd"
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
    replacemodel "mag.smd" "lods/lod1_mag.smd"
}

$lod 25
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag.smd" "lods/lod2_mag.smd"
}

$lod 50
{
    replacemodel "reference.smd" "lods/lod3_reference.smd"
    replacemodel "mag.smd" "lods/lod3_mag.smd"
}

$shadowlod
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag.smd" "lods/lod2_mag.smd"
}