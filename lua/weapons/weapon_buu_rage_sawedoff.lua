/**************************************************************
                     Double Barrel Shotgun
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()
DEFINE_BASECLASS( "weapon_buu_rage_base" )
CLASSNAME = "weapon_buu_rage_sawedoff"

-- SWEP Info
SWEP.PrintName = "Double Barrel Shotgun"
SWEP.Purpose   = "Twice the firepower of the Combat Shotgun. Double the bang, double the fun."
SWEP.Category  = "RAGE"

-- Weapon base
SWEP.Base = "weapon_buu_rage_base"

-- Spawning settings
SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

-- Weapon slots
SWEP.Slot    = 1
SWEP.SlotPos = 1

-- Viewmodel/Worldmodel settings
SWEP.ViewModel    = "models/weapons/c_rage_sawedoff.mdl"
SWEP.WorldModel   = "models/weapons/w_rage_sawedoff.mdl"
SWEP.ViewModelFOV = 45

-- Icons
SWEP.KillIcon = "VGUI/entities/"..CLASSNAME
if (CLIENT) then
    killicon.Add(CLASSNAME, SWEP.KillIcon, Color(255, 255, 255))
    SWEP.WepSelectIcon = surface.GetTextureID(SWEP.KillIcon)
end

-- Holdtype
SWEP.HoldType = "revolver"

-- Primary Fire Mode
SWEP.Primary.Sound       = { Sound("rage/weapons/shotgun/shoot-01.wav"), 
                             Sound("rage/weapons/shotgun/shoot-02.wav"), 
                             Sound("rage/weapons/shotgun/shoot-03.wav"), 
                             Sound("rage/weapons/shotgun/shoot-04.wav") }
SWEP.Primary.Recoil      = 8
SWEP.Primary.Damage      = 15
SWEP.Primary.TakeAmmo    = 2
SWEP.Primary.NumShots    = 16
SWEP.Primary.Cone        = 0.15
SWEP.Primary.ClipSize    = 2
SWEP.Primary.Delay       = 0.6
SWEP.Primary.DefaultClip = 4
SWEP.Primary.Automatic   = false
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
SWEP.Secondary.NumShots        = 2
SWEP.Secondary.Cone            = 0.1
SWEP.Secondary.DefaultClip     = -1
SWEP.Secondary.Ammo            = "ammo_rage_pulse"
SWEP.Secondary.Light           = Color(0, 100, 255)
SWEP.Secondary.Muzzle          = "rage_muzzle_ar_feltrite"

-- Tertiary Fire Mode
SWEP.Tertiary                 = table.Copy(SWEP.Primary)
SWEP.Tertiary.Sound           = { Sound("rage/weapons/shotgun/popper-01.wav"), 
                                  Sound("rage/weapons/shotgun/popper-02.wav"), 
                                  Sound("rage/weapons/shotgun/popper-03.wav") }
SWEP.Tertiary.Projectile      = "ent_rage_popper_shot"
SWEP.Tertiary.ProjectileForce = 15000
SWEP.Tertiary.NumShots        = 2
SWEP.Tertiary.Cone            = 0.1
SWEP.Tertiary.DefaultClip     = -1
SWEP.Tertiary.Ammo            = "ammo_rage_popper"
SWEP.Tertiary.Muzzle          = "rage_muzzle_nailgun"
SWEP.Tertiary.Anim            = ACT_VM_PRIMARYATTACK

-- Crosshair settings
SWEP.CrosshairType   = 3
SWEP.CrosshairGap    = 1.4
SWEP.CrosshairMove   = 3
SWEP.CrosshairRecoil = -0.5

-- Ironsight settings
SWEP.IronsightSound = 1

-- Ironsight positions
SWEP.IronSightsPos = Vector(-4.72, 0, 1.24)
SWEP.IronSightsAng = Vector(0.356, 0, 0)

-- Sprinting/Nearwall positions
SWEP.PistolSprint = true
SWEP.RunArmPos    = Vector(2.349, -14.582, -14.83)
SWEP.RunArmAngle  = Vector(70, 0, -3.283)

-- Time for ammo to appear in the mag during reload
SWEP.ReloadAmmoTime = 0.78

-- Change weapon base features
SWEP.CanLowAmmoClick = false
SWEP.DestroyDoor     = true

-- Scope settings
SWEP.Sniper          = false -- Disabled by default since the upgrade will enable it
SWEP.SniperTexture   = "scope/rage_scope_monocle"
SWEP.ScopeScale      = 0.78
SWEP.AutoSniper      = true
SWEP.AllowBreath     = false
SWEP.ScopeEnterSound = Sound("RAGE/Weapons/Generic/Monocleopen.wav")

-- Thirdperson effects
SWEP.ThirdPersonShell = "ShotgunShellEject"

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
    util.PrecacheSound("RAGE/Weapons/SawedOff/Open.wav")
    util.PrecacheSound("RAGE/Weapons/SawedOff/Load.wav")
    util.PrecacheSound("RAGE/Weapons/SawedOff/Close.wav")
    util.PrecacheSound("RAGE/Weapons/Generic/Monoclein.wav")
    util.PrecacheSound("RAGE/Weapons/Generic/Monocleopen.wav")
    util.PrecacheSound("RAGE/Weapons/Generic/Monocleout.wav")
    util.PrecacheModel("models/props/rage/pickup_popper.mdl")
    util.PrecacheModel("models/props/rage/pickup_shells.mdl")
    util.PrecacheModel("models/weapons/w_rage_monocle.mdl")
end


/*-----------------------------
    Think
    Logic that runs every tick
-----------------------------*/

