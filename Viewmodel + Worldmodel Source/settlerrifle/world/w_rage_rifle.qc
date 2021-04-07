// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_rifle.mdl"
$model "studio" "reference.smd"

$attachment "muzzle" "ValveBiped.Weapon_bone" 27.15 0.90 -1.90 rotate 3 0 180
$attachment "1" "ValveBiped.Weapon_bone" 4.40 -0.10 -2.40 rotate 2 -90 -81

$cdmaterials "models\Rage\Weapons\Rifle"

$bodygroup "mag"
{
	studio "mag1.smd"
	studio "mag2.smd"
    blank
}

$bodygroup "muzzle"
{
	studio "muzzle1.smd"
	studio "muzzle2.smd"
}

$bodygroup "stabilizer"
{
	blank
	studio "stabilizer.smd"
}

$bodygroup "sight"
{
    blank
	studio "scope.smd"
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
    replacemodel "mag1.smd" "lods/lod1_mag1.smd"
    replacemodel "mag2.smd" "lods/lod1_mag2.smd"
    replacemodel "muzzle1.smd" "lods/lod1_muzzle1.smd"
    replacemodel "muzzle2.smd" "lods/lod1_muzzle2.smd"
    replacemodel "scope.smd" "lods/lod1_scope.smd"
    replacemodel "stabilizer.smd" "lods/lod1_stabilizer.smd"
}

$lod 25
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag1.smd" "lods/lod2_mag1.smd"
    replacemodel "mag2.smd" "lods/lod2_mag2.smd"    
    replacemodel "muzzle1.smd" "lods/lod2_muzzle1.smd"
    replacemodel "muzzle2.smd" "lods/lod2_muzzle2.smd"
    replacemodel "scope.smd" "lods/lod2_scope.smd"
    replacemodel "stabilizer.smd" "lods/lod2_stabilizer.smd"
}

$lod 50
{
    replacemodel "reference.smd" "lods/lod3_reference.smd"
    replacemodel "mag1.smd" "lods/lod3_mag1.smd"
    replacemodel "mag2.smd" "lods/lod3_mag2.smd"    
    replacemodel "muzzle1.smd" "lods/lod3_muzzle1.smd"
    replacemodel "muzzle2.smd" "lods/lod3_muzzle2.smd"
    replacemodel "scope.smd" "lods/blank.smd"
    replacemodel "stabilizer.smd" "lods/blank.smd"
}

$shadowlod
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag1.smd" "lods/lod2_mag1.smd"
    replacemodel "mag2.smd" "lods/lod2_mag2.smd"    
    replacemodel "muzzle1.smd" "lods/lod2_muzzle1.smd"
    replacemodel "muzzle2.smd" "lods/lod2_muzzle2.smd"
    replacemodel "scope.smd" "lods/lod2_scope.smd"
    replacemodel "stabilizer.smd" "lods/lod2_stabilizer.smd"
}