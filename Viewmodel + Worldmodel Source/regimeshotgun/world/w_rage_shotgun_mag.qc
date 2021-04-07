// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_shotgun_mag.mdl"
$model "studio" "mag.smd"

$cdmaterials "models\Rage\Weapons\Shotgun"

$surfaceprop "weapon"
$contents "solid"

$Sequence "idle" {
	"mag.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "mag.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "mag.smd" "lods/lod1_mag.smd"
}

$lod 25
{
    replacemodel "mag.smd" "lods/lod2_mag.smd"
}

$lod 50
{
    replacemodel "mag.smd" "lods/lod3_mag.smd"
}

$shadowlod
{
    replacemodel "mag.smd" "lods/lod2_mag.smd"
}