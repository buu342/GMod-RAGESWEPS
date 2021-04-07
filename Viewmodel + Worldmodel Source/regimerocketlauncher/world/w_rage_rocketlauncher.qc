// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_rocketlauncher.mdl"
$model "studio" "reference.smd"

$attachment "muzzle" "ValveBiped.Weapon_bone" 17.00 0.50 -3.60 rotate 0 0 180

$cdmaterials "models\Rage\Weapons\RocketLauncher"

$bodygroup "mag"
{
	studio "mag.smd"
	blank
}

$bodygroup "Rocket2"
{
	studio "Rocket2.smd"
	studio "Viper2.smd"
	blank
}

$bodygroup "Rocket3"
{
	studio "Rocket3.smd"
	studio "Viper3.smd"
	blank
}

$bodygroup "Rocket4"
{
	studio "Rocket4.smd"
	studio "Viper4.smd"
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
    replacemodel "mag.smd" "lods/lod1_mag.smd"
    replacemodel "Rocket2.smd" "lods/lod1_Rocket2.smd"
    replacemodel "Rocket3.smd" "lods/lod1_Rocket3.smd"
    replacemodel "Rocket4.smd" "lods/lod1_Rocket4.smd"
    replacemodel "Viper2.smd" "lods/lod1_Viper2.smd"
    replacemodel "Viper3.smd" "lods/lod1_Viper3.smd"
    replacemodel "Viper4.smd" "lods/lod1_Viper4.smd"
}

$lod 25
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag.smd" "lods/lod2_mag.smd"
    replacemodel "Rocket2.smd" "lods/lod2_Rocket2.smd"
    replacemodel "Rocket3.smd" "lods/lod2_Rocket3.smd"
    replacemodel "Rocket4.smd" "lods/lod2_Rocket4.smd"
    replacemodel "Viper2.smd" "lods/lod2_Viper2.smd"
    replacemodel "Viper3.smd" "lods/lod2_Viper3.smd"
    replacemodel "Viper4.smd" "lods/lod2_Viper4.smd"
}

$lod 50
{
    replacemodel "reference.smd" "lods/lod3_reference.smd"
    replacemodel "mag.smd" "lods/lod3_mag.smd"
    replacemodel "Rocket2.smd" "lods/blank.smd"
    replacemodel "Rocket3.smd" "lods/blank.smd"
    replacemodel "Rocket4.smd" "lods/blank.smd"
    replacemodel "Viper2.smd" "lods/blank.smd"
    replacemodel "Viper3.smd" "lods/blank.smd"
    replacemodel "Viper4.smd" "lods/blank.smd"
}

$shadowlod
{
    replacemodel "reference.smd" "lods/lod2_reference.smd"
    replacemodel "mag.smd" "lods/lod2_mag.smd"
    replacemodel "Rocket2.smd" "lods/lod2_Rocket2.smd"
    replacemodel "Rocket3.smd" "lods/lod2_Rocket3.smd"
    replacemodel "Rocket4.smd" "lods/lod2_Rocket4.smd"
    replacemodel "Viper2.smd" "lods/lod2_Viper2.smd"
    replacemodel "Viper3.smd" "lods/lod2_Viper3.smd"
    replacemodel "Viper4.smd" "lods/lod2_Viper4.smd"
}