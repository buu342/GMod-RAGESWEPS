// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_rocketlauncher_mag3.mdl"
$model "studio" "drum.smd"

$origin 1.1649027 -2.562233 7.2837896
$illumposition 0 0 0

$cdmaterials "models\Rage\Weapons\RocketLauncher"

$surfaceprop "weapon"
$contents "solid"

$Sequence "idle" {
	"drum.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "drum.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "drum.smd" "lods/lod1_drum.smd"
}

$lod 25
{
    replacemodel "drum.smd" "lods/lod2_drum.smd"
}

$lod 50
{
    replacemodel "drum.smd" "lods/lod3_drum.smd"
}

$shadowlod
{
    replacemodel "drum.smd" "lods/lod2_drum.smd"
}