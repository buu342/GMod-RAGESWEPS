$modelname "props\rage\pickup_wingstick.mdl"
$model "studio" "pickup_wingstick.smd"

$cdmaterials "models\Rage\Weapons\WingStick"
$surfaceprop "weapon"

$sequence "idle" "pickup_wingstick.smd" {
	fps 30
}

$collisionmodel "pickup_wingstick.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_wingstick.smd" "lods/lod1_pickup_wingstick.smd"
}

$lod 25
{
    replacemodel "pickup_wingstick.smd" "lods/lod2_pickup_wingstick.smd"
}

$lod 50
{
    replacemodel "pickup_wingstick.smd" "lods/lod3_pickup_wingstick.smd"
}

$shadowlod
{
    replacemodel "pickup_wingstick.smd" "lods/lod2_pickup_wingstick.smd"
}