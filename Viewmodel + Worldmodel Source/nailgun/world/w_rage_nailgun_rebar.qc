// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_nailgun_rebar.mdl"
$model "studio" "rebar.smd"

$cdmaterials "models\Rage\Weapons\NailGun"

$surfaceprop "weapon"
$contents "solid"

$Sequence "idle" {
	"rebar.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "rebar.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "Rebar.smd" "lods/lod1_Rebar.smd"
}

$lod 25
{
    replacemodel "Rebar.smd" "lods/lod2_Rebar.smd"
}

$lod 50
{
    replacemodel "Rebar.smd" "lods/blank.smd"
}

$shadowlod
{
    replacemodel "Rebar.smd" "lods/lod2_Rebar.smd"
}