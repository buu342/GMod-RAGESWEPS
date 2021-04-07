/**************************************************************
                        Combat Shotgun
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()
DEFINE_BASECLASS( "weapon_buu_rage_base" )

-- SWEP Info
SWEP.PrintName = "Combat Shotgun"
SWEP.Purpose   = "A beefed up, semi automatic shotgun. More boom for your buckshot."
SWEP.Category  = "RAGE"

-- Weapon base
SWEP.Base = "weapon_buu_rage_base"

-- Spawning settings
SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

-- Weapon slots
SWEP.Slot    = 3
SWEP.SlotPos = 0

-- Viewmodel/Worldmodel settings
SWEP.ViewModel    = "models/weapons/c_rage_shotgun.mdl"
SWEP.WorldModel   = "models/weapons/w_rage_shotgun.mdl"
SWEP.ViewModelFOV = 40

-- Icons
SWEP.KillIcon = "VGUI/entities/weapon_buu_rage_shotgun"
if (CLIENT) then
    killicon.Add("weapon_buu_rage_shotgun", SWEP.KillIcon, Color(255, 255, 255))
    SWEP.WepSelectIcon = surface.GetTextureID(SWEP.KillIcon)
end

-- Holdtype
SWEP.HoldType = "shotgun"

-- Primary Fire Mode
SWEP.Primary.Sound       = { Sound("rage/weapons/shotgun/shoot-01.wav"), 
                             Sound("rage/weapons/shotgun/shoot-02.wav"), 
                             Sound("rage/weapons/shotgun/shoot-03.wav"), 
                             Sound("rage/weapons/shotgun/shoot-04.wav") }
SWEP.Primary.Recoil      = 6
SWEP.Primary.Damage      = 15
SWEP.Primary.NumShots    = 8
SWEP.Primary.Cone        = 0.08
SWEP.Primary.ClipSize    = 8
SWEP.Primary.Delay       = 0.6
SWEP.Primary.DefaultClip = 16
SWEP.Primary.Automatic   = false
SWEP.Primary.BodyGroup   = -1
SWEP.Primary.Ammo        = "ammo_rage_shells"
SWEP.Primary.Muzzle      = "rage_muzzle_shotgun"

-- Secondary Fire Mode
SWEP.Secondary                 = table.Copy(SWEP.Primary)
SWEP.Secondary.Sound           = { Sound("rage/weapons/shotgun/pulse-01.wav"), 
                                   Sound("rage/weapons/shotgun/pulse-02.wav"), 
                                   Sound("rage/weapons/shotgun/pulse-03.wav"), 
                                   Sound("rage/weapons/shotgun/pulse-04.wav") }
SWEP.Secondary.Projectile      = "ent_rage_pulse_shot"
SWEP.Secondary.ProjectileForce = 5000
SWEP.Secondary.NumShots        = 1
SWEP.Secondary.Cone            = 0.01
SWEP.Secondary.DefaultClip     = -1
SWEP.Secondary.Ammo            = "ammo_rage_pulse"
SWEP.Secondary.Muzzle          = "rage_muzzle_ar_feltrite"
SWEP.Secondary.Light           = Color(0, 100, 255)

-- Tertiary Fire Mode
SWEP.Tertiary                 = table.Copy(SWEP.Primary)
SWEP.Tertiary.Sound           = { Sound("rage/weapons/shotgun/popper-01.wav"), 
                                  Sound("rage/weapons/shotgun/popper-02.wav"), 
                                  Sound("rage/weapons/shotgun/popper-03.wav") }
SWEP.Tertiary.Projectile      = "ent_rage_popper_shot"
SWEP.Tertiary.ProjectileForce = 15000
SWEP.Tertiary.NumShots        = 1
SWEP.Tertiary.Cone            = 0.01
SWEP.Tertiary.DefaultClip     = -1
SWEP.Tertiary.Ammo            = "ammo_rage_popper"
SWEP.Tertiary.Muzzle          = "rage_muzzle_nailgun"
SWEP.Tertiary.Anim            = ACT_VM_PRIMARYATTACK

-- Crosshair settings
SWEP.CrosshairType   = 3
SWEP.CrosshairGap    = 1.1
SWEP.CrosshairMove   = 5
SWEP.CrosshairRecoil = 0.2

-- Ironsight settings
SWEP.IronsightSound     = 3
SWEP.UseNormalShootIron = false

-- Ironsight positions
SWEP.IronSightsPos = Vector(-5.884, -14.848, 2.861)
SWEP.IronSightsAng = Vector(-4.99, -5.104, 1.128)

-- Ironsight shooting positions
SWEP.IronSightsShootPos = Vector(-4.917, -25.456, 1.955)
SWEP.IronSightsShootAng = Vector(-4.99, -5.104, 1.128)

-- Sprinting/Nearwall positions
SWEP.RunArmPos = Vector(4.28, 1.228, -1.3)
SWEP.RunArmAngle = Vector(-10.554, 34.167, -20)

-- Time for ammo to appear in the mag during reload
SWEP.ReloadAmmoTime = 0.4

-- Weapon animations
SWEP.Primary.AnimIron   = ACT_VM_DEPLOYED_IRON_FIRE
SWEP.Secondary.AnimIron = ACT_VM_DEPLOYED_IRON_FIRE
SWEP.Tertiary.AnimIron  = ACT_VM_DEPLOYED_IRON_FIRE

-- Shotgun settings
SWEP.Shotgun             = true
SWEP.DestroyDoor         = true
SWEP.ShotgunReloadAmount = 2

-- Magazine model settings
SWEP.MagModel    = -1 -- Disabled until we get the shotgun mag upgrade
SWEP.MagDropTime = 0.2

-- Thirdperson effects
SWEP.ThirdPersonShell = "ShotgunShellEject"

-- Upgrades bitfield
SWEP.Upgrades = 0


/*-----------------------------
    PrecacheStuff
    Precaches things to prevent lag spikes when
    using the weapon
-----------------------------*/

