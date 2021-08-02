/**************************************************************
                     Settler Assault Rifle
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()
DEFINE_BASECLASS( "weapon_buu_rage_base" )
CLASSNAME = "weapon_buu_rage_rifle"

-- SWEP Info
SWEP.PrintName = "Settler Assault Rifle"
SWEP.Purpose   = "All the stopping power of an Assault Rifle plus a rustic wood grain finish!"
SWEP.Category  = "RAGE"

-- Weapon base
SWEP.Base = "weapon_buu_rage_base"

-- Spawning settings
SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

-- Weapon slots
SWEP.Slot    = 2
SWEP.SlotPos = 1

-- Viewmodel/Worldmodel settings
SWEP.ViewModel    = "models/weapons/c_rage_rifle.mdl"
SWEP.WorldModel   = "models/weapons/w_rage_rifle.mdl"
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
SWEP.Primary.Sound            = { Sound("rage/weapons/rifle/shoot-01.wav"), 
                                  Sound("rage/weapons/rifle/shoot-02.wav"), 
                                  Sound("rage/weapons/rifle/shoot-03.wav"), 
                                  Sound("rage/weapons/rifle/shoot-04.wav"),
                                  Sound("rage/weapons/rifle/shoot-05.wav"), 
                                  Sound("rage/weapons/rifle/shoot-06.wav"), 
                                  Sound("rage/weapons/rifle/shoot-07.wav"), 
                                  Sound("rage/weapons/rifle/shoot-08.wav") }
SWEP.Primary.SoundChannelSwap = true
SWEP.Primary.Recoil           = 1
SWEP.Primary.Damage           = 11
SWEP.Primary.NumShots         = 1
SWEP.Primary.Cone             = 0.015
SWEP.Primary.ClipSize         = 40
SWEP.Primary.Delay            = 0.12
SWEP.Primary.DefaultClip      = 80
SWEP.Primary.Automatic        = true
SWEP.Primary.Ammo             = "ammo_rage_rifle"
SWEP.Primary.PitchOverride    = 128
SWEP.Primary.Muzzle           = "rage_muzzle_ar"

-- Secondary Fire Mode
SWEP.Secondary                  = table.Copy(SWEP.Primary)
SWEP.Secondary.SoundChannelSwap = true
SWEP.Secondary.Damage           = 12
SWEP.Secondary.DefaultClip      = -1
SWEP.Secondary.Ammo             = "ammo_rage_feltritear"
SWEP.Secondary.Muzzle           = "rage_muzzle_ar_feltrite"
SWEP.Secondary.Light            = Color(0, 150, 205)

-- Ironsight settings
SWEP.UseNormalShootIron = false

-- Ironsight positions
SWEP.IronSightsPos = Vector(-4.651, -20, 2)
SWEP.IronSightsAng = Vector(-1.711, -1.022, 0)

-- Ironsight shooting positions
SWEP.IronSightsShootPos = Vector(-4.598, -23, 1.919)
SWEP.IronSightsShootAng = Vector(-1.711, -1.022, 0)

-- Sprinting/Nearwall positions
SWEP.RunArmPos   = Vector(5.519, 1.228, -1.78)
SWEP.RunArmAngle = Vector(-10.554, 34.167, -20)

-- Time for ammo to appear in the mag during reload
SWEP.ReloadAmmoTime = 0.7

-- Weapon animations
SWEP.Primary.AnimEmpty       = ACT_VM_PRIMARYATTACK_EMPTY
SWEP.Primary.AnimIron        = ACT_VM_DEPLOYED_IRON_FIRE
SWEP.Primary.AnimIronEmpty   = ACT_VM_DEPLOYED_IRON_DRYFIRE
SWEP.Secondary.AnimEmpty     = ACT_VM_PRIMARYATTACK_EMPTY
SWEP.Secondary.AnimIron      = ACT_VM_DEPLOYED_IRON_FIRE
SWEP.Secondary.AnimIronEmpty = ACT_VM_DEPLOYED_IRON_DRYFIRE

-- Magazine model settings
SWEP.MagModel       = "models/weapons/w_rage_rifle_mag1.mdl"
SWEP.MagDropTime    = 0.2
SWEP.NoMagBodygroup = 2

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
    util.PrecacheSound("RAGE/Weapons/Rifle/Last.wav")
    util.PrecacheSound("RAGE/Weapons/Rifle/Magout.wav")
    util.PrecacheSound("RAGE/Weapons/Rifle/Magin.wav")
    util.PrecacheSound("RAGE/Weapons/Rifle/Slide.wav")
    util.PrecacheModel("models/props/rage/pickup_hardware.mdl")
end


/*-----------------------------
    SetUpgrades1
    Helper function for changing weapon settings based on the 
    muzzle upgrade
    @Param The weapon pointer
-----------------------------*/

local function SetUpgrades1(wep)
    wep.Primary.Cone = wep.Primary.Cone/2
    wep.Upgrades = bit.bor(wep.Upgrades, 0x01)
end


