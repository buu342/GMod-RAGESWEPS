/**************************************************************
                     Authority Machine Gun
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()
DEFINE_BASECLASS( "weapon_buu_rage_base" )
CLASSNAME = "weapon_buu_rage_machinegun"

-- SWEP Info
SWEP.PrintName = "Authority Machine Gun"
SWEP.Purpose   = "Fully automatic light machine gun. Mutant tested, Authority approved."
SWEP.Category  = "RAGE"

-- Weapon base
SWEP.Base = "weapon_buu_rage_base"

-- Spawning settings
SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

-- Weapon slots
SWEP.Slot    = 2
SWEP.SlotPos = 2

-- Viewmodel/Worldmodel settings
SWEP.ViewModel    = "models/weapons/c_rage_machinegun.mdl"
SWEP.WorldModel   = "models/weapons/w_rage_machinegun.mdl"
SWEP.ViewModelFOV = 42

-- Icons
SWEP.KillIcon = "VGUI/entities/"..CLASSNAME
if (CLIENT) then
    killicon.Add(CLASSNAME, SWEP.KillIcon, Color(255, 255, 255))
    SWEP.WepSelectIcon = surface.GetTextureID(SWEP.KillIcon)
end

-- Holdtype
SWEP.HoldType = "rifle"

-- Primary Fire Mode
SWEP.Primary.Sound            = { Sound("rage/weapons/machinegun/shoot-01.wav"), 
                                  Sound("rage/weapons/machinegun/shoot-02.wav"), 
                                  Sound("rage/weapons/machinegun/shoot-03.wav"), 
                                  Sound("rage/weapons/machinegun/shoot-04.wav"),
                                  Sound("rage/weapons/machinegun/shoot-05.wav"), 
                                  Sound("rage/weapons/machinegun/shoot-06.wav"), 
                                  Sound("rage/weapons/machinegun/shoot-07.wav") }
SWEP.Primary.SoundChannelSwap = true
SWEP.Primary.Recoil           = 0.6
SWEP.Primary.Damage           = 10
SWEP.Primary.NumShots         = 1
SWEP.Primary.Cone             = 0.026
SWEP.Primary.ClipSize         = 40
SWEP.Primary.Delay            = 0.075
SWEP.Primary.DefaultClip      = 80
SWEP.Primary.Automatic        = true
SWEP.Primary.Ammo             = "ammo_rage_mg"
SWEP.Primary.MagModel         = "models/weapons/w_rage_machinegun_mag1.mdl"
SWEP.Primary.Muzzle           = "rage_muzzle_smg"

-- Secondary Fire Mode
SWEP.Secondary             = table.Copy(SWEP.Primary)
SWEP.Secondary.Sound       = { Sound("rage/weapons/machinegun/feltrite-01.wav"), 
                               Sound("rage/weapons/machinegun/feltrite-02.wav"), 
                               Sound("rage/weapons/machinegun/feltrite-03.wav"), 
                               Sound("rage/weapons/machinegun/feltrite-04.wav"),
                               Sound("rage/weapons/machinegun/feltrite-05.wav"), 
                               Sound("rage/weapons/machinegun/feltrite-06.wav"), 
                               Sound("rage/weapons/machinegun/feltrite-07.wav") }
SWEP.Secondary.Damage      = 11
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Ammo        = "ammo_rage_feltritemg"
SWEP.Secondary.Muzzle      = "fx_rage_muzzle_avx"
SWEP.Secondary.MagModel    = "models/weapons/w_rage_machinegun_mag2.mdl"
SWEP.Secondary.BodyGroup   = 1
SWEP.Secondary.Light       = Color(0, 100, 255)
SWEP.Secondary.Muzzle      = "rage_muzzle_smg_feltrite"

-- Ironsight settings
SWEP.IronsightSound     = 3
SWEP.UseNormalShootIron = true

-- Scope settings
SWEP.Sniper          = true
SWEP.SniperTexture   = "scope/rage_scope_machinegun"
SWEP.ScopeScale      = 0.75
SWEP.AutoSniper      = true
SWEP.AllowBreath     = false
SWEP.ScopeEnterSound = Sound("rage/weapons/rocketlauncher/aimin.wav")
SWEP.ScopeExitSound  = Sound("rage/weapons/rocketlauncher/aimout.wav")

-- Ironsight positions
SWEP.IronSightsPos = Vector(-5.441, -25, 1.84)
SWEP.IronSightsAng = Vector(-1.178, -3.622, 2.867)

-- Sprinting/Nearwall positions
SWEP.RunArmPos = Vector(5.519, 1.228, -1.78)
SWEP.RunArmAngle = Vector(-10.554, 34.167, -20)

-- Time for ammo to appear in the mag during reload
SWEP.ReloadAmmoTime = 0.75

-- Magazine model settings
SWEP.MagModel = SWEP.Primary.MagModel
SWEP.MagDropTime = 0.25
SWEP.NoMagBodygroup = 2

-- Ammo warning sound settings
SWEP.LowAmmoWarnSound = Sound("rage/weapons/machinegun/low.wav")
SWEP.LowAmmoWarnClip  = 5

-- Laser
SWEP.Laser     = false 
SWEP.LaserBone = "Laser" 
SWEP.LaserPos  = Vector(0,0,0)
SWEP.LaserAng  = Angle(93.15,-2,0)

-- Upgrades bitfield
SWEP.Upgrades = 0

-- Register for NPCs
list.Add("NPCUsableWeapons", {class = CLASSNAME, title = SWEP.Category.." "..SWEP.PrintName})


/*-----------------------------
    PrecacheStuff
    Precaches things to prevent lag spikes when
    using the weapon
-----------------------------*/

