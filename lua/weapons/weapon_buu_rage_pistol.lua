/**************************************************************
                        Settler Pistol
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()
DEFINE_BASECLASS( "weapon_buu_rage_base" )

-- SWEP Info
SWEP.PrintName = "Settler Pistol"
SWEP.Purpose   = "A standard pistol. Shoot it until it dies, eventually."
SWEP.Category  = "RAGE"

-- Weapon base
SWEP.Base = "weapon_buu_rage_base"

-- Spawning settings
SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

-- Weapon slots
SWEP.Slot    = 1
SWEP.SlotPos = 0

-- Viewmodel/Worldmodel settings
SWEP.ViewModel    = "models/weapons/c_rage_pistol.mdl"
SWEP.WorldModel   = "models/weapons/w_rage_pistol.mdl"
SWEP.ViewModelFOV = 45

-- Icons
SWEP.KillIcon = "VGUI/entities/weapon_buu_rage_pistol"
if (CLIENT) then
    killicon.Add("weapon_buu_rage_pistol", SWEP.KillIcon, Color(255, 255, 255))
    SWEP.WepSelectIcon = surface.GetTextureID(SWEP.KillIcon)
end

-- Holdtype
SWEP.HoldType = "revolver"

-- Primary Fire Mode
SWEP.Primary.Sound            = { Sound("rage/weapons/pistol/shoot-01.wav"), 
                                  Sound("rage/weapons/pistol/shoot-02.wav"), 
                                  Sound("rage/weapons/pistol/shoot-03.wav"), 
                                  Sound("rage/weapons/pistol/shoot-04.wav"),
                                  Sound("rage/weapons/pistol/shoot-05.wav"), 
                                  Sound("rage/weapons/pistol/shoot-06.wav") }
SWEP.Primary.SoundChannelSwap = true
SWEP.Primary.Recoil           = 1.2
SWEP.Primary.Damage           = 17
SWEP.Primary.NumShots         = 1
SWEP.Primary.Cone             = 0.03
SWEP.Primary.ClipSize         = 12
SWEP.Primary.Delay            = 0.3
SWEP.Primary.DefaultClip      = 24
SWEP.Primary.Automatic        = false
SWEP.Primary.Ammo             = "ammo_rage_pistol"
SWEP.Primary.AnimIron         = ACT_VM_DEPLOYED_IRON_FIRE
SWEP.Primary.AnimEmpty        = ACT_VM_PRIMARYATTACK_EMPTY
SWEP.Primary.AnimIronEmpty    = ACT_VM_DEPLOYED_IRON_DRYFIRE
SWEP.Primary.MagModel         = "models/weapons/w_rage_pistol_mag1.mdl"

-- Secondary Fire Mode
SWEP.Secondary               = table.Copy(SWEP.Primary)
SWEP.Secondary.Sound         = { Sound("rage/weapons/pistol/fatboy-01.wav"), 
                                 Sound("rage/weapons/pistol/fatboy-02.wav"), 
                                 Sound("rage/weapons/pistol/fatboy-03.wav"), 
                                 Sound("rage/weapons/pistol/fatboy-04.wav"),
                                 Sound("rage/weapons/pistol/fatboy-05.wav"), 
                                 Sound("rage/weapons/pistol/fatboy-06.wav") }
SWEP.Secondary.Recoil        = 1.7
SWEP.Secondary.Cone          = 0.012
SWEP.Secondary.Damage        = 60
SWEP.Secondary.ClipSize      = 6
SWEP.Secondary.DefaultClip   = -1
SWEP.Secondary.Ammo          = "ammo_rage_fatboy"
SWEP.Secondary.Anim          = ACT_VM_PRIMARYATTACK
SWEP.Secondary.AnimIron      = ACT_VM_DEPLOYED_IRON_FIRE
SWEP.Secondary.AnimEmpty     = ACT_VM_PRIMARYATTACK_EMPTY
SWEP.Secondary.AnimIronEmpty = ACT_VM_DEPLOYED_IRON_DRYFIRE
SWEP.Secondary.BodyGroup     = 1
SWEP.Secondary.MagModel      = "models/weapons/w_rage_pistol_mag2.mdl"

-- Tertiary Fire Mode
SWEP.Tertiary               = table.Copy(SWEP.Primary)
SWEP.Tertiary.Damage        = 20
SWEP.Tertiary.Recoil        = 0.7
SWEP.Tertiary.ClipSize      = 4
SWEP.Tertiary.DefaultClip   = -1
SWEP.Tertiary.Ammo          = "ammo_rage_killburst"
SWEP.Tertiary.BurstFire     = true
SWEP.Tertiary.BurstCount    = 4
SWEP.Tertiary.BurstTime     = 0.075
SWEP.Tertiary.Delay         = 0.8
SWEP.Tertiary.CancelBurst   = false
SWEP.Tertiary.Anim          = ACT_VM_HITKILL
SWEP.Tertiary.AnimIron      = ACT_VM_HITKILL
SWEP.Tertiary.AnimEmpty     = ACT_VM_HITKILL
SWEP.Tertiary.AnimIronEmpty = ACT_VM_HITKILL
SWEP.Tertiary.BodyGroup     = 2
SWEP.Tertiary.MagModel      = "models/weapons/w_rage_pistol_mag3.mdl"

-- Quaternary Fire Mode
SWEP.Quaternary               = table.Copy(SWEP.Primary)
SWEP.Quaternary.Sound         = { Sound("rage/weapons/pistol/fatmom-01.wav"), 
                                  Sound("rage/weapons/pistol/fatmom-02.wav"), 
                                  Sound("rage/weapons/pistol/fatmom-03.wav"), 
                                  Sound("rage/weapons/pistol/fatmom-04.wav"),
                                  Sound("rage/weapons/pistol/fatmom-05.wav") }
SWEP.Quaternary.Recoil        = 1.6
SWEP.Quaternary.Cone          = 0.012
SWEP.Quaternary.Damage        = 100
SWEP.Quaternary.ClipSize      = 6
SWEP.Quaternary.DefaultClip   = -1
SWEP.Quaternary.Ammo          = "ammo_rage_fatmomma"
SWEP.Quaternary.Anim          = ACT_VM_PRIMARYATTACK
SWEP.Quaternary.AnimIron      = ACT_VM_DEPLOYED_IRON_FIRE
SWEP.Quaternary.AnimEmpty     = ACT_VM_PRIMARYATTACK_EMPTY
SWEP.Quaternary.AnimIronEmpty = ACT_VM_DEPLOYED_IRON_DRYFIRE
SWEP.Quaternary.BodyGroup     = 1
SWEP.Quaternary.MagModel      = "models/weapons/w_rage_pistol_mag2.mdl"

-- Ironsight settings
SWEP.IronsightSound     = 1
SWEP.IronsightVMFOV     = 1.3
SWEP.UseNormalShootIron = false

-- Scope settings
SWEP.Sniper          = false -- Disabled by default since the upgrade will enable it
SWEP.SniperTexture   = "scope/rage_scope_monocle"
SWEP.ScopeScale      = 0.78
SWEP.AutoSniper      = true
SWEP.AllowBreath     = false
SWEP.ScopeEnterSound = Sound("RAGE/Weapons/Generic/Monocleopen.wav")

-- Ironsight positions
SWEP.IronSightsPos = Vector(-8.04, 0, 3.4)
SWEP.IronSightsAng = Vector(-2.718, -8.19, -4.864)

-- Ironsight shooting positions
SWEP.IronSightsShootPos = Vector(-6.417, -10.456, 1.955)
SWEP.IronSightsShootAng = Vector(-4.99, -5.104, 1.128)

-- Sprinting/Nearwall positions
SWEP.PistolSprint = true
SWEP.RunArmPos    = Vector(1.549, -12.582, -14.83)
SWEP.RunArmAngle  = Vector(70, -10.948, -3.283)

-- Time for ammo to appear in the mag during reload
SWEP.ReloadAmmoTime = 0.95

-- Magazine model settings
SWEP.MagModel       = SWEP.Primary.MagModel
SWEP.MagDropTime    = 0.3
SWEP.NoMagBodygroup = 3

-- Viewmodel bodygroup settings
SWEP.VMBGSwapTime = 1.8

-- Effect settings
SWEP.MuzzleEffect     = "rage_muzzle_pistol"
SWEP.ThirdPersonShell = ""


/*-----------------------------
    PrecacheStuff
    Precaches things to prevent lag spikes when
    using the weapon
-----------------------------*/

