$modelname "props\rage\pickup_fatboy.mdl"
$model "studio" "pickup_fatboy.smd"

$cdmaterials "models\Rage\Props\"
$surfaceprop "weapon"

$sequence "idle" "pickup_fatboy.smd" {
	fps 30
}

$collisionmodel "pickup_fatboy.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_fatboy.smd" "lods/lod1_pickup_fatboy.smd"
}

$lod 25
{
    replacemodel "pickup_fatboy.smd" "lods/lod2_pickup_fatboy.smd"
}

$lod 50
{
    replacemodel "pickup_fatboy.smd" "lods/lod3_pickup_fatboy.smd"
}

$shadowlod
{
    replacemodel "pickup_fatboy.smd" "lods/lod2_pickup_fatboy.smd"
}