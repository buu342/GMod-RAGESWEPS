// Created by Crowbar 0.12.0.0

$modelname "weapons\w_rage_wingstick_gib3.mdl"

$bodygroup "studio"
{
	studio "reference_gib3.smd"
}

$cdmaterials "models\Rage\Weapons\WingStick"
$surfaceprop "weapon"

$sequence "idle" "reference.smd" {
	fps 30
}

$collisionmodel "reference_gib3.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "reference_gib3.smd" "lods/lod1_reference_gib3.smd"
}

$lod 25
{
    replacemodel "reference_gib3.smd" "lods/lod2_reference_gib3.smd"
}

$lod 50
{
    replacemodel "reference_gib3.smd" "lods/lod3_reference_gib3.smd"
}

$shadowlod
{
    replacemodel "reference_gib3.smd" "lods/lod2_reference_gib3.smd"
}