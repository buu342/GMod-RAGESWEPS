/**************************************************************
                         Sniper Rifle
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()
DEFINE_BASECLASS( "weapon_buu_rage_base" )

-- SWEP Info
SWEP.PrintName = "Sniper Rifle"
SWEP.Purpose   = "Extremely accurate, one-hit kill. Hit the bulls-eye every time."
SWEP.Category  = "RAGE"

-- Weapon base
SWEP.Base = "weapon_buu_rage_base"

-- Spawning settings
SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

-- Weapon slots
SWEP.Slot    = 3
SWEP.SlotPos = 3

-- Viewmodel/Worldmodel settings
SWEP.ViewModel    = "models/weapons/c_rage_sniper.mdl"
SWEP.WorldModel   = "models/weapons/w_rage_sniper.mdl"
SWEP.ViewModelFOV = 42

-- Icons
SWEP.KillIcon = "VGUI/entities/weapon_buu_rage_sniper"
if (CLIENT) then
    killicon.Add("weapon_buu_rage_sniper", SWEP.KillIcon, Color(255, 255, 255))
    SWEP.WepSelectIcon = surface.GetTextureID(SWEP.KillIcon)
end

-- Holdtype
SWEP.HoldType = "rifle"

-- Primary Fire Mode
SWEP.Primary.Sound            = { Sound("rage/weapons/sniper/shoot-01.wav"), 
                                  Sound("rage/weapons/sniper/shoot-02.wav"), 
                                  Sound("rage/weapons/sniper/shoot-03.wav"), 
                                  Sound("rage/weapons/sniper/shoot-04.wav") }
                                          
SWEP.Primary.SoundChannelSwap = true
SWEP.Primary.Recoil           = 2
SWEP.Primary.Damage           = 50
SWEP.Primary.NumShots         = 1
SWEP.Primary.Cone             = 0.001
SWEP.Primary.ClipSize         = 5
SWEP.Primary.Delay            = 2.4
SWEP.Primary.DelayLastShot    = 1
SWEP.Primary.DefaultClip      = 10
SWEP.Primary.Automatic        = false
SWEP.Primary.Ammo             = "ammo_rage_sniper"

-- Crosshair settings
SWEP.CrosshairType = 2

-- Ironsight settings
SWEP.IronsightSound     = 3
SWEP.UseNormalShootIron = true

-- Scope settings
SWEP.Sniper = true
SWEP.SniperTexture = "scope/rage_scope_sniper"
SWEP.ScopeScale = 0.675
SWEP.AutoSniper = true
SWEP.SniperZoom = 20

-- Ironsight positions
SWEP.IronSightsPos = Vector(-4.401, -13.674, 1.159)
SWEP.IronSightsAng = Vector(0, 0, 0)

-- Sprinting/Nearwall positions
SWEP.RunArmPos   = Vector(5.519, 1.228, -1.78)
SWEP.RunArmAngle = Vector(-10.554, 34.167, -20)

-- Time for ammo to appear in the mag during reload
SWEP.ReloadAmmoTime     = 0.55
SWEP.ReloadAmmoTimeLast = 0.8

-- Magazine model settings
SWEP.MagModel = "models/weapons/w_rage_sniper_mag.mdl"
SWEP.MagDropTime = 0.3

-- Weapon animations
SWEP.Primary.AnimEmpty = ACT_VM_PRIMARYATTACK_EMPTY
SWEP.ReloadAnimEmpty   = ACT_VM_RELOAD_EMPTY

-- Disable weapon base functionality
SWEP.ChangeFireModes = false

-- Effect settings
SWEP.MuzzleEffect = "rage_muzzle_sniper"

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
    util.PrecacheSound("RAGE/Weapons/Sniper/Bolt.wav")
    util.PrecacheSound("RAGE/Weapons/Sniper/Move1.wav")
    util.PrecacheSound("RAGE/Weapons/Sniper/Move2.wav")
    util.PrecacheSound("RAGE/Weapons/Sniper/Move3.wav")
    util.PrecacheSound("RAGE/Weapons/Sniper/Magout.wav")
    util.PrecacheSound("RAGE/Weapons/Sniper/Magin.wav") 
    util.PrecacheSound("RAGE/select.wav")
    util.PrecacheModel("models/props/rage/pickup_wirekit.mdl")
end


/*-----------------------------
    SetupDataTables
    Initializes predicted variables
-----------------------------*/

function SWEP:SetupDataTables()

    -- Sniper Rifle specific variables
    self:NetworkVar("Bool",  0, "Buu_RAGE_SniperZoomExtra")
    
    -- Call the weapon base's version of this function
    BaseClass.SetupDataTables(self)
end


/*-----------------------------
    SetUpgrades
    Helper function for changing weapon settings based on the 
    autoload upgrade
    @Param The weapon pointer
-----------------------------*/

