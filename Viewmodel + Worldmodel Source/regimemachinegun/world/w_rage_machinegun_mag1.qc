// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_machinegun_mag1.mdl"
$model "studio" "mag1.smd"


$cdmaterials "models\Rage\Weapons\Machinegun"

$surfaceprop "weapon"
$contents "solid"
$illumposition 0 0 0

$Sequence "idle" {
	"mag1.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "mag1.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "mag1.smd" "lods/lod1_mag1.smd"
}

$lod 25
{
    replacemodel "mag1.smd" "lods/lod2_mag1.smd"
}

$lod 50
{
    replacemodel "mag1.smd" "lods/lod3_mag1.smd"
}

$shadowlod
{
    replacemodel "mag1.smd" "lods/lod2_mag1.smd"
}