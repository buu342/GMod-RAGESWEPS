// Created by Crowbar 0.19.0.0

$modelname "weapons/w_rage_rocketlauncher_mag2.mdl"
$model "studio" "mag.smd"

$origin 1.1649027 -2.562233 7.2837896
$illumposition 0 0 0

$cdmaterials "models\Rage\Weapons\RocketLauncher"

$surfaceprop "weapon"
$contents "solid"

$bodygroup "Rocket2"
{
	studio "Viper2.smd"
	blank
}

$bodygroup "Rocket3"
{
	studio "Viper3.smd"
	blank
}

$bodygroup "Rocket4"
{
	studio "Viper4.smd"
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
    replacemodel "Viper2.smd" "lods/lod1_Viper2.smd"
    replacemodel "Viper3.smd" "lods/lod1_Viper3.smd"
    replacemodel "Viper4.smd" "lods/lod1_Viper4.smd"
}

$lod 25
{
    replacemodel "mag.smd" "lods/lod2_mag.smd"
    replacemodel "Viper2.smd" "lods/lod2_Viper2.smd"
    replacemodel "Viper3.smd" "lods/lod2_Viper3.smd"
    replacemodel "Viper4.smd" "lods/lod2_Viper4.smd"
}

$lod 50
{
    replacemodel "mag.smd" "lods/lod3_mag.smd"
    replacemodel "Viper2.smd" "lods/blank.smd"
    replacemodel "Viper3.smd" "lods/blank.smd"
    replacemodel "Viper4.smd" "lods/blank.smd"
}

$shadowlod
{
    replacemodel "mag.smd" "lods/lod2_mag.smd"
    replacemodel "Viper2.smd" "lods/lod2_Viper2.smd"
    replacemodel "Viper3.smd" "lods/lod2_Viper3.smd"
    replacemodel "Viper4.smd" "lods/lod2_Viper4.smd"
}