local function SetUpgrades(wep)
    wep.DrawAnimEmpty     = ACT_VM_DRAW_DEPLOYED
    wep.IdleAnimEmpty     = ACT_VM_IDLE_DEPLOYED_EMPTY
    wep.Primary.Anim      = ACT_VM_PRIMARYATTACK_DEPLOYED
    wep.Primary.AnimEmpty = ACT_VM_PRIMARYATTACK_DEPLOYED_EMPTY
    wep.ReloadAnimEmpty   = ACT_VM_DEPLOYED_RELOAD_EMPTY
    wep.Primary.Delay     = 1
end


/*-----------------------------
    HandleIronsights
    Handles ironsight logic
-----------------------------*/

function SWEP:HandleIronsights()
    -- Call the weapon base's version of this function
    BaseClass.HandleIronsights(self)
    
    -- If we're scoped
    if (self:IsScoped()) then 
    
        -- Toggle extra zoom when pressing USE
        if (self.Owner:KeyPressed(IN_USE)) then
            self:SetBuu_RAGE_SniperZoomExtra(!self:GetBuu_RAGE_SniperZoomExtra())
            self:EmitSound("RAGE/select.wav", 40)
        end
        
        -- Set the FOV based on the zoom
        if (self:GetBuu_RAGE_SniperZoomExtra()) then
            self.Owner:SetFOV(self.SniperZoom*0.7, 0.0)
        else
            self.Owner:SetFOV(self.SniperZoom, 0.0)
        end
    elseif (self:GetBuu_RAGE_SniperZoomExtra()) then
    
        -- Otherwise reset the extra zoom
        self:SetBuu_RAGE_SniperZoomExtra(false)
    end
end


if (CLIENT) then

    /*-----------------------------
        PostDrawScope
        Allows extra stuff after drawing the scope
    -----------------------------*/
    
    -- Initialize some static variables
    local ammosizew = 100
    local ammosizeh = 9
    local loadsizew = 106
    local loadsizeh = 11
    local AmmoTexture = "scope/rage_scope_sniper_ammo"
    local LoadTexture = "scope/rage_scope_sniper_load"
    local AmmoChunks = {1, 0.79, 0.59375, 0.390625, 0.1875, 0}
    function SWEP:PostDrawScope()
        local wratio = self.LensTable.w/1216
        local hratio = self.LensTable.h/1216
        local loadtime = math.max(0, (self:GetNextPrimaryFire()-CurTime())/self.Primary.Delay)
        if (self:Clip1() == 0) then
            loadtime = 1
        end
        local mloadtime = 1-loadtime
        local w = loadsizew*wratio
        local ammo = AmmoChunks[1+self:GetMaxClip1()-self:Clip1()]
        
        -- Ammo counter
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetTexture(surface.GetTextureID(AmmoTexture))
        surface.DrawTexturedRectUV(self.LensTable.x+304*wratio, self.LensTable.y+self.LensTable.h/2-math.floor((ammosizeh/2)*hratio), ammo*ammosizew*wratio, ammosizeh*hratio, 0, 0, ammo, 1)
        
        -- Next shot counter
        surface.SetDrawColor(255, 255, 255, 255)
        surface.SetTexture(surface.GetTextureID(LoadTexture))
        surface.DrawTexturedRectUV(self.LensTable.x+self.LensTable.w/2+222*wratio+math.ceil(w*loadtime), self.LensTable.y+self.LensTable.h/2-math.floor((loadsizeh/2)*hratio), mloadtime*w, loadsizeh*hratio, loadtime, 0, 1, 1)
    end
    
    
    /*-----------------------------
        Buu_RAGE_ClientsideSniperUpgrade
        Receives the autoload upgrade information clientside
    -----------------------------*/

    local function Buu_RAGE_ClientsideSniperUpgrade(len, ply)
        if (IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() == "weapon_buu_rage_sniper") then
            SetUpgrades(LocalPlayer():GetActiveWeapon())
        end
    end
    net.Receive("Buu_RAGE_ClientsideSniperUpgrade", Buu_RAGE_ClientsideSniperUpgrade)
end


if (SERVER) then

    -- Initialize network strings
    util.AddNetworkString("Buu_RAGE_ClientsideSniperUpgrade")
    
    
    /*-----------------------------
        RAGE_HandleUpgrade
        Allows for adding extra logic when an upgrade
        is received.
    -----------------------------*/
    
    function SWEP:RAGE_HandleUpgrade()
    
        -- If we have an autoload upgrade
        if (self:RAGE_CheckUpgrade("ent_rage_pickup_upgrade_sniperauto") && self.Upgrades == 0) then
        
            -- Upgrade, and network the change to the player
            SetUpgrades(self)
            net.Start("Buu_RAGE_ClientsideSniperUpgrade")
            net.Send(self.Owner)
            
            -- Remove the upgrade from our upgrades table
            self:RAGE_RemoveUpgrade("ent_rage_pickup_upgrade_sniperauto")
        end
    end
end