function SWEP:Think()

    -- Initialize variables that were't created before
    if (self.WasReloadingBefore == nil) then
        self.WasReloadingBefore = false
    end
    
    -- If we're reloading, then make third person effects
    if (!self.WasReloadingBefore && self:GetBuu_Reloading() && IsFirstTimePredicted()) then
        self:HandleThirdPersonEffects()
    end
    self.WasReloadingBefore = self:GetBuu_Reloading()
    
    -- Call the weapon base's version of this function
    BaseClass.Think(self)
end

/*-----------------------------
    MuzzleFlashEffect
    Handles the muzzleflash effect emission
    @Param Where to attach the effect to
-----------------------------*/

function SWEP:MuzzleFlashEffect(attachment)
    -- If we're in firstperson, act normally
    if (self.Owner == LocalPlayer() && !self.Owner:ShouldDrawLocalPlayer()) then
        BaseClass.MuzzleFlashEffect(self, attachment)
    else
        
        -- Otherwise emit the muzzleflash if we're not reloading
        -- The timer is due to variable networking delays
        timer.Simple(0.1, function()
            if (!IsValid(self) || self:GetBuu_Reloading()) then return end
            BaseClass.MuzzleFlashEffect(self, attachment)
        end)
    end
end


/*-----------------------------
    MuzzleLightEffect
    Handles the muzzle light emission
    @Param Where to attach the light to
-----------------------------*/

function SWEP:MuzzleLightEffect(attachment)
    -- Emit the muzzle light if we're not reloading
    -- The timer is due to variable networking delays
    timer.Simple(0.1, function()
        if (!IsValid(self) || self:GetBuu_Reloading()) then return end
        BaseClass.MuzzleLightEffect(self, attachment)
    end)
end

function SWEP:ShellEjectEffect(attachment)
    -- If we're in firstperson, act normally
    if (self.Owner == LocalPlayer() && !self.Owner:ShouldDrawLocalPlayer()) then
        BaseClass.ShellEjectEffect(self, attachment)
    else
        -- Otherwise emit two shell effects if we're reloading
        -- The timer is due to variable networking delays
        timer.Simple(0.1, function()
            if (!IsValid(self) || !self:GetBuu_Reloading()) then return end
            BaseClass.ShellEjectEffect(self, attachment)
            BaseClass.ShellEjectEffect(self, attachment)
        end)
    end
end


/*-----------------------------
    SetUpgrades
    Helper function for changing weapon settings based on the 
    monocle upgrade
    @Param The weapon pointer
    @Param Whether to enable the upgrade or not
-----------------------------*/

local function SetUpgrades(wep, enable)
    wep.Sniper = enable
    
    -- If we have a monocole, then change ironsight stuff
    if (enable) then
        wep.OldIronSightPos  = wep.IronSightsPos
        wep.OldIronSightAng  = wep.IronSightsAng
        wep.IronSightsPos    = Vector(0,0,0)
        wep.IronSightsAng    = Vector(0,0,0)
        wep.IronsightInAnim  = ACT_VM_IDLE_TO_LOWERED
        wep.IronsightOutAnim = ACT_VM_LOWERED_TO_IDLE
        wep.IronsightRoll    = false
        wep.PlayFullIronAnim = true
    else
        wep.IronSightsPos    = wep.OldIronSightPos
        wep.IronSightsAng    = wep.OldIronSightAng
        wep.IronsightInAnim  = -1
        wep.IronsightOutAnim = -1
        wep.IronsightRoll    = true
        wep.PlayFullIronAnim = false
    end
end

if (CLIENT) then
    
    
    /*-----------------------------
        Buu_RAGE_ClientsideSawedOffUpgrade
        Receives the monocle upgrade information clientside
    -----------------------------*/

    local function Buu_RAGE_ClientsideSawedOffUpgrade(len, ply)
        if (IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() == "weapon_buu_rage_sawedoff") then
            SetUpgrades(LocalPlayer():GetActiveWeapon(), net.ReadBool())
        end
    end
    net.Receive("Buu_RAGE_ClientsideSawedOffUpgrade", Buu_RAGE_ClientsideSawedOffUpgrade)
end


if (SERVER) then

    -- Initialize network strings
    util.AddNetworkString("Buu_RAGE_ClientsideSawedOffUpgrade")
    
    
    /*-----------------------------
        RAGE_HandleUpgrade
        Allows for adding extra logic when an upgrade
        is received.
    -----------------------------*/

    function SWEP:RAGE_HandleUpgrade()
        local hasmonocle = self:RAGE_CheckUpgrade("ent_rage_pickup_upgrade_monocle")
        
        -- If the owner's monocole state has changed, and we haven't upgraded the SWEP yet, do so
        if (hasmonocle && !self.Sniper) then
            SetUpgrades(self, true)
            net.Start("Buu_RAGE_ClientsideSawedOffUpgrade")
                net.WriteBool(true)
            net.Send(self.Owner)
        elseif (!hasmonocle && self.Sniper) then
            SetUpgrades(self, false)
            net.Start("Buu_RAGE_ClientsideSawedOffUpgrade")
                net.WriteBool(false)
            net.Send(self.Owner)
        end
    end
end