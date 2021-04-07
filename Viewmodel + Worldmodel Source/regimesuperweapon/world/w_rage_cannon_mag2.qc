// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_cannon_mag2.mdl"
$model "studio" "mag2.smd"

$cdmaterials "models\Rage\Weapons\Cannon"

$surfaceprop "weapon"
$contents "solid"

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
    replacemodel "mag2.smd" "lods/lod1_mag2.smd"
}

$lod 25
{
    replacemodel "mag2.smd" "lods/lod2_mag2.smd"
}

$lod 50
{
    replacemodel "mag2.smd" "lods/lod3_mag2.smd"
}

$shadowlod
{
    replacemodel "mag2.smd" "lods/lod2_mag2.smd"
}