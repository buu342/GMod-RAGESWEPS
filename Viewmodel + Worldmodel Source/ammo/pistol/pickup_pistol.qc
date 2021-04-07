$modelname "props\rage\pickup_pistol.mdl"
$model "studio" "pickup_pistol.smd"

$cdmaterials "models\Rage\Props\"
$surfaceprop "weapon"

$sequence "idle" "pickup_pistol.smd" {
	fps 30
}

$collisionmodel "pickup_pistol.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_pistol.smd" "lods/lod1_pickup_pistol.smd"
}

$lod 25
{
    replacemodel "pickup_pistol.smd" "lods/lod2_pickup_pistol.smd"
}

$lod 50
{
    replacemodel "pickup_pistol.smd" "lods/lod3_pickup_pistol.smd"
}

$shadowlod
{
    replacemodel "pickup_pistol.smd" "lods/lod2_pickup_pistol.smd"
}