/**************************************************************
                    Authority Pulse Cannon
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()
DEFINE_BASECLASS( "weapon_buu_rage_base" )

-- SWEP Info
SWEP.PrintName = "Authority Pulse Cannon"
SWEP.Purpose   = "It costs $150 to fire this weapon for twelve seconds."
SWEP.Category  = "RAGE"

-- Weapon base
SWEP.Base = "weapon_buu_rage_base"

-- Spawning settings
SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

-- Weapon slots
SWEP.Slot    = 4
SWEP.SlotPos = 3

-- Viewmodel/Worldmodel settings
SWEP.ViewModel    = "models/weapons/c_rage_cannon.mdl"
SWEP.WorldModel   = "models/weapons/w_rage_cannon.mdl"
SWEP.ViewModelFOV = 42

-- Icons
SWEP.KillIcon = "VGUI/entities/weapon_buu_rage_cannon"
if (CLIENT) then
    killicon.Add("weapon_buu_rage_cannon", SWEP.KillIcon, Color(255, 255, 255))
    SWEP.WepSelectIcon = surface.GetTextureID(SWEP.KillIcon)
end

-- Holdtype
SWEP.HoldType = "rifle"

-- Primary Fire Mode
SWEP.Primary.Sound            = Sound("rage/weapons/cannon/shoot-01.wav")
SWEP.Primary.SoundChannelSwap = true
SWEP.Primary.Recoil           = 0.6
SWEP.Primary.Damage           = 25
SWEP.Primary.NumShots         = 1
SWEP.Primary.Cone             = 0.04
SWEP.Primary.ClipSize         = 200
SWEP.Primary.Delay            = 0.11
SWEP.Primary.DefaultClip      = 400
SWEP.Primary.Automatic        = true
SWEP.Primary.Ammo             = "ammo_rage_cannon"
SWEP.Primary.BodyGroup        = 0
SWEP.Primary.MagModel         = "models/weapons/w_rage_cannon_mag1.mdl"
SWEP.Primary.Light            = Color(0, 150, 205)

-- Secondary Fire Mode
SWEP.Secondary.Sound           = Sound("rage/weapons/cannon/shoot-bfg.wav")
SWEP.Secondary.Projectile      = "ent_rage_bfg_shot"
SWEP.Secondary.ProjectileForce = 25000
SWEP.Secondary.Recoil          = 2
SWEP.Secondary.ClipSize        = 1
SWEP.Secondary.Delay           = 0.1
SWEP.Secondary.ChargeTime      = 2.93
SWEP.Secondary.DefaultClip     = -1
SWEP.Secondary.Automatic       = true
SWEP.Secondary.Ammo            = "ammo_rage_bfg"
SWEP.Secondary.BodyGroup       = 1
SWEP.Secondary.MagModel        = "models/weapons/w_rage_cannon_mag2.mdl"
SWEP.Secondary.Anim            = ACT_VM_SECONDARYATTACK
SWEP.Secondary.Light           = Color(0, 150, 205)

-- Sprinting/Nearwall positions
SWEP.RunArmPos   = Vector(5.519, 1.228, -1.78)
SWEP.RunArmAngle = Vector(-10.554, 34.167, -20)

-- Time for ammo to appear in the mag during reload
SWEP.ReloadAmmoTime = 0.75

-- Magazine model settings
SWEP.MagModel       = SWEP.Primary.MagModel
SWEP.MagDropTime    = 0.1
SWEP.NoMagBodygroup = 2

-- Disable SWEP Base functionality
SWEP.CanIronsight     = false
SWEP.ThirdPersonShell = ""

-- Effect settings
SWEP.MuzzleEffect = "rage_muzzle_pulse"

-- Don't touch
SWEP.CleaningUp = false


/*-----------------------------
    PrecacheStuff
    Precaches things to prevent lag spikes when
    using the weapon
-----------------------------*/

function SWEP:PrecacheStuff()

    -- Call the weapon base's version of this function
    BaseClass.PrecacheStuff(self)
    
    -- Precache weapon specific stuff
    util.PrecacheSound("RAGE/Weapons/Cannon/Loop.wav")
    util.PrecacheSound("RAGE/Weapons/Cannon/LoopStop.wav")
    util.PrecacheSound("RAGE/Weapons/Cannon/MagOut.wav")
    util.PrecacheSound("RAGE/Weapons/Cannon/MagIn.wav")
    util.PrecacheSound("RAGE/Weapons/Cannon/MagReady.wav")
    util.PrecacheSound("RAGE/Weapons/Cannon/Chargeup.wav")
    util.PrecacheModel("models/weapons/w_rage_cannon_mag2.mdl")
