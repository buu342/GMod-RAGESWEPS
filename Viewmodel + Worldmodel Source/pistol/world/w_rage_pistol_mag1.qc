// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_pistol_mag1.mdl"
$model "studio" "Twelveround.smd"

$cdmaterials "models\Rage\Weapons\Pistol"
$surfaceprop "weapon"
$contents "solid"
$illumposition 0 0 0

$sequence "idle" "Twelveround.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
}

$collisionmodel "Twelveround.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "Twelveround.smd" "lods/lod1_Twelveround.smd"
}

$lod 25
{
    replacemodel "Twelveround.smd" "lods/lod2_Twelveround.smd"
}

$lod 50
{
    replacemodel "Twelveround.smd" "lods/lod3_Twelveround.smd"
}

$shadowlod
{
    replacemodel "Twelveround.smd" "lods/lod2_Twelveround.smd"
}