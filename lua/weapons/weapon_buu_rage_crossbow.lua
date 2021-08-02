/**************************************************************
                       Striker Crossbow
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()
DEFINE_BASECLASS( "weapon_buu_rage_base" )
CLASSNAME = "weapon_buu_rage_crossbow"

-- SWEP Info
SWEP.PrintName = "Striker Crossbow"
SWEP.Purpose   = "Autmatic loading, silent takedown machine."
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
SWEP.ViewModel    = "models/weapons/c_rage_crossbow.mdl"
SWEP.WorldModel   = "models/weapons/w_rage_crossbow.mdl"
SWEP.ViewModelFOV = 45

-- Icons
SWEP.KillIcon = "VGUI/entities/"..CLASSNAME
if (CLIENT) then
    killicon.Add(CLASSNAME, SWEP.KillIcon, Color(255, 255, 255))
    SWEP.WepSelectIcon = surface.GetTextureID("VGUI/entities/weapon_buu_rage_crossbow")
end

-- Holdtype
SWEP.HoldType = "rifle"

-- Primary Fire Mode
SWEP.Primary.Sound           = { Sound("rage/weapons/crossbow/shoot-01.wav"), 
                                 Sound("rage/weapons/crossbow/shoot-02.wav"), 
                                 Sound("rage/weapons/crossbow/shoot-03.wav"), 
                                 Sound("rage/weapons/crossbow/shoot-04.wav"),
                                 Sound("rage/weapons/crossbow/shoot-05.wav") }
SWEP.Primary.Projectile      = "ent_rage_arrow_shot"
SWEP.Primary.ProjectileForce = 50000
SWEP.Primary.Recoil          = 1.5
SWEP.Primary.Cone            = 0.005
SWEP.Primary.ClipSize        = 6
SWEP.Primary.Delay           = 1.3
SWEP.Primary.DefaultClip     = 12
SWEP.Primary.Automatic       = false
SWEP.Primary.Ammo            = "ammo_rage_arrow"
SWEP.Primary.Silenced        = true

-- Secondary Fire Mode
SWEP.Secondary                 = table.Copy(SWEP.Primary)
SWEP.Secondary.Projectile      = "ent_rage_arrow_shot_electric"
SWEP.Secondary.ProjectileForce = 50000
SWEP.Secondary.Recoil          = 1.5
SWEP.Secondary.Cone            = 0.005
SWEP.Secondary.ClipSize        = 3
SWEP.Secondary.Delay           = 1.3
SWEP.Secondary.DefaultClip     = -1
SWEP.Secondary.Automatic       = false
SWEP.Secondary.Ammo            = "ammo_rage_electric"
SWEP.Secondary.Silenced        = true
SWEP.Secondary.BodyGroup       = 1

-- Tertiary Fire Mode
SWEP.Tertiary                 = table.Copy(SWEP.Primary)
SWEP.Tertiary.Projectile      = "ent_rage_arrow_shot_mind"
SWEP.Tertiary.ProjectileForce = 50000
SWEP.Tertiary.Recoil          = 1.5
SWEP.Tertiary.Cone            = 0.005
SWEP.Tertiary.ClipSize        = 3
SWEP.Tertiary.Delay           = 1.3
SWEP.Tertiary.DefaultClip     = -1
SWEP.Tertiary.Automatic       = false
SWEP.Tertiary.Ammo            = "ammo_rage_mindcontrol"
SWEP.Tertiary.Silenced        = true
SWEP.Tertiary.BodyGroup       = 3

-- Quaternary Fire Mode
SWEP.Quaternary                 = table.Copy(SWEP.Primary)
SWEP.Quaternary.Projectile      = "ent_rage_arrow_shot_tnt"
SWEP.Quaternary.ProjectileForce = 50000
SWEP.Quaternary.Recoil          = 1.5
SWEP.Quaternary.Cone            = 0.005
SWEP.Quaternary.ClipSize        = 6
SWEP.Quaternary.Delay           = 1.3
SWEP.Quaternary.DefaultClip     = -1
SWEP.Quaternary.Automatic       = false
SWEP.Quaternary.Ammo            = "ammo_rage_tnt"
SWEP.Quaternary.Silenced        = true
SWEP.Quaternary.BodyGroup       = 2

-- Crosshair settings
SWEP.CrosshairType  = 2

-- Ironsight positions
SWEP.IronSightsPos = Vector(-6.18, -15.679, 1.85)
SWEP.IronSightsAng = Vector(-1.107, -3.274, 3.359)

-- Sprinting/Nearwall positions
SWEP.RunArmPos   = Vector(7.477, 0.128, -7.192)
SWEP.RunArmAngle = Vector(-1.476, 37.224, -19.494)

-- Time for ammo to appear in the mag during reload
SWEP.ReloadAmmoTime = 0.55

-- Magazine model settings
SWEP.MagModel          = "models/weapons/w_rage_crossbow_mag.mdl"
SWEP.MagDropTime       = 0.2
SWEP.MagEmptyBodygroup = 4
SWEP.NoMagBodygroup    = 1

-- Weapon animations
SWEP.DrawAnimEmpty        = ACT_VM_DRAW_EMPTY
SWEP.IdleAnimEmpty        = ACT_VM_IDLE_EMPTY
SWEP.Primary.AnimEmpty    = ACT_VM_PRIMARYATTACK_EMPTY
SWEP.Secondary.AnimEmpty  = ACT_VM_PRIMARYATTACK_EMPTY
SWEP.Tertiary.AnimEmpty   = ACT_VM_PRIMARYATTACK_EMPTY
SWEP.Quaternary.AnimEmpty = ACT_VM_PRIMARYATTACK_EMPTY
SWEP.Secondary.Anim       = ACT_VM_PRIMARYATTACK
SWEP.Tertiary.Anim        = ACT_VM_PRIMARYATTACK
SWEP.Quaternary.Anim      = ACT_VM_PRIMARYATTACK
SWEP.ReloadAnimEmpty      = ACT_VM_RELOAD_EMPTY

-- Disable SWEP base functionality
SWEP.CanSmoke         = false
SWEP.MuzzleEffectS    = ""
SWEP.ThirdPersonShell = ""
SWEP.MuzzleLight      = -1

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
    util.PrecacheSound("RAGE/Weapons/Crossbow/Stringstress.wav")
    util.PrecacheSound("RAGE/Weapons/Crossbow/Reload.wav")
    util.PrecacheSound("RAGE/Weapons/Crossbow/Magout.wav")
    util.PrecacheSound("RAGE/Weapons/Crossbow/Magin.wav")
    util.PrecacheSound("RAGE/Weapons/Crossbow/Magslap.wav")
    util.PrecacheSound("RAGE/Weapons/crossbow/electricloop.wav")
    util.PrecacheModel("models/weapons/w_rage_crossbow_arrow.mdl")
    util.PrecacheModel("models/props/rage/pickup_arrow.mdl")
    util.PrecacheModel("models/props/rage/pickup_electric.mdl")
    util.PrecacheModel("models/props/rage/pickup_mindcontrol.mdl")
    util.PrecacheModel("models/props/rage/pickup_tnt.mdl")
end


/*-----------------------------
    Cleanup
    Fixes anything due to suddenly being removed, like
    looping sounds and viewmodel bone manipulations
    @Param the weapon we're holstering to (if relevant)
-----------------------------*/