end


/*-----------------------------
    SetupDataTables
    Initializes predicted variables
-----------------------------*/

function SWEP:SetupDataTables()

    -- Authority Pulse Cannon specific variables
    self:NetworkVar("Float", 0, "Buu_RAGE_Deploying")
    self:NetworkVar("Float", 1, "Buu_RAGE_BFGCharge")
    
    -- Call the weapon base's version of this function
    BaseClass.SetupDataTables(self)
end


/*-----------------------------
    Deploy
    Called when the weapon is deployed
    @Return Whether to allow switching away from this weapon
-----------------------------*/

function SWEP:Deploy()

    -- Initialize weapon specific variables
    self.CleaningUp = false
    self:SetBuu_RAGE_Deploying(CurTime()+1)
    
    -- Call the weapon base's version of this function
    return BaseClass.Deploy(self)
end


/*-----------------------------
    PrimaryAttack
    Called when left clicking
-----------------------------*/

function SWEP:PrimaryAttack()

    -- If we're in the first firemode (or we're holding USE), then use the weapon base's primary fire code
    if (self:GetBuu_FireMode() == 0 || (self:GetBuu_RAGE_BFGCharge() == 0 && self.Owner:KeyDown(IN_USE))) then
        BaseClass.PrimaryAttack(self)
    else
        
        -- If we've been charging the BFG and the timer is finished
        if (self:GetBuu_RAGE_BFGCharge() != 0 && self:GetBuu_RAGE_BFGCharge() < CurTime()) then
        
            -- Shoot the projectile
            BaseClass.PrimaryAttack(self)
            self:SetNextPrimaryFire(CurTime()+1)
            
            -- Stop the looping sound
            if (self.LoopSound != nil && (SERVER || IsFirstTimePredicted())) then
                self.LoopSound:Stop()
                self.LoopSound = nil
            end
        end
    end
end


/*-----------------------------
    DoImpactEffect
    Creates effects when the bullet hits something
    @Param  The bullet trace
    @Param  The bullet damage info
    @Return True to override the default effect
-----------------------------*/

local decalmat
if (CLIENT) then
    decalmat = Material(util.DecalMaterial("FadingScorch"))
end
function SWEP:DoImpactEffect(tr, dmgtype)
    if (tr.HitSky) then return end
    
    -- Create pulse hits and and scorches where we hit
    ParticleEffect("rage_eff_pulse_hit", tr.HitPos, tr.HitNormal:Angle())
    if (tr.HitWorld && CLIENT) then
        util.DecalEx(decalmat, tr.Entity, tr.HitPos, tr.HitNormal, Color(255, 255, 255, 255), 0.3, 0.3)
    end
    return true
end


/*-----------------------------
    IsShooting
    Helper function for checking if we're shooting
    @Return Whether we're shooting or not
-----------------------------*/

function SWEP:IsShooting()
    return (self.Owner:KeyDown(IN_ATTACK) && !self.Owner:KeyDown(IN_USE) && self:GetBuu_RAGE_Deploying() < CurTime() && self:Clip1() > 0 && !self:GetBuu_Reloading() && !self:GetBuu_Sprinting() && !self:GetBuu_NearWall() && !self:GetBuu_OnLadder())
end


/*-----------------------------
    Cleanup
    Fixes anything due to suddenly being removed, like
    looping sounds and viewmodel bone manipulations
    @Param the weapon we're holstering to (if relevant)
-----------------------------*/

function SWEP:Cleanup(holsterto)
    if (self.LoopSound != nil) then
        self.LoopSound:Stop()
        self.LoopSound = nil
    end
    
    -- Cleanup viewmodel bone manipulations
    if (CLIENT && IsValid(self.Owner) && IsValid(self.Owner:GetViewModel())) then
        local vm = self.Owner:GetViewModel()
        for i=0, vm:GetBoneCount() do
            vm:ManipulateBoneAngles(i, Angle(0,0,0))
        end
        vm.ManipulatedPulseBarrel = false
    end
    
    -- Mark us as currently cleaning up, and call the weapon base's version of this function
    self.CleaningUp = true
    BaseClass.Cleanup(self, holsterto)
    
    -- Disable cleanup after some time has passed
    timer.Simple(0.1, function() if (IsValid(self)) then self.CleaningUp = false end end)
end


/*-----------------------------
    HandleFireModeChange
    Helper function for extra things to change when the
    fire mode is swapped
    @Param the new weapon mode table
-----------------------------*/

function SWEP:RAGE_FireModeChangeExtra(modetable)

    -- Disable low ammo clicking if we're in BFG mode
    self.CanLowAmmoClick = (self:GetBuu_FireMode() != 1)
end


/*-----------------------------
    Think
    Logic that runs every tick
-----------------------------*/

function SWEP:Think()

    -- If we're shooting
    if (self:IsShooting()) then
    
        -- And the loop sound hasn't been initialized
        if (self.LoopSound == nil && (SERVER || IsFirstTimePredicted() || game.SinglePlayer())) then
        
            -- Setup the recipient filters (which only works serverside)
            local filter = nil
            if SERVER then
                filter = RecipientFilter()
                filter:AddAllPlayers()
            end
            
            -- Play the loop sound based on which weapon mode's selected
            if (self:GetBuu_FireMode() == 0) then
                self.LoopSound = CreateSound(self, "RAGE/Weapons/Cannon/Loop.wav", filter)
                self.LoopSound:Play()
                self.LoopSound:ChangePitch(95)
            else
                self.LoopSound = CreateSound(self, "RAGE/Weapons/Cannon/LoopBFG.wav", filter)
                self.LoopSound:Play()
            end
        end
        
        -- If we're in the BFG fire mode
        if (self:GetBuu_FireMode() == 1) then
        
            -- And we haven't started charging, do so
            if (self:Clip1() > 0 && self:GetNextPrimaryFire() < CurTime() && self:GetBuu_RAGE_BFGCharge() == 0) then
                self:SetBuu_RAGE_BFGCharge(CurTime()+self.Secondary.ChargeTime)
                self:SendWeaponAnim(ACT_VM_PULLBACK)
            end
        end
    else
    
        -- If the loop sound is currently playing
        if (self.LoopSound != nil && (SERVER || IsFirstTimePredicted())) then
        
            -- Stop it
            self.LoopSound:Stop()
            self.LoopSound = nil
            
            -- If we're in the first firemode, or we're trying to shoot while out of ammo, play the stop sound
            if (self:GetBuu_FireMode() == 0 || self:Clip1() > 0) then
                self:EmitSound("RAGE/Weapons/Cannon/LoopStop.wav")
                self:SetNextPrimaryFire(CurTime()+1)
            end
        end
        
        -- If we just fired a BFG shot, then play the firing animation and reset the timer
        if (self:GetBuu_RAGE_BFGCharge() != 0) then
            if (self:GetBuu_RAGE_BFGCharge() > CurTime()) then
                self:SendWeaponAnim(ACT_VM_DRYFIRE)
            end
            self:SetBuu_RAGE_BFGCharge(0)
        end
    end
    
    -- Network our magazine to other players if we're in BFG mode 
    if (SERVER) then
        if (self:GetBuu_FireMode() == 1 && (self.Clip1Old == nil || self:Clip1() != self.Clip1Old)) then
            net.Start("Buu_RAGE_NetworkClip1BFG")
                net.WriteEntity(self)
                net.WriteInt(self:Clip1(), 32)
            net.Broadcast()
            self.Clip1Old = self:Clip1()
        end
    end
    
    -- Call the weapon base's version of this function
    BaseClass.Think(self)
end


if (CLIENT) then

    /*-----------------------------
        Buu_RAGE_PulseCannonBarrel
        Manipulates the viewmodel's barrel when shooting
        @Param The viewmodel
        @Param The player
        @Param The weapon
    -----------------------------*/

    local function Buu_RAGE_PulseCannonBarrel(vm, ply, wep)
        if (wep:GetClass() == "weapon_buu_rage_cannon" && !wep.CleaningUp) then
        
            -- Initialize all the variables
            if (wep.BoneAccel == nil) then
                wep.BoneAccel = 0
            end
            if (wep.BoneAngle == nil) then
                wep.BoneAngle = 0
            end
            if (wep.BoneDown == nil) then
                wep.BoneDown = 0
            end
            if (vm.ManipulatedPulseBarrel == nil) then
                vm.ManipulatedPulseBarrel = false
            end
            
            -- If we're not paused
            if (!game.SinglePlayer() || !gui.IsGameUIVisible()) then
            
                -- If we're shooting
                if (wep:IsShooting()) then
                
                    -- Accelerate the barrel and knob
                    wep.BoneAccel = math.Clamp(wep.BoneAccel+FrameTime()*10, 0, 7)
                    wep.BoneDown = math.Clamp(wep.BoneDown+FrameTime(), 0, 1)
                    
                    -- Create the BFG particle if we're in BFG fire mode
                    if (wep:GetBuu_FireMode() == 1 && wep.BFGParticle == nil && wep:Clip1() > 0) then
                        wep.BFGParticle = CreateParticleSystem(vm, "rage_proj_bfg_sphere_vm", PATTACH_POINT_FOLLOW, 1)
                    end
                else
                
                    -- Decelerate the barrel/knob
                    wep.BoneAccel = Lerp(FrameTime()*2, wep.BoneAccel, 0)
                    wep.BoneDown = Lerp(FrameTime()*2, wep.BoneDown, 0)
                    
                    -- If the BFG effect is happening
                    if (wep.BFGParticle != nil) then
                    
                        -- If we fired it, then stop the particle effect immediately, otherwise slowly let it die
                        if (wep:Clip1() == 0) then
                            wep.BFGParticle:StopEmissionAndDestroyImmediately()
                        else
                            wep.BFGParticle:StopEmission()
                        end
                        wep.BFGParticle = nil
                    end
                end
                
                -- Set the barrel bone angle to the new angles
                wep.BoneAngle = (wep.BoneAngle+wep.BoneAccel*FrameTime()*70)%240
                
                -- If we fired the BFG blast, then stop the particle effect immediately
                if (wep.BFGParticle != nil && wep:Clip1() == 0) then
                    wep.BFGParticle:StopEmissionAndDestroyImmediately()
                    wep.BFGParticle = nil
                end
                
                -- Manipulate the bone angles
                vm:ManipulateBoneAngles(vm:LookupBone("Barrel"), Angle(wep.BoneAngle,0,0))
                if (wep:GetBuu_FireMode() == 0) then
                    vm:ManipulateBoneAngles(vm:LookupBone("Knob"), Angle(wep.BoneAngle,0,0))
                    vm:ManipulateBonePosition(vm:LookupBone("Knob"), Vector(0,0,wep.BoneDown))
                end
            end
            
            -- Mark the bone angles as manipulated
            vm.ManipulatedPulseBarrel = true
        elseif (vm.ManipulatedPulseBarrel) then
        
            -- Reset all the bone angles
            for i=0, vm:GetBoneCount() do
                vm:ManipulateBoneAngles(i, Angle(0,0,0))
            end
            vm.ManipulatedPulseBarrel = false
        end
    end
    hook.Add("PreDrawViewModel", "Buu_RAGE_PulseCannonBarrel", Buu_RAGE_PulseCannonBarrel)


    /*-----------------------------
        DrawWorldModel
        Draws the worldmodel
    -----------------------------*/

    function SWEP:DrawWorldModel()
    
        -- Set the mag model based on what firemode we have
        if (self:Clip1() == 0) then
            self:SetBodygroup(2, 4)
        else
            self:SetBodygroup(2, self:GetBuu_FireMode())
        end
        
        -- If we're using the BFG
        if (self:GetBuu_RAGE_BFGCharge() != 0) then
        
            -- Attach the particle to the worldmodel
            if (self.BFGParticleWM == nil) then
                self.BFGParticleWM = CreateParticleSystem(self, "rage_proj_bfg_sphere_vm", PATTACH_POINT_FOLLOW, 1)
            end
        elseif (self.BFGParticleWM != nil) then
        
            -- If we fired it, then stop the particle effect immediately, otherwise slowly let it die
            if (self:Clip1() == 0) then
                self.BFGParticleWM:StopEmissionAndDestroyImmediately()
            else
                self.BFGParticleWM:StopEmission()
            end
            self.BFGParticleWM = nil
        end
        
        -- Call the weapon base's version of this function
        BaseClass.DrawWorldModel(self)
    end
    
    
    /*-----------------------------
        Buu_RAGE_NetworkClip1BFG
        Receives a player's BFG clipsize from the server
    -----------------------------*/

    local function Buu_RAGE_NetworkClip1BFG()
        local wep = net.ReadEntity()
        local clip = net.ReadInt(32)
        if (!IsValid(wep) || wep.Owner == LocalPlayer()) then return end
        wep:SetClip1(clip)
    end
    net.Receive("Buu_RAGE_NetworkClip1BFG", Buu_RAGE_NetworkClip1BFG)
end


if (SERVER) then

    -- Initialize network strings
    util.AddNetworkString("Buu_RAGE_NetworkClip1BFG")  
end