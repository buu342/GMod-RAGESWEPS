// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_crossbow_arrow.mdl"

$attachment "muzzle" "ValveBiped.Weapon_bone" 6.20 0.30 -2.00 rotate -0 -180 0

$origin -0.8049362 7.450902 1.8360167 180
$illumposition 0 0 0

$bodygroup "arrow"
{
	studio "arrow.smd"
	studio "arrow_electric.smd"
	studio "arrow_explosive.smd"
	studio "arrow_syringe.smd"
}

$cdmaterials "models\Rage\Weapons\Crossbow"

$surfaceprop "default_silent"
$contents "solid"

$Sequence "idle" {
	"arrow.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "arrow.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "arrow.smd" "lods/lod1_arrow.smd"
    replacemodel "arrow_electric.smd" "lods/lod1_arrow_electric.smd"
    replacemodel "arrow_syringe.smd" "lods/lod1_arrow_syringe.smd"
    replacemodel "arrow_explosive.smd" "lods/lod1_arrow_explosive.smd"
}

$lod 25
{
    replacemodel "arrow.smd" "lods/lod2_arrow.smd"
    replacemodel "arrow_electric.smd" "lods/lod2_arrow_electric.smd"
    replacemodel "arrow_syringe.smd" "lods/lod2_arrow_syringe.smd"
    replacemodel "arrow_explosive.smd" "lods/lod2_arrow_explosive.smd"
}

$lod 50
{
    replacemodel "arrow.smd" "lods/blank.smd"
    replacemodel "arrow_electric.smd" "lods/blank.smd"
    replacemodel "arrow_syringe.smd" "lods/blank.smd"
    replacemodel "arrow_explosive.smd" "lods/blank.smd"
}

$shadowlod
{
    replacemodel "arrow.smd" "lods/lod2_arrow.smd"
    replacemodel "arrow_electric.smd" "lods/lod2_arrow_electric.smd"
    replacemodel "arrow_syringe.smd" "lods/lod2_arrow_syringe.smd"
    replacemodel "arrow_explosive.smd" "lods/lod2_arrow_explosive.smd"
}