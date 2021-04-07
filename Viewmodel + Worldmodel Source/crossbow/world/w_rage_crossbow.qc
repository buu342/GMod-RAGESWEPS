// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_crossbow.mdl"
$model "studio" "reference.smd"

$attachment "muzzle" "ValveBiped.Weapon_bone" 25.15 -0.10 -13.60 rotate 30 0 180
$attachment "Arrow" "ValveBiped.Weapon_bone" 8.00 -0.10 -7.00 rotate 30 0 -90

$cdmaterials "models\Rage\Weapons\Crossbow"

$surfaceprop "weapon"
$contents "solid"

$bodygroup "mag"
{
	studio "mag.smd"
	blank
}

$bodygroup "arrow"
{
	studio "arrow.smd"
	studio "arrow_electric.smd"
	studio "arrow_syringe.smd"
	studio "arrow_explosive.smd"
	blank
}

$Sequence "idle" {
	"reference.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$Sequence "attack1" {
	"reference.smd"
	activity "ACT_RANGE_ATTACK_SMG1" 1
	{ event AE_NPC_MUZZLEFLASH 0 "SMG1 MUZZLE" }
	{ event 3002 0 "" }
	fps 30
}

$Sequence "attackoffcenter" {
	"reference.smd"
	{ event AE_NPC_MUZZLEFLASH 0 "SMG1 MUZZLE" }
	{ event 3002 0 "lefthand" }
	fps 30
}

$collisionmodel "reference.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "reference.smd" "lods/lod1_reference.smd"
    replacemodel "mag.smd" "lods/lod1_mag.smd"
    replacemodel "arrow.smd" "lods/lod1_arrow.smd"
    replacemodel "arrow_electric.smd" "lods/lod1_arrow_electric.smd"
    replacemodel "arrow_syringe.smd" "lods/lod1_arrow_syringe.smd"
    replacemodel "arrow_explosive.smd" "lods/lod1_arrow_explosive.smd"
}

$lod 25
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag.smd" "lods/lod2_mag.smd"
    replacemodel "arrow.smd" "lods/lod2_arrow.smd"
    replacemodel "arrow_electric.smd" "lods/lod2_arrow_electric.smd"
    replacemodel "arrow_syringe.smd" "lods/lod2_arrow_syringe.smd"
    replacemodel "arrow_explosive.smd" "lods/lod2_arrow_explosive.smd"
}

$lod 50
{
    replacemodel "reference.smd" "lods/lod3_reference.smd"
    replacemodel "mag.smd" "lods/lod3_mag.smd"
    replacemodel "arrow.smd" "lods/blank.smd"
    replacemodel "arrow_electric.smd" "lods/blank.smd"
    replacemodel "arrow_syringe.smd" "lods/blank.smd"
    replacemodel "arrow_explosive.smd" "lods/blank.smd"
}

$shadowlod
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag.smd" "lods/lod2_mag.smd"
    replacemodel "arrow.smd" "lods/lod2_arrow.smd"
    replacemodel "arrow_electric.smd" "lods/lod2_arrow_electric.smd"
    replacemodel "arrow_syringe.smd" "lods/lod2_arrow_syringe.smd"
    replacemodel "arrow_explosive.smd" "lods/lod2_arrow_explosive.smd"
}