function SWEP:Cleanup(holsterto)

    -- Stop the looping sound
    if (self.LoopSound != nil) then
        self.LoopSound:Stop()
        self.LoopSound = nil
    end
    
    -- Stop the electric particles on the viewmodel
    if (self.ElectricParticle != nil) then
        self.ElectricParticle:StopEmissionAndDestroyImmediately()
        self.ElectricParticle = nil
    end
    
    -- Stop the electric particles on the worldmodel
    if (self.ElectricParticleWM != nil) then
        self.ElectricParticleWM:StopEmissionAndDestroyImmediately()
        self.ElectricParticleWM = nil
    end
    
    -- Mark us as currently cleaning up, and call the weapon base's version of this function
    BaseClass.Cleanup(self, holsterto)
end


/*-----------------------------
    Think
    Logic that runs every tick
-----------------------------*/

function SWEP:Think()
    local animtime = self.Owner:GetViewModel():SequenceDuration()
    
    -- If we're using electric bolts, and we have ammo, and the loop sound hasn't started
    if (self.LoopSound == nil && self:Clip1() > 0 && self:GetBuu_FireMode() == 1) then
    
        -- Setup the recipient filters (which only works serverside)
        local filter = nil
        if SERVER then
            filter = RecipientFilter()
            filter:AddAllPlayers()
        end
        
        -- Create the looping sound
        self.LoopSound = CreateSound(self, "RAGE/Weapons/crossbow/electricloop.wav", filter)
        self.LoopSound:Play()
        self.LoopSound:ChangeVolume(0.2)
    elseif ((self:Clip1() <= 0 && self:GetBuu_RAGE_ChangeModeTime() < CurTime()) || (self:GetBuu_FireMode() != 1 && self:GetBuu_Reloading() && (self:GetBuu_RAGE_ChangeModeTime()-CurTime()) < 1)) then
    
        -- Stop the looping sound
        if (self.LoopSound != nil && (game.SinglePlayer() || SERVER || IsFirstTimePredicted())) then
            self.LoopSound:Stop()
            self.LoopSound = nil
        end
    end
    
    -- Network our magazine to other players
    if (SERVER) then
        if (self.Clip1Old == nil || self:Clip1() != self.Clip1Old) then
            net.Start("Buu_RAGE_NetworkClip1Crossbow")
                net.WriteEntity(self)
                net.WriteInt(self:Clip1(), 32)
            net.Broadcast()
            self.Clip1Old = self:Clip1()
        end
    end
    
    -- Call the weapon base's version of this function
    BaseClass.Think(self)
