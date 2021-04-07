$modelname "props\rage\pickup_hardware.mdl"
$model "studio" "pickup_hardware.smd"

$cdmaterials "models\Rage\Props\"
$surfaceprop "weapon"

$sequence "idle" "pickup_hardware.smd" {
	fps 30
}

$collisionmodel "pickup_hardware.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_hardware.smd" "lods/lod1_pickup_hardware.smd"
}

$lod 25
{
    replacemodel "pickup_hardware.smd" "lods/lod2_pickup_hardware.smd"
}

$lod 50
{
    replacemodel "pickup_hardware.smd" "lods/lod3_pickup_hardware.smd"
}

$shadowlod
{
    replacemodel "pickup_hardware.smd" "lods/lod2_pickup_hardware.smd"
}