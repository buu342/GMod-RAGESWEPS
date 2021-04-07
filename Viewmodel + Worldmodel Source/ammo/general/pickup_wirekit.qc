$modelname "props\rage\pickup_wirekit.mdl"
$model "studio" "pickup_wirekit.smd"

$cdmaterials "models\Rage\Props\"
$surfaceprop "weapon"

$sequence "idle" "pickup_wirekit.smd" {
	fps 30
}

$collisionmodel "pickup_wirekit.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_wirekit.smd" "lods/lod1_pickup_wirekit.smd"
}

$lod 25
{
    replacemodel "pickup_wirekit.smd" "lods/lod2_pickup_wirekit.smd"
}

$lod 50
{
    replacemodel "pickup_wirekit.smd" "lods/lod3_pickup_wirekit.smd"
}

$shadowlod
{
    replacemodel "pickup_wirekit.smd" "lods/lod2_pickup_wirekit.smd"
}