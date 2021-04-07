$modelname "props\rage\pickup_electric.mdl"
$model "studio" "pickup_electric.smd"

$cdmaterials "models\Rage\Props\"
$cdmaterials "models\Rage\Weapons\Crossbow"
$surfaceprop "weapon"

$sequence "idle" "pickup_electric.smd" {
	fps 30
}

$collisionmodel "pickup_electric.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_electric.smd" "lods/lod1_pickup_electric.smd"
}

$lod 25
{
    replacemodel "pickup_electric.smd" "lods/lod2_pickup_electric.smd"
}

$lod 50
{
    replacemodel "pickup_electric.smd" "lods/lod3_pickup_electric.smd"
}

$shadowlod
{
    replacemodel "pickup_electric.smd" "lods/lod2_pickup_electric.smd"
}