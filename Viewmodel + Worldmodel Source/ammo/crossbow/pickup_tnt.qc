$modelname "props\rage\pickup_tnt.mdl"
$model "studio" "pickup_tnt.smd"

$cdmaterials "models\Rage\Props\"
$cdmaterials "models\Rage\Weapons\Crossbow"
$surfaceprop "weapon"

$sequence "idle" "pickup_tnt.smd" {
	fps 30
}

$collisionmodel "pickup_tnt.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_tnt.smd" "lods/lod1_pickup_tnt.smd"
}

$lod 25
{
    replacemodel "pickup_tnt.smd" "lods/lod2_pickup_tnt.smd"
}

$lod 50
{
    replacemodel "pickup_tnt.smd" "lods/lod3_pickup_tnt.smd"
}

$shadowlod
{
    replacemodel "pickup_tnt.smd" "lods/lod2_pickup_tnt.smd"
}