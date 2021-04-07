// Created by Crowbar 0.12.0.0

$modelname "weapons\w_rage_wingstick.mdl"

$bodygroup "studio"
{
	studio "reference.smd"
}

$cdmaterials "models\Rage\Weapons\WingStick"
$surfaceprop "weapon"

$sequence "idle" "reference.smd" {
	fps 30
}

$sequence "spin" "spin.smd" {
	fps 30
    loop
    snap
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