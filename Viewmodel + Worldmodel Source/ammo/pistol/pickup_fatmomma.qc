$modelname "props\rage\pickup_fatmomma.mdl"
$model "studio" "pickup_fatmomma.smd"

$cdmaterials "models\Rage\Props\"
$surfaceprop "weapon"

$sequence "idle" "pickup_fatmomma.smd" {
	fps 30
}

$collisionmodel "pickup_fatmomma.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_fatmomma.smd" "lods/lod1_pickup_fatmomma.smd"
}

$lod 25
{
    replacemodel "pickup_fatmomma.smd" "lods/lod2_pickup_fatmomma.smd"
}

$lod 50
{
    replacemodel "pickup_fatmomma.smd" "lods/lod3_pickup_fatmomma.smd"
}

$shadowlod
{
    replacemodel "pickup_fatmomma.smd" "lods/lod2_pickup_fatmomma.smd"
}