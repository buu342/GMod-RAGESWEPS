// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_nailgun.mdl"
$model "studio" "reference.smd"

$attachment "muzzle" "ValveBiped.Weapon_bone" 16.00 0.25 -4.90 rotate 0 -0 180

$cdmaterials "models\Rage\Weapons\NailGun"

$bodygroup "mag"
{
	studio "mag.smd"
    blank
}

$bodygroup "mod"
{
	studio "NailGun.smd"
	studio "RebarGun.smd"
	studio "RailGun.smd"
}

$bodygroup "Rebar"
{
	studio "Rebar.smd"
	blank
}

$surfaceprop "weapon"
$contents "solid"

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

$collisionmodel "collision.smd"
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
    replacemodel "NailGun.smd" "lods/lod1_NailGun.smd"
    replacemodel "RebarGun.smd" "lods/lod1_RebarGun.smd"
    replacemodel "RailGun.smd" "lods/lod1_RailGun.smd"
    replacemodel "Rebar.smd" "lods/lod1_Rebar.smd"
}

$lod 25
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag.smd" "lods/lod2_mag.smd"
    replacemodel "NailGun.smd" "lods/lod2_NailGun.smd"
    replacemodel "RebarGun.smd" "lods/lod2_RebarGun.smd"
    replacemodel "RailGun.smd" "lods/lod2_RailGun.smd"
    replacemodel "Rebar.smd" "lods/lod2_Rebar.smd"
}

$lod 50
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag.smd" "lods/lod2_mag.smd"
    replacemodel "NailGun.smd" "lods/lod2_NailGun.smd"
    replacemodel "RebarGun.smd" "lods/lod2_RebarGun.smd"
    replacemodel "RailGun.smd" "lods/lod2_RailGun.smd"
    replacemodel "Rebar.smd" "lods/blank.smd"
}

$shadowlod
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag.smd" "lods/lod2_mag.smd"
    replacemodel "NailGun.smd" "lods/lod2_NailGun.smd"
    replacemodel "RebarGun.smd" "lods/lod2_RebarGun.smd"
    replacemodel "RailGun.smd" "lods/lod2_RailGun.smd"
    replacemodel "Rebar.smd" "lods/lod2_Rebar.smd"
}