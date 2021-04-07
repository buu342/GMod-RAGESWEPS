$modelname "props\rage\pickup_popper.mdl"
$model "studio" "pickup_popper.smd"

$cdmaterials "models\Rage\Props\"
$surfaceprop "weapon"

$sequence "idle" "pickup_popper.smd" {
	fps 30
}

$collisionmodel "pickup_popper.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_popper.smd" "lods/lod1_pickup_popper.smd"
}

$lod 25
{
    replacemodel "pickup_popper.smd" "lods/lod2_pickup_popper.smd"
}

$lod 50
{
    replacemodel "pickup_popper.smd" "lods/lod3_pickup_popper.smd"
}

$shadowlod
{
    replacemodel "pickup_popper.smd" "lods/lod2_pickup_popper.smd"
}