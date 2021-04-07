// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_monocle.mdl"
$model "studio" "monocle.smd"

$cdmaterials "models\Rage\Weapons\Pistol"
$surfaceprop "weapon"

$contents "solid"

$sequence "idle" "monocle.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
}

$collisionmodel "monocle.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "monocle.smd" "lods/lod1_monocle.smd"
}

$lod 25
{
    replacemodel "monocle.smd" "lods/lod2_monocle.smd"
}

$lod 50
{
    replacemodel "monocle.smd" "lods/lod3_monocle.smd"
}

$shadowlod
{
    replacemodel "monocle.smd" "lods/lod2_monocle.smd"
}