/*-----------------------------
    SetUpgrades2
    Helper function for changing weapon settings based on the 
    stabiliser upgrade
    @Param The weapon pointer
-----------------------------*/

local function SetUpgrades2(wep)
    wep.Primary.Recoil = wep.Primary.Recoil/2
    wep.Upgrades = bit.bor(wep.Upgrades, 0x02)
end


if (CLIENT) then

    /*-----------------------------
        DrawWorldModel
        Draws the worldmodel
    -----------------------------*/

    function SWEP:DrawWorldModel()
    
        -- If the bitfield has the muzzle upgrade, enable the bodygroup
        if (bit.band(self.Upgrades, 0x01) != 0) then
            self:SetBodygroup(2, 1)
        else
            self:SetBodygroup(2, 0)
        end
        
        -- If the bitfield has the stabilizer upgrade, enable the bodygroup
        if (bit.band(self.Upgrades, 0x02) != 0) then
            self:SetBodygroup(3, 1)
        else
            self:SetBodygroup(3, 0)
        end
        
        -- Call the weapon base's version of this function
        BaseClass.DrawWorldModel(self)
    end
    
    
    /*-----------------------------
        Buu_RAGE_ClientsideRifleUpgrade1
        Receives the muzzle upgrade information clientside
    -----------------------------*/

    local function Buu_RAGE_ClientsideRifleUpgrade1(len, ply)
        local ply = net.ReadEntity()
        if (IsValid(ply:GetActiveWeapon()) && ply:GetActiveWeapon():GetClass() == "weapon_buu_rage_rifle") then
            SetUpgrades1(ply:GetActiveWeapon())
        end
    end
    net.Receive("Buu_RAGE_ClientsideRifleUpgrade1", Buu_RAGE_ClientsideRifleUpgrade1)


    /*-----------------------------
        Buu_RAGE_ClientsideRifleUpgrade1
        Receives the stabiliser upgrade information clientside
    -----------------------------*/

    local function Buu_RAGE_ClientsideRifleUpgrade2(len, ply)
        local ply = net.ReadEntity()
        if (IsValid(ply:GetActiveWeapon()) && ply:GetActiveWeapon():GetClass() == "weapon_buu_rage_rifle") then
            SetUpgrades2(ply:GetActiveWeapon())
        end
    end
    net.Receive("Buu_RAGE_ClientsideRifleUpgrade2", Buu_RAGE_ClientsideRifleUpgrade2)


    /*-----------------------------
        Buu_RAGE_RifleBGs
        Toggles bodygroups on the viewmodel based on the upgrades
        @Param The viewmodel
        @Param The player
        @Param The weapon
    -----------------------------*/

    local function Buu_RAGE_RifleBGs(vm, ply, wep)
        if (wep:GetClass() == "weapon_buu_rage_rifle") then
        
            -- If the bitfield has the muzzle upgrade, enable the bodygroup
            if (bit.band(wep.Upgrades, 0x01) == 0x01) then
                vm:SetBodygroup(2, 1)
            else
                vm:SetBodygroup(2, 0)
            end
            
            -- If the bitfield has the stabilizer upgrade, enable the bodygroup
            if (bit.band(wep.Upgrades, 0x02) == 0x02) then
                vm:SetBodygroup(3, 1)
            else
                vm:SetBodygroup(3, 0)
            end
        end
    end
    hook.Add("PreDrawViewModel", "Buu_RAGE_RifleBGs", Buu_RAGE_RifleBGs)
end


if (SERVER) then

    -- Initialize network strings
    util.AddNetworkString("Buu_RAGE_ClientsideRifleUpgrade1")
    util.AddNetworkString("Buu_RAGE_ClientsideRifleUpgrade2")
    
    
    /*-----------------------------
        RAGE_HandleUpgrade
        Allows for adding extra logic when an upgrade
        is received.
    -----------------------------*/

    function SWEP:RAGE_HandleUpgrade()
    
        -- If we have a muzzle upgrade
        if (self:RAGE_CheckUpgrade("ent_rage_pickup_upgrade_armuzzle") && bit.band(self.Upgrades, 0x01) == 0) then
        
            -- Upgrade, and network the change to the player
            SetUpgrades1(self)
            net.Start("Buu_RAGE_ClientsideRifleUpgrade1")
                net.WriteEntity(self.Owner)
            net.Broadcast()
            
            -- Remove the upgrade from our upgrades table
            self:RAGE_RemoveUpgrade("ent_rage_pickup_upgrade_armuzzle")
        end
        
        -- If we have a stabiliser upgrade
        if (self:RAGE_CheckUpgrade("ent_rage_pickup_upgrade_arstabilizer") && bit.band(self.Upgrades, 0x02) == 0) then
        
            -- Upgrade, and network the change to the player
            SetUpgrades2(self)
            net.Start("Buu_RAGE_ClientsideRifleUpgrade2")
                net.WriteEntity(self.Owner)
            net.Broadcast()
            
            -- Remove the upgrade from our upgrades table
            self:RAGE_RemoveUpgrade("ent_rage_pickup_upgrade_arstabilizer")
        end
    end
end