function SWEP:PrecacheStuff()

    -- Call the weapon base's version of this function
    BaseClass.PrecacheStuff(self)
    
    -- Precache weapon specific stuff
    util.PrecacheSound("RAGE/Weapons/MachineGun/Open.wav")
    util.PrecacheSound("RAGE/Weapons/MachineGun/Dump.wav")
    util.PrecacheSound("RAGE/Weapons/MachineGun/Insert.wav")
    util.PrecacheSound("RAGE/Weapons/MachineGun/Close.wav")
    util.PrecacheModel("models/weapons/w_rage_machinegun_mag2.mdl")
    util.PrecacheModel("models/props/rage/pickup_wirekit.mdl")
end


/*-----------------------------
    SetUpgrades
    Helper function for changing weapon settings based on the 
    laser upgrade
    @Param The weapon pointer
-----------------------------*/

local function SetUpgrades(wep)
    wep.Laser        = true
    wep.Primary.Cone = wep.Primary.Cone / 2
    wep.Upgrades     = 1
end


if (CLIENT) then


    /*-----------------------------
        Buu_RAGE_ClientsideMachinegunUpgrade
        Receives the laser upgrade information clientside
    -----------------------------*/

    local function Buu_RAGE_ClientsideMachinegunUpgrade()
        local ply = net.ReadEntity()
        if (IsValid(ply:GetActiveWeapon()) && ply:GetActiveWeapon():GetClass() == "weapon_buu_rage_machinegun") then
            SetUpgrades(ply:GetActiveWeapon())
        end
    end
    net.Receive("Buu_RAGE_ClientsideMachinegunUpgrade", Buu_RAGE_ClientsideMachinegunUpgrade)
end


if (SERVER) then

    -- Initialize network strings
    util.AddNetworkString("Buu_RAGE_ClientsideMachinegunUpgrade")
    
    
    /*-----------------------------
        RAGE_HandleUpgrade
        Allows for adding extra logic when an upgrade
        is received.
    -----------------------------*/

    function SWEP:RAGE_HandleUpgrade()

        -- If we have a laser upgrade
        if (self.Upgrades == 0 && self:RAGE_CheckUpgrade("ent_rage_pickup_upgrade_mglaser")) then
        
            -- Upgrade, and network the change to the player
            SetUpgrades(self)
            net.Start("Buu_RAGE_ClientsideMachinegunUpgrade")
                net.WriteEntity(self.Owner)
            net.Broadcast()
            
            -- Remove the upgrade from our upgrades table
            self:RAGE_RemoveUpgrade("ent_rage_pickup_upgrade_mglaser")
        end
    end
end