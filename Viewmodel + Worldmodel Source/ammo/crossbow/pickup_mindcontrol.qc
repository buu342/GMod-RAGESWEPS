$modelname "props\rage\pickup_mindcontrol.mdl"
$model "studio" "pickup_mindcontrol.smd"

$cdmaterials "models\Rage\Props\"
$cdmaterials "models\Rage\Weapons\MachineGun"
$surfaceprop "weapon"

$sequence "idle" "pickup_mindcontrol.smd" {
	fps 30
}

$collisionmodel "pickup_mindcontrol.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "pickup_mindcontrol.smd" "lods/lod1_pickup_mindcontrol.smd"
}

$lod 25
{
    replacemodel "pickup_mindcontrol.smd" "lods/lod2_pickup_mindcontrol.smd"
}

$lod 50
{
    replacemodel "pickup_mindcontrol.smd" "lods/lod3_pickup_mindcontrol.smd"
}

$shadowlod
{
    replacemodel "pickup_mindcontrol.smd" "lods/lod2_pickup_mindcontrol.smd"
}