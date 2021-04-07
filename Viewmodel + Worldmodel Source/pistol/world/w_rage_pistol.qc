// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_pistol.mdl"
$model "studio" "reference.smd"

$attachment "muzzle" "ValveBiped.Weapon_bone" 4.61 0.30 -2.20 rotate 9 0 177
$cdmaterials "models\Rage\Weapons\Pistol"

$bodygroup "mag"
{
	studio "TwelveRound.smd"
	studio "SixRound.smd"
	studio "Killburst.smd"
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
    replacemodel "Killburst.smd" "lods/lod1_Killburst.smd"
    replacemodel "Sixround.smd" "lods/lod1_Sixround.smd"
    replacemodel "TwelveRound.smd" "lods/lod1_TwelveRound.smd"
}

$lod 25
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "Killburst.smd" "lods/lod2_Killburst.smd"
    replacemodel "Sixround.smd" "lods/lod2_Sixround.smd"
    replacemodel "TwelveRound.smd" "lods/lod2_TwelveRound.smd"
}

$lod 50
{
    replacemodel "reference.smd" "lods/lod3_reference.smd"
    replacemodel "Killburst.smd" "lods/lod3_Killburst.smd"
    replacemodel "Sixround.smd" "lods/lod3_Sixround.smd"
    replacemodel "TwelveRound.smd" "lods/lod3_TwelveRound.smd"
}

$shadowlod
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "Killburst.smd" "lods/lod2_Killburst.smd"
    replacemodel "Sixround.smd" "lods/lod2_Sixround.smd"
    replacemodel "TwelveRound.smd" "lods/lod2_TwelveRound.smd"
}