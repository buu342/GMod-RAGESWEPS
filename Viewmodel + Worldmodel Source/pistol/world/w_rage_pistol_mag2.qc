// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_pistol_mag2.mdl"
$model "studio" "Sixround.smd"

$cdmaterials "models\Rage\Weapons\Pistol"
$surfaceprop "weapon"
$contents "solid"
$illumposition 0 0 0

$sequence "idle" "Sixround.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
}

$collisionmodel "Sixround.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "Sixround.smd" "lods/lod1_Sixround.smd"
}

$lod 25
{
    replacemodel "Sixround.smd" "lods/lod2_Sixround.smd"
}

$lod 50
{
    replacemodel "Sixround.smd" "lods/lod3_Sixround.smd"
}

$shadowlod
{
    replacemodel "Sixround.smd" "lods/lod2_Sixround.smd"
}