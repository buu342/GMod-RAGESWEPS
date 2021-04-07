/**************************************************************
                            Nailgun
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()
DEFINE_BASECLASS( "weapon_buu_rage_base" )

-- SWEP Info
SWEP.PrintName = "Nailgun"
SWEP.Purpose   = "As seen on Penn & Teller, though a little more deadly."
SWEP.Category  = "RAGE"

-- Weapon base
SWEP.Base = "weapon_buu_rage_base"

-- Spawning settings
SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

-- Weapon slots
SWEP.Slot    = 2
SWEP.SlotPos = 3

-- Viewmodel/Worldmodel settings
SWEP.ViewModel    = "models/weapons/c_rage_nailgun.mdl"
SWEP.WorldModel   = "models/weapons/w_rage_nailgun.mdl"
SWEP.ViewModelFOV = 42

-- Icons
SWEP.KillIcon = "VGUI/entities/weapon_buu_rage_nailgun"
if (CLIENT) then
    killicon.Add("weapon_buu_rage_nailgun", SWEP.KillIcon, Color(255, 255, 255))
    SWEP.WepSelectIcon = surface.GetTextureID(SWEP.KillIcon)
end

-- Holdtype
SWEP.HoldType = "rifle"

-- Primary Fire Mode
SWEP.Primary.Sound              = Sound("rage/weapons/nailgun/nailgun.wav")
SWEP.Primary.SoundChannelSwap   = true
SWEP.Primary.Recoil             = 0.5
SWEP.Primary.Damage             = 8
SWEP.Primary.NumShots           = 1
SWEP.Primary.Cone               = 0.03
SWEP.Primary.ClipSize           = 100
SWEP.Primary.Delay              = 0.07
SWEP.Primary.DefaultClip        = 200
SWEP.Primary.Automatic          = true
SWEP.Primary.Ammo               = "ammo_rage_nails"
SWEP.Primary.MagModel           = "models/weapons/w_rage_nailgun_mag.mdl"
SWEP.Primary.Muzzle             = "rage_muzzle_nailgun"
SWEP.Primary.Light              = Color(255, 255, 255)

-- Secondary Fire Mode
SWEP.Secondary                    = table.Copy(SWEP.Primary)
SWEP.Secondary.Sound              = { Sound("rage/weapons/nailgun/rebar-01.wav"),
                                      Sound("rage/weapons/nailgun/rebar-02.wav"),
                                      Sound("rage/weapons/nailgun/rebar-03.wav"),
                                      Sound("rage/weapons/nailgun/rebar-04.wav"),
                                      Sound("rage/weapons/nailgun/rebar-05.wav") }
SWEP.Secondary.Projectile         = "ent_rage_rebar_shot"
SWEP.Secondary.ProjectileForce    = 50000
SWEP.Secondary.Cone               = 0.001
SWEP.Secondary.Delay              = 1
SWEP.Secondary.ClipSize           = 1
SWEP.Secondary.DefaultClip        = -1
SWEP.Secondary.BodyGroup          = 1
SWEP.Secondary.Ammo               = "ammo_rage_rebar"
SWEP.Secondary.Muzzle             = -1
SWEP.Secondary.Light              = -1

-- Tertiary Fire Mode
SWEP.Tertiary               = table.Copy(SWEP.Primary)
SWEP.Tertiary.Sound         = Sound("rage/weapons/nailgun/railgun.wav")
SWEP.Tertiary.Damage        = 150
SWEP.Tertiary.Cone          = 0.001
SWEP.Tertiary.Recoil        = 1.3
SWEP.Tertiary.Delay         = 2
SWEP.Tertiary.ClipSize      = 1
SWEP.Tertiary.DefaultClip   = -1
SWEP.Tertiary.Ammo          = "ammo_rage_rail"
SWEP.Tertiary.BodyGroup     = 2
SWEP.Tertiary.Muzzle        = "rage_muzzle_nailgun_rail"
SWEP.Tertiary.Light         = Color(0, 255, 100)
SWEP.Tertiary.Tracer        = "fx_rage_railtracer"

-- Ironsight settings
SWEP.IronsightVMFOV = 1.20

-- Scope settings
SWEP.Sniper        = false -- Disabled by default since the firemode will enable it
SWEP.AllowBreath   = false
SWEP.AutoSniper    = true
SWEP.ScopeScale    = 0.65
SWEP.SniperTexture = "scope/rage_scope_railgun"

-- Bullet penetration
SWEP.CanPenetrate           = false
SWEP.PenetrateCount         = 3
SWEP.PenetrateMax           = 48
SWEP.PenetrateDamageFalloff = 0.7

-- Ironsight positions
SWEP.Primary.IronSightsPos        = Vector(-7.401, -7.141, 1.24)
SWEP.Primary.IronSightsAng        = Vector(-1.201, -7.746, 0)
SWEP.Primary.IronSightsShootPos   = Vector(-6.962, -10.419, 1.22)
SWEP.Primary.IronSightsShootAng   = Vector(-1.343, -7.749, 0)
SWEP.Secondary.IronSightsPos      = Vector(-7.401, -7.141, 1.24)
SWEP.Secondary.IronSightsAng      = Vector(-1.5, -7.746, 0)
SWEP.Secondary.IronSightsShootPos = Vector(-6.962, -10.419, 1.22)
SWEP.Secondary.IronSightsShootAng = Vector(-1.343, -7.749, 0)
SWEP.Tertiary.IronSightsPos       = Vector(-5.24, -4.963, 2.16)
SWEP.Tertiary.IronSightsAng       = Vector(-1.0, -4.941, 0)
SWEP.IronSightsPos                = SWEP.Primary.IronSightsPos
SWEP.IronSightsAng                = SWEP.Primary.IronSightsAng
SWEP.IronSightsShootPos           = SWEP.Primary.IronSightsShootPos
SWEP.IronSightsShootAng           = SWEP.Primary.IronSightsShootAng

-- Sprinting/Nearwall positions
SWEP.RunArmPos   = Vector(5.519, 1.228, -1.78)
SWEP.RunArmAngle = Vector(-10.554, 34.167, -20)

-- Time for ammo to appear in the mag during reload
SWEP.ReloadAmmoTime = 0.5

-- Magazine model settings
SWEP.MagModel       = "models/weapons/w_rage_nailgun_mag.mdl"
SWEP.MagDropTime    = 0.2
SWEP.NoMagBodygroup = 2

-- Weapon animations
SWEP.DrawAnimEmpty      = ACT_VM_DRAW_EMPTY
SWEP.IdleAnimEmpty      = ACT_VM_IDLE_EMPTY
SWEP.ModeAnim           = ACT_VM_RELOAD_INSERT
SWEP.ModeAnimEmpty      = ACT_VM_RELOAD_INSERT_EMPTY
SWEP.Primary.Anim       = ACT_VM_PRIMARYATTACK_1
SWEP.Primary.AnimIron   = ACT_VM_PRIMARYATTACK_DEPLOYED_1
SWEP.Secondary.Anim     = ACT_VM_PRIMARYATTACK_2
SWEP.Secondary.AnimIron = ACT_VM_PRIMARYATTACK_DEPLOYED_2
SWEP.Tertiary.Anim      = ACT_VM_PRIMARYATTACK_3
SWEP.Tertiary.AnimIron  = ACT_VM_PRIMARYATTACK_3

-- Viewmodel bodygroup settings
SWEP.VMBGSwapTime = 2.28 

-- Disable SWEP base functionality
SWEP.ThirdPersonShell = ""

-- Coil cooldown effect time duration
SWEP.CoilCooldownTime = 0.3

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
    util.PrecacheSound("RAGE/Weapons/NailGun/Coil.wav")
    util.PrecacheSound("RAGE/Weapons/NailGun/Magout.wav")
    util.PrecacheSound("RAGE/Weapons/NailGun/Magin.wav")
    util.PrecacheSound("RAGE/Weapons/NailGun/Reload.wav")
    util.PrecacheSound("RAGE/Weapons/NailGun/Load.wav")
    util.PrecacheSound("RAGE/Weapons/NailGun/ModOut.wav")
    util.PrecacheSound("RAGE/Weapons/NailGun/ModIn.wav")
    util.PrecacheSound("RAGE/Weapons/NailGun/Move.wav")
    util.PrecacheModel("models/weapons/w_rage_nailgun_rebar.mdl")
    util.PrecacheModel("models/weapons/c_rage_nailgun_coilglow.mdl")
end


/*-----------------------------
    Deploy
    Called when the weapon is deployed
    @Return Whether to allow switching away from this weapon
-----------------------------*/