function SWEP:PrecacheStuff()

    -- Call the weapon base's version of this function
    BaseClass.PrecacheStuff(self)
    
    -- Precache weapon specific stuff
    util.PrecacheSound("RAGE/Weapons/Shotgun/Insert.wav")
    util.PrecacheSound("RAGE/Weapons/Shotgun/Magout.wav")
    util.PrecacheSound("RAGE/Weapons/Shotgun/Magin.wav")
    util.PrecacheModel("models/props/rage/pickup_popper.mdl")
    util.PrecacheModel("models/props/rage/pickup_shells.mdl")
    util.PrecacheModel("models/weapons/w_rage_shotgun_mag.mdl")
end


/*-----------------------------
    SetUpgrades
    Helper function for changing weapon settings based on the 
    shotgun mag upgrade
    @Param The weapon pointer
-----------------------------*/

local function SetUpgrades(wep)
    wep.Shotgun = false
    wep.Upgrades = 1
    wep.ReloadAnim = ACT_VM_RELOAD_EMPTY
    wep.ReloadAmmoTime = 0.6
    wep.MagModel = "models/weapons/w_rage_shotgun_mag.mdl"
end


if (CLIENT) then
    
    
    /*-----------------------------
        Buu_RAGE_ShotgunBGs
        Toggles bodygroups on the viewmodel based on the upgrades
        @Param The viewmodel
        @Param The player
        @Param The weapon
    -----------------------------*/
    
    local function Buu_RAGE_ShotgunBGs(vm, ply, wep)
        if (wep:GetClass() == "weapon_buu_rage_shotgun") then
        
            -- Enable the shotgun mag bodygroup if we have the upgrade
            if (wep.Upgrades == 1) then
                vm:SetBodygroup(1, 1)
            else
                vm:SetBodygroup(1, 0)
            end
        end
    end
    hook.Add("PreDrawViewModel", "Buu_RAGE_ShotgunBGs", Buu_RAGE_ShotgunBGs)


    /*-----------------------------
        RAGE_HideWorldModelMag
        Hides the worldmodel mag during reloads
        @Param Whether to hide or not
    -----------------------------*/

    function SWEP:RAGE_HideWorldModelMag(hiding)
        if (hiding) then
            self:SetBodygroup(1, 0)
        elseif (self.Upgrades == 1) then
            self:SetBodygroup(1, 1)
        end
    end
    
    
    /*-----------------------------
        Buu_RAGE_ClientsideShotgunUpgrade
        Receives the mag upgrade information clientside
    -----------------------------*/

    local function Buu_RAGE_ClientsideShotgunUpgrade(len, ply)
        local ply = net.ReadEntity()
        if (IsValid(ply:GetActiveWeapon()) && ply:GetActiveWeapon():GetClass() == "weapon_buu_rage_shotgun") then
            SetUpgrades(ply:GetActiveWeapon())
        end
    end
    net.Receive("Buu_RAGE_ClientsideShotgunUpgrade", Buu_RAGE_ClientsideShotgunUpgrade)
end


if (SERVER) then

    -- Initialize network strings
    util.AddNetworkString("Buu_RAGE_ClientsideShotgunUpgrade")
    
    /*-----------------------------
        RAGE_HandleUpgrade
        Allows for adding extra logic when an upgrade
        is received.
    -----------------------------*/

    function SWEP:RAGE_HandleUpgrade()
    
        -- If we have a shotgun mag upgrade
        if (self.Upgrades == 0 && self:RAGE_CheckUpgrade("ent_rage_pickup_upgrade_shotgunmag")) then
            
            -- Upgrade, and network the change to the player
            SetUpgrades(self)
            net.Start("Buu_RAGE_ClientsideShotgunUpgrade")
                net.WriteEntity(self.Owner)
            net.Broadcast()
            
            -- Remove the upgrade from our upgrades table
            self:RAGE_RemoveUpgrade("ent_rage_pickup_upgrade_shotgunmag")
        end
    end
end