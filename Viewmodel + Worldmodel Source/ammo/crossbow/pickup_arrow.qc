$modelname "props\rage\pickup_arrow.mdl"
$model "studio" "pickup_arrow.smd"

$cdmaterials "models\Rage\Props\"
$cdmaterials "models\Rage\Weapons\MachineGun"
$surfaceprop "weapon"

$sequence "idle" "pickup_arrow.smd" {
	fps 30
}

$collisionmodel "pickup_arrow.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_arrow.smd" "lods/lod1_pickup_arrow.smd"
}

$lod 25
{
    replacemodel "pickup_arrow.smd" "lods/lod2_pickup_arrow.smd"
}

$lod 50
{
    replacemodel "pickup_arrow.smd" "lods/lod3_pickup_arrow.smd"
}

$shadowlod
{
    replacemodel "pickup_arrow.smd" "lods/lod2_pickup_arrow.smd"
}