end


/*-----------------------------
    Reload
    Called when the player presses reload.
    Also called during weapon mode switching
-----------------------------*/

function SWEP:Reload()

    -- If we changed weapon mode, but we had a full mag, then change the empty animation to the normal one
    if (self:GetBuu_RAGE_ChangedMode()) then
        if (self:GetBuu_RAGE_OldMag() != 0) then
            self.ReloadAnimEmpty = self.ReloadAnim
        end
    end
    
    -- Call the weapon base's version of this function
    BaseClass.Reload(self)
    
    -- If we're reloading, reset the empty animation
    if (self:GetBuu_RAGE_ChangedMode() && self:GetBuu_Reloading()) then
        self.ReloadAnimEmpty = ACT_VM_RELOAD_EMPTY
    end
end


if (CLIENT) then

    /*-----------------------------
        ViewModelDrawn
        Code that runs after the viewmodel is drawn
    -----------------------------*/

    function SWEP:ViewModelDrawn(vm)
    
        -- If the looping sound is playing, then create electric particles on the viewmodel, otherwise stop the effect immediately
        if (self.LoopSound != nil && self.ElectricParticle == nil) then
            self.ElectricParticle = CreateParticleSystem(vm, "rage_proj_arrow_elec_trail_vm", PATTACH_POINT_FOLLOW, 2)
        elseif (self.LoopSound == nil && self.ElectricParticle != nil) then
            self.ElectricParticle:StopEmissionAndDestroyImmediately()
            self.ElectricParticle = nil
        end
        
        -- Call the weapon base's version of this function
        BaseClass.ViewModelDrawn(self, vm)
    end
    

    /*-----------------------------
        DrawWorldModel
        Draws the worldmodel
    -----------------------------*/

    function SWEP:DrawWorldModel()
    
        -- Set the arrow bodygroup based on the firemode (and if we have ammo)
        if (self:Clip1() == 0) then
            self:SetBodygroup(2, 4)
        else
            self:SetBodygroup(2, self:GetBuu_FireMode())
        end
        if (self:GetBuu_FireMode() == 1 && self:Clip1() != 0) then
            if (self.ElectricParticleWM == nil) then
                self.ElectricParticleWM = CreateParticleSystem(self, "rage_proj_arrow_elec_trail", PATTACH_POINT_FOLLOW, 2)
            end
        elseif (self.ElectricParticleWM != nil) then
            self.ElectricParticleWM:StopEmissionAndDestroyImmediately()
            self.ElectricParticleWM = nil
        end
        
        -- Call the weapon base's version of this function
        BaseClass.DrawWorldModel(self)
    end


    /*-----------------------------
        RAGE_HideWorldModelMag
        Hides the worldmodel mag during reloads
        @Param Whether to hide or not
    -----------------------------*/

    function SWEP:RAGE_HideWorldModelMag(hiding)
        local mode = self:GetFireModeTable()
        if (hiding) then
            self:SetBodygroup(1, 1)
        else
            self:SetBodygroup(1, 0)
        end
    end
    
    
    /*-----------------------------
        Buu_RAGE_NetworkClip1Crossbow
        Receives a player's Crossbow clipsize from the server
    -----------------------------*/

    local function Buu_RAGE_NetworkClip1Crossbow()
        local wep = net.ReadEntity()
        local clip = net.ReadInt(32)
        if (!IsValid(wep) || wep.Owner == LocalPlayer()) then return end
        wep:SetClip1(clip)
    end
    net.Receive("Buu_RAGE_NetworkClip1Crossbow", Buu_RAGE_NetworkClip1Crossbow)
end


if (SERVER) then

    -- Initialize network strings
    util.AddNetworkString("Buu_RAGE_NetworkClip1Crossbow")  
end