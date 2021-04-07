$modelname "props\rage\pickup_killburst.mdl"
$model "studio" "pickup_killburst.smd"

$cdmaterials "models\Rage\Props\"
$surfaceprop "weapon"

$sequence "idle" "pickup_killburst.smd" {
	fps 30
}

$collisionmodel "pickup_killburst.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_killburst.smd" "lods/lod1_pickup_killburst.smd"
}

$lod 25
{
    replacemodel "pickup_killburst.smd" "lods/lod2_pickup_killburst.smd"
}

$lod 50
{
    replacemodel "pickup_killburst.smd" "lods/lod3_pickup_killburst.smd"
}

$shadowlod
{
    replacemodel "pickup_killburst.smd" "lods/lod2_pickup_killburst.smd"
}