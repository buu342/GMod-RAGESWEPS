// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_pistol_mag3.mdl"
$model "studio" "killburst.smd"

$cdmaterials "models\Rage\Weapons\Pistol"
$surfaceprop "weapon"
$contents "solid"
$illumposition 0 0 0

$sequence "idle" "killburst.smd" {
	fps 30
	"ACT_VM_IDLE" 1
	loop
}

$collisionmodel "killburst.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "killburst.smd" "lods/lod1_killburst.smd"
}

$lod 25
{
    replacemodel "killburst.smd" "lods/lod2_killburst.smd"
}

$lod 50
{
    replacemodel "killburst.smd" "lods/lod3_killburst.smd"
}

$shadowlod
{
    replacemodel "killburst.smd" "lods/lod2_killburst.smd"
}