function SWEP:PrecacheStuff()

    -- Call the weapon base's version of this function
    BaseClass.PrecacheStuff(self)
    
    -- Precache weapon specific stuff
    util.PrecacheSound("RAGE/Weapons/Pistol/Open.wav")
    util.PrecacheSound("RAGE/Weapons/Pistol/Dump.wav")
    util.PrecacheSound("RAGE/Weapons/Pistol/Insert.wav")
    util.PrecacheSound("RAGE/Weapons/Pistol/Close.wav")
    util.PrecacheSound("RAGE/Weapons/Generic/Monoclein.wav")
    util.PrecacheSound("RAGE/Weapons/Generic/Monocleopen.wav")
    util.PrecacheSound("RAGE/Weapons/Generic/Monocleout.wav")
    util.PrecacheModel("models/props/rage/pickup_pistol.mdl")
    util.PrecacheModel("models/props/rage/pickup_fatboy.mdl")
    util.PrecacheModel("models/props/rage/pickup_killburst.mdl")
    util.PrecacheModel("models/props/rage/pickup_fatmomma.mdl")
    util.PrecacheModel("models/weapons/w_rage_pistol_mag2.mdl")
    util.PrecacheModel("models/weapons/w_rage_pistol_mag3.mdl")
    util.PrecacheModel("models/weapons/w_rage_monocle.mdl")
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
        wep.IronVMFOVOld     = wep.IronsightVMFOV
        wep.IronsightVMFOV   = 1
    else
        wep.IronSightsPos    = wep.OldIronSightPos
        wep.IronSightsAng    = wep.OldIronSightAng
        wep.IronsightInAnim  = -1
        wep.IronsightOutAnim = -1
        wep.IronsightRoll    = true
        wep.PlayFullIronAnim = false
        wep.IronsightVMFOV   = wep.IronVMFOVOld
    end
end


if (CLIENT) then
    
    
    /*-----------------------------
        Buu_RAGE_ClientsidePistolUpgrade
        Receives the monocle upgrade information clientside
    -----------------------------*/

    local function Buu_RAGE_ClientsidePistolUpgrade(len, ply)
        if (IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() == "weapon_buu_rage_pistol") then
            SetUpgrades(LocalPlayer():GetActiveWeapon(), net.ReadBool())
        end
    end
    net.Receive("Buu_RAGE_ClientsidePistolUpgrade", Buu_RAGE_ClientsidePistolUpgrade)
end


if (SERVER) then

    -- Initialize network strings
    util.AddNetworkString("Buu_RAGE_ClientsidePistolUpgrade")
    
    
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
            net.Start("Buu_RAGE_ClientsidePistolUpgrade")
                net.WriteBool(true)
            net.Send(self.Owner)
        elseif (!hasmonocle && self.Sniper) then
            SetUpgrades(self, false)
            net.Start("Buu_RAGE_ClientsidePistolUpgrade")
                net.WriteBool(false)
            net.Send(self.Owner)
        end
    end
end