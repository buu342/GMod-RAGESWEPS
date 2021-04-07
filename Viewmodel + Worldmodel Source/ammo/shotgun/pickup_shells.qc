$modelname "props\rage\pickup_shells.mdl"
$model "studio" "pickup_shells.smd"

$cdmaterials "models\Rage\Props\"
$surfaceprop "weapon"

$sequence "idle" "pickup_shells.smd" {
	fps 30
}

$collisionmodel "pickup_shells.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_shells.smd" "lods/lod1_pickup_shells.smd"
}

$lod 25
{
    replacemodel "pickup_shells.smd" "lods/lod2_pickup_shells.smd"
}

$lod 50
{
    replacemodel "pickup_shells.smd" "lods/lod3_pickup_shells.smd"
}

$shadowlod
{
    replacemodel "pickup_shells.smd" "lods/lod2_pickup_shells.smd"
}