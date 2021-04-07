$modelname "props\rage\pickup_rocket.mdl"
$model "studio" "pickup_rocket.smd"

$cdmaterials "models\Rage\Props\"
$cdmaterials "models\Rage\Weapons\RocketLauncher"
$surfaceprop "weapon"

$sequence "idle" "pickup_rocket.smd" {
	fps 30
}

$collisionmodel "pickup_rocket.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_rocket.smd" "lods/lod1_pickup_rocket.smd"
}

$lod 25
{
    replacemodel "pickup_rocket.smd" "lods/lod2_pickup_rocket.smd"
}

$lod 50
{
    replacemodel "pickup_rocket.smd" "lods/lod3_pickup_rocket.smd"
}

$shadowlod
{
    replacemodel "pickup_rocket.smd" "lods/lod2_pickup_rocket.smd"
}