// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_rocketlauncher_rocket.mdl"

$attachment "muzzle" "ValveBiped.Weapon_bone" -1.00 0.50 -5.50 rotate 0 -180 0

$origin -0.27519 -2.7163916 5.4721794 180
$illumposition 0 0 0

$bodygroup "Rocket"
{
	studio "Rocket2.smd"
	studio "Viper2.smd"
}

$cdmaterials "models\Rage\Weapons\RocketLauncher"

$surfaceprop "weapon"
$contents "solid"

$Sequence "idle" {
	"Rocket2.smd"
	activity "ACT_VM_IDLE" 1
	fadein 0.2
	fadeout 0.2
	fps 30
	loop
}

$collisionmodel "Rocket2.smd"
{
	$mass 8
	$inertia 1
	$damping 0
	$rotdamping 0
}

$lod 10
{
    replacemodel "Rocket2.smd" "lods/lod1_Rocket2.smd"
    replacemodel "Viper2.smd" "lods/lod1_Viper2.smd"
}

$lod 25
{
    replacemodel "Rocket2.smd" "lods/lod2_Rocket2.smd"
    replacemodel "Viper2.smd" "lods/lod2_Viper2.smd"
}

$lod 50
{
    replacemodel "Rocket2.smd" "lods/blank.smd"
    replacemodel "Viper2.smd" "lods/blank.smd"
}

$shadowlod
{
    replacemodel "Rocket2.smd" "lods/lod2_Rocket2.smd"
    replacemodel "Viper2.smd" "lods/lod2_Viper2.smd"
}