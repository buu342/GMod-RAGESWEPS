// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_crossbow_mag.mdl"
$model "studio" "mag.smd"

$cdmaterials "models\Rage\Weapons\Crossbow"

$surfaceprop "weapon"
$contents "solid"

$bodygroup "arrow"
{
	studio "arrow.smd"
	studio "arrow_electric.smd"
	studio "arrow_explosive.smd"
	studio "arrow_syringe.smd"
	blank
}

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
    replacemodel "arrow.smd" "lods/lod1_arrow.smd"
    replacemodel "arrow_electric.smd" "lods/lod1_arrow_electric.smd"
    replacemodel "arrow_syringe.smd" "lods/lod1_arrow_syringe.smd"
    replacemodel "arrow_explosive.smd" "lods/lod1_arrow_explosive.smd"
}

$lod 25
{
    replacemodel "mag.smd" "lods/lod2_mag.smd"
    replacemodel "arrow.smd" "lods/lod2_arrow.smd"
    replacemodel "arrow_electric.smd" "lods/lod2_arrow_electric.smd"
    replacemodel "arrow_syringe.smd" "lods/lod2_arrow_syringe.smd"
    replacemodel "arrow_explosive.smd" "lods/lod2_arrow_explosive.smd"
}

$lod 50
{
    replacemodel "mag.smd" "lods/lod3_mag.smd"
    replacemodel "arrow.smd" "lods/blank.smd"
    replacemodel "arrow_electric.smd" "lods/blank.smd"
    replacemodel "arrow_syringe.smd" "lods/blank.smd"
    replacemodel "arrow_explosive.smd" "lods/blank.smd"
}

$shadowlod
{
    replacemodel "mag.smd" "lods/lod2_mag.smd"
    replacemodel "arrow.smd" "lods/lod2_arrow.smd"
    replacemodel "arrow_electric.smd" "lods/lod2_arrow_electric.smd"
    replacemodel "arrow_syringe.smd" "lods/lod2_arrow_syringe.smd"
    replacemodel "arrow_explosive.smd" "lods/lod2_arrow_explosive.smd"
}