function SWEP:Deploy()

    -- Initialize weapon specific variables
    self.CleaningUp = false
    
    -- Call the weapon base's version of this function
    return BaseClass.Deploy(self)
end


/*-----------------------------
    Reload
    Called when the player presses reload.
    Also called during weapon mode switching
-----------------------------*/

function SWEP:Reload()

    -- No reloading in railgun mode
    if (self:GetBuu_FireMode() == 2 && !self:GetBuu_RAGE_ChangedMode()) then return end
    
    -- If the player changed the firemode
    if (self:GetBuu_RAGE_ChangedMode()) then
        
        -- Then play the mode swapping animation, depending on whether we were in rebar mode and had ammo
        if (self:GetBuu_RAGE_OldMode() == 1 && self:GetBuu_RAGE_OldMag() == 0) then
            self.ReloadAnim = self.ModeAnimEmpty
        else
            self.ReloadAnim = self.ModeAnim
        end
    end
    
    -- If we are in rebar firemode, and we didn't change the firemode, then use the empty animation as the reload one
    if (self:GetBuu_FireMode() == 1 && !self:GetBuu_RAGE_ChangedMode()) then
        self.ReloadAnim = ACT_VM_RELOAD_EMPTY
    end
    
    -- Call the weapon base's version of this function
    BaseClass.Reload(self)
    
    -- Reset the reload animation
    if (self:GetBuu_RAGE_ChangedMode() || (self:GetBuu_FireMode() == 1 && self:GetBuu_Reloading())) then
        self.ReloadAnim = ACT_VM_RELOAD
    end
end

/*-----------------------------
    Cleanup
    Fixes anything due to suddenly being removed, like
    looping sounds and viewmodel bone manipulations
    @Param the weapon we're holstering to (if relevant)
-----------------------------*/

function SWEP:Cleanup(holsterto)

    -- Cleanup viewmodel bone manipulations
    if (CLIENT && IsValid(self.Owner) && IsValid(self.Owner:GetViewModel())) then
        local vm = self.Owner:GetViewModel()
        
        -- Reset all the bone angles
        for i=0, vm:GetBoneCount() do
            vm:ManipulateBoneAngles(i, Angle(0,0,0))
        end
        vm.ManipulatedNailGunCoil = false
        
        -- Delete the coil model
        if (vm.CoilModel != nil) then
            vm.CoilModel:Remove()
            vm.CoilModel = nil
        end
    end
    
    -- Mark us as currently cleaning up, and call the weapon base's version of this function
    self.CleaningUp = true
    BaseClass.Cleanup(self, holsterto)
    
    -- Disable cleanup after some time has passed
    timer.Simple(0.1, function() if (IsValid(self)) then self.CleaningUp = false end end)
end


/*-----------------------------
    Think
    Logic that runs every tick
-----------------------------*/

function SWEP:Think()

    -- Automatically put ammo in the clip in Railgun firemode
    if (self:GetBuu_FireMode() == 2 && self:Clip1() == 0 && !self:GetBuu_RAGE_ChangedMode() && self.Owner:GetAmmoCount(self.Tertiary.Ammo) > 0 && self:GetNextPrimaryFire() < CurTime()) then
        self:SetClip1(1)
        self.Owner:RemoveAmmo(1, self.Tertiary.Ammo)
    end
    
    -- Network our clip to other players if we're in rebar mode
    if (SERVER) then
        if (self:GetBuu_FireMode() == 1 && (self.Clip1Old == nil || self:Clip1() != self.Clip1Old)) then
            net.Start("Buu_RAGE_NetworkClip1RebarGun")
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
    HandleFireModeChange
    Helper function for extra things to change when the
    fire mode is swapped
    @Param the new weapon mode table
-----------------------------*/

function SWEP:RAGE_FireModeChangeExtra(modetable)
    local IsRail = (self:GetBuu_FireMode() == 2)
    
    -- Change the ironsights based on our new firemode
    self.IronSightsPos = modetable.IronSightsPos
    self.IronSightsAng = modetable.IronSightsAng
    self.IronSightsShootPos = modetable.IronSightsShootPos
    self.IronSightsShootAng = modetable.IronSightsShootAng
    
    -- Change SWEP base functionality based on our firemode
    self.CanLowAmmoClick = (self:GetBuu_FireMode() == 0)
    self.CanSmoke = (self:GetBuu_FireMode() != 1)
    if (self:GetBuu_FireMode() == 0) then
        self.CrosshairType  = 1
    else
        self.CrosshairType  = 2
    end
    
    -- If we're using the rail mode, change different things about our weapon
    self.PlayFullIronAnim = IsRail
    self.IronsightRoll = !IsRail
    self.Sniper = IsRail
    self.CanPenetrate = IsRail
    
    -- If we're using rail mode, enable ironsight animations
    if (IsRail) then
        self.IronsightInAnim  = ACT_VM_IDLE_TO_LOWERED
        self.IronsightOutAnim = ACT_VM_LOWERED_TO_IDLE
    else
        self.IronsightInAnim  = nil
        self.IronsightOutAnim = nil
    end
end


/*-----------------------------
    HandleMagDropping
    Handles magazine dropping networking
-----------------------------*/

function SWEP:HandleMagDropping()
    
    -- Only drop magazines if we're in nailgun mode
    if (self:GetBuu_FireMode() != 0) then return end
    
    -- Call the weapon base's version of this function
    BaseClass.HandleMagDropping(self)
end


if (CLIENT) then

    /*-----------------------------
        RAGE_HideWorldModelMag
        Hides the worldmodel mag during reloads
        @Param Whether to hide or not
    -----------------------------*/

    function SWEP:RAGE_HideWorldModelMag(hiding)

        -- Only hide the magazine worldmodel if we're in nailgun mode
        if (self:GetBuu_FireMode() == 0) then
            local mode = self:GetFireModeTable()
            if (hiding) then
                self:SetBodygroup(1, 1)
            else
                self:SetBodygroup(1, 0)
            end
        else
            self:SetBodygroup(1, 1)
        end
    end


    /*-----------------------------
        DrawWorldModel
        Draws the worldmodel
    -----------------------------*/

    function SWEP:DrawWorldModel()

        -- Change the bodygroup based on our firemode
        self:SetBodygroup(2, self:GetBuu_FireMode())
        
        -- Hide the rebar if we've got no ammo
        if (self:GetBuu_FireMode() == 1 && self:Clip1() > 0) then
            self:SetBodygroup(3, 0)
        else
            self:SetBodygroup(3, 1)
        end
        
        -- Call the weapon base's version of this function
        BaseClass.DrawWorldModel(self)
    end
    
    /*-----------------------------
        Buu_RAGE_NetworkClip1RebarGun
        Receives a player's rebargun clipsize from the server
    -----------------------------*/

    local function Buu_RAGE_NetworkClip1RebarGun()
        local wep = net.ReadEntity()
        local clip = net.ReadInt(32)
        if (!IsValid(wep) || wep.Owner == LocalPlayer()) then return end
        wep:SetClip1(clip)
    end
    net.Receive("Buu_RAGE_NetworkClip1RebarGun", Buu_RAGE_NetworkClip1RebarGun)
    
    
    /*-----------------------------
        PreDrawScope
        Allows extra stuff before drawing the scope
    -----------------------------*/

    -- Initialize some static global variables
    local scrwh = ScrW()/2
    local scrhh = ScrH()/2
    local CrosshairTexture1 = "scope/rage_scope_railgun_aim1"
    local CrosshairTexture2 = "scope/rage_scope_railgun_aim2"
    local LoadTexture1 = "scope/rage_scope_railgun_load1"
    local LoadTexture2 = "scope/rage_scope_railgun_load2"
    local ReadyTexture1 = "scope/rage_scope_railgun_ready1"
    local ReadyTexture2 = "scope/rage_scope_railgun_ready2"
    surface.CreateFont("RAGE_RailGunFont", {
        font = "idGinza Narrow Medium",
        extended = false,
        size = 30*ScrH()/900,
        weight = 500,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        underline = false,
        italic = false,
        strikeout = false,
        symbol = false,
        rotary = false,
        shadow = false,
        additive = false,
        outline = false,
    })  
    function SWEP:PreDrawScope()
        local wratio = self.LensTable.w/1171
        local hratio = self.LensTable.h/1171
        local ammoc = self.Owner:GetAmmoCount(self.Tertiary.Ammo)+self:Clip1()
        
        -- Tint everything green
        surface.SetDrawColor(100, 205, 0, 51)
        surface.DrawRect(0, 0, ScrW(), ScrH())
        
        -- Dot sight
        surface.SetDrawColor(255, 255, 255, 150-math.cos(CurTime()*40)*30)
        surface.SetTexture(surface.GetTextureID(CrosshairTexture1))
        surface.DrawTexturedRectUV(scrwh-13*hratio, scrhh-13, 26*hratio, 26*hratio, 0, 0, 1, 1)
        
        -- Dot box
        surface.SetDrawColor(255, 255, 255, 70)
        surface.SetTexture(surface.GetTextureID(CrosshairTexture2))
        surface.DrawTexturedRectUV(scrwh-35*hratio, scrhh-17*hratio, 67*hratio, 37*hratio, 0, 0, 1, 1)
    end
    
    
    /*-----------------------------
        PostDrawScope
        Allows extra stuff after drawing the scope
    -----------------------------*/
    
    function SWEP:PostDrawScope()
        local wratio = self.LensTable.w/1171
        local hratio = self.LensTable.h/1171
        local loadsizew = 202*hratio
        local loadsizeh = 22*hratio
        local loadsizex1 = scrwh-150*hratio
        local loadsizex2 = scrwh+150*hratio
        local loadsizey = scrhh-10
        local firetime = (self:GetNextPrimaryFire()-CurTime())/self.Tertiary.Delay
        local loadtime = math.max(0, firetime)
        local loadtimem = 1-loadtime
        local ready1x1 = loadsizex1-9*hratio
        local ready1x2 = loadsizex2+9*hratio-27*hratio
        local ready1y  = scrhh-42*hratio
        local ready2x1 = loadsizex1+5*hratio
        local ready2x2 = ready1x2-5*hratio-55*hratio
        local ready2y  = scrhh-66*hratio
        local ammoc = self.Owner:GetAmmoCount(self.Tertiary.Ammo)+self:Clip1()
        
        -- Cooldown back
        surface.SetDrawColor(255, 255, 255, 200)
        surface.SetTexture(surface.GetTextureID(LoadTexture1))
        surface.DrawTexturedRectUV(loadsizex1-loadsizew, loadsizey, loadsizew, loadsizeh, 0, 0, 1, 1)
        surface.DrawTexturedRectUV(loadsizex2, loadsizey, loadsizew, loadsizeh, 1, 0, 0, 1)
        
        -- Cooldown front
        if (ammoc > 0) then
            surface.SetDrawColor(255, 255, 255, 200)
            surface.SetTexture(surface.GetTextureID(LoadTexture2))
            surface.DrawTexturedRectUV(loadsizex1-loadsizew, loadsizey, loadsizew*loadtimem, loadsizeh, 0, 0, loadtimem, 1)
            surface.DrawTexturedRectUV(loadsizex2+loadsizew*loadtime, loadsizey, loadsizew*loadtimem, loadsizeh, loadtimem, 0, 0, 1)
        end
        
        -- Ready texture 1
        if (firetime > -0.05 || ammoc < 1) then
            local alpham = math.min(firetime*20, 0)
            if (ammoc < 1) then
                alpham = 0
            end
            surface.SetDrawColor(255, 255, 255, 50+50*alpham)
            surface.SetTexture(surface.GetTextureID(ReadyTexture1))
            surface.DrawTexturedRectUV(ready1x1, ready1y, 27*hratio, 90*hratio, 0, 0, 1, 1)
            surface.DrawTexturedRectUV(ready1x2, ready1y, 27*hratio, 90*hratio, 1, 0, 0, 1)
        end
        
        -- Ready texture 2
        if (ammoc > 0) then
            if (loadtime == 0) then
                surface.SetDrawColor(255, 255, 255, 150-150*math.sin(math.max(firetime*100, -math.pi*5)))
                surface.SetTexture(surface.GetTextureID(ReadyTexture2))
                surface.DrawTexturedRectUV(ready2x1, ready2y, 75*hratio, 133*hratio, 1, 0, 0, 1)
                surface.DrawTexturedRectUV(ready2x2, ready2y, 75*hratio, 133*hratio, 0, 0, 1, 1)       
            else
                -- CHARGNING text
                local text = "CHARGING"
                surface.SetTextColor(187, 245, 139, 200-150*math.sin(CurTime()*50))
                surface.SetFont("RAGE_RailGunFont")
                local tw, th = surface.GetTextSize(text)
                surface.SetTextPos(scrwh-tw/2, scrhh+40*hratio)
                surface.DrawText(text)
            end
        end
    end
    
    
    /*-----------------------------
        Buu_RAGE_NailGunVMPre
        Manipulates the viewmodel's coil when shooting
        @Param The viewmodel
        @Param The player
        @Param The weapon
    -----------------------------*/

    local function Buu_RAGE_NailGunVMPre(vm, ply, wep)
        if (wep:GetClass() == "weapon_buu_rage_nailgun") then
        
            -- Initialize all the variables
            if (wep.BoneAccel == nil) then
                wep.BoneAccel = 0
            end
            if (wep.BoneAngle == nil) then
                wep.BoneAngle = 0
            end
            if (vm.ManipulatedNailGunCoil == nil) then
                vm.ManipulatedNailGunCoil = false
            end
            
            -- If the game isn't paused
            if (!game.SinglePlayer() || !gui.IsGameUIVisible()) then
            
                -- Handle bone acceleration
                if (wep:GetBuu_FireTime()+wep.CoilCooldownTime > CurTime()) then
                    wep.BoneAccel = -10
                else
                    wep.BoneAccel = Lerp(FrameTime()*3, wep.BoneAccel, 0)
                end
                wep.BoneAngle = (wep.BoneAngle+wep.BoneAccel*FrameTime()*70)
                
                -- Manipulate the bone angles
                vm:ManipulateBoneAngles(vm:LookupBone("Coil"), Angle(wep.BoneAngle,0,0))
            end
            vm.ManipulatedNailGunCoil = true
        elseif (vm.ManipulatedNailGunCoil) then
        
            -- Reset all the bone angles
            for i=0, vm:GetBoneCount() do
                vm:ManipulateBoneAngles(i, Angle(0,0,0))
            end
            vm.ManipulatedNailGunCoil = false
        end
    end
    hook.Add("PreDrawViewModel", "Buu_RAGE_NailGunVMPre", Buu_RAGE_NailGunVMPre)


    /*-----------------------------
        Buu_RAGE_NailGunVMPost
        Manipulates the viewmodel's coil when shooting
        @Param The viewmodel
        @Param The player
        @Param The weapon
    -----------------------------*/

    local function Buu_RAGE_NailGunVMPost(vm, ply, wep)
    
        -- If we're using the nailgun in rail mode
        if (wep:GetClass() == "weapon_buu_rage_nailgun" && wep:GetBuu_FireMode() == 2 && wep:GetBuu_RAGE_ChangeModeTime() < CurTime()) then
        
            -- If we just fired the railgun
            local time = wep:GetBuu_FireTime()+wep.CoilCooldownTime*5
            if (time > CurTime()) then
            
                -- If the coil glow model doesn't exist, create it
                if (vm.CoilModel == nil) then
                    vm.CoilModel = ClientsideModel("models/weapons/c_rage_nailgun_coilglow.mdl", RENDERGROUP_TRANSLUCENT)
                    vm.CoilModel:SetPos(vm:GetPos())
                    vm.CoilModel:SetAngles(vm:GetAngles())
                    vm.CoilModel:SetParent(vm)
                    vm.CoilModel:AddEffects(EF_BONEMERGE)
                end
                
                -- Make the coil glow fade out
                render.SetBlend((time-CurTime())/(wep.CoilCooldownTime*5))
                vm.CoilModel:DrawModel()
                render.SetBlend(1)
            elseif (vm.CoilModel != nil) then
            
                -- Remove the coil model if it's already cool
                vm.CoilModel:Remove()
                vm.CoilModel = nil
            end
        elseif (vm.CoilModel != nil) then
        
            -- Remove the coil model if we're not using the nailgun
            vm.CoilModel:Remove()
            vm.CoilModel = nil
        end
    end
    hook.Add("PostDrawViewModel", "Buu_RAGE_NailGunVMPost", Buu_RAGE_NailGunVMPost)
    
    
    /*-----------------------------
        Buu_RAGE_NailGunWallhack
        Draws halos around things behind walls when scoped with the railgun
    -----------------------------*/
    
    local wallhack = {}
    local nextchecktime = 0
    function Buu_RAGE_NailGunWallhack()
    
        -- If we're using the nailgun
        if (IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() == "weapon_buu_rage_nailgun") then
        
            -- And we're scoped
            if (LocalPlayer():GetActiveWeapon():IsScoped()) then
            
                -- Find all the players and NPCs around us every half a second
                if (nextchecktime < CurTime()) then
                    nextchecktime = CurTime()+0.5
                    wallhack = {}
                    local c = 1
                    for k, v in ipairs(ents.FindInSphere(LocalPlayer():GetPos(), 5120)) do
                        if (v:IsNPC() || (v:IsPlayer() && v:Alive())) then
                            wallhack[c] = v
                            c = c+1
                        end
                    end
                end
                
                -- Draw a red halo on them
                halo.Add(wallhack, Color(255, 0, 0, 255), 5, 5, 1, true, true)
            end
        end
    end
    hook.Add( "PreDrawHalos", "Buu_RAGE_NailGunWallhack", Buu_RAGE_NailGunWallhack)
end


if (SERVER) then

    -- Initialize network strings
    util.AddNetworkString("Buu_RAGE_NetworkClip1RebarGun")
end