$modelname "props\rage\pickup_viper.mdl"
$model "studio" "pickup_viper.smd"

$cdmaterials "models\Rage\Props\"
$cdmaterials "models\Rage\Weapons\RocketLauncher"
$surfaceprop "weapon"

$sequence "idle" "pickup_viper.smd" {
	fps 30
}

$collisionmodel "pickup_viper.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_viper.smd" "lods/lod1_pickup_viper.smd"
}

$lod 25
{
    replacemodel "pickup_viper.smd" "lods/lod2_pickup_viper.smd"
}

$lod 50
{
    replacemodel "pickup_viper.smd" "lods/lod3_pickup_viper.smd"
}

$shadowlod
{
    replacemodel "pickup_viper.smd" "lods/lod2_pickup_viper.smd"
}