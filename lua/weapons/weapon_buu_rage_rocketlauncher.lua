/**************************************************************
                        Rocket Launcher
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()
DEFINE_BASECLASS( "weapon_buu_rage_base" )

-- SWEP Info
SWEP.PrintName = "Rocket Launcher"
SWEP.Purpose   = "When it, and everything in the surrounding area, absolutely needs to die."
SWEP.Category  = "RAGE"

-- Weapon base
SWEP.Base = "weapon_buu_rage_base"

-- Spawning settings
SWEP.Spawnable      = true
SWEP.AdminSpawnable = true

-- Weapon slots
SWEP.Slot    = 4
SWEP.SlotPos = 0

-- Viewmodel/Worldmodel settings
SWEP.ViewModel    = "models/weapons/c_rage_rocketlauncher.mdl"
SWEP.WorldModel   = "models/weapons/w_rage_rocketlauncher.mdl"
SWEP.ViewModelFOV = 45

-- Icons
SWEP.KillIcon = "VGUI/entities/weapon_buu_rage_rocketlauncher"
if (CLIENT) then
    killicon.Add("weapon_buu_rage_rocketlauncher", SWEP.KillIcon, Color(255, 255, 255))
    SWEP.WepSelectIcon = surface.GetTextureID(SWEP.KillIcon)
end

-- Holdtype
SWEP.HoldType = "rifle"

-- Primary Fire Mode
SWEP.Primary.Sound           = { Sound("rage/weapons/rocketlauncher/shoot-01.wav"), 
                                 Sound("rage/weapons/rocketlauncher/shoot-02.wav"), 
                                 Sound("rage/weapons/rocketlauncher/shoot-03.wav"), 
                                 Sound("rage/weapons/rocketlauncher/shoot-04.wav") }
SWEP.Primary.Projectile      = "ent_rage_rocket_shot"
SWEP.Primary.ProjectileForce = 50000
SWEP.Primary.Recoil          = 4
SWEP.Primary.Cone            = 0.01
SWEP.Primary.ClipSize        = 4
SWEP.Primary.Delay           = 1.3
SWEP.Primary.DefaultClip     = 8
SWEP.Primary.Automatic       = false
SWEP.Primary.Ammo            = "ammo_rage_rockets"
SWEP.Primary.MagModel        = "models/weapons/w_rage_rocketlauncher_mag1.mdl"

-- Secondary Fire Mode
SWEP.Secondary                 = table.Copy(SWEP.Primary)
SWEP.Secondary.Projectile      = "ent_rage_rocket_shot_viper"
SWEP.Secondary.ProjectileForce = 50000
SWEP.Secondary.DefaultClip     = -1
SWEP.Secondary.Ammo            = "ammo_rage_viper"
SWEP.Secondary.MagModel        = "models/weapons/w_rage_rocketlauncher_mag2.mdl"

-- Crosshair settings
SWEP.CrosshairType   = 3
SWEP.CrosshairGap    = 1.4
SWEP.CrosshairMove   = 4
SWEP.CrosshairRecoil = 0.2

-- Ironsight settings
SWEP.IronsightSound     = 3
SWEP.UseNormalShootIron = false
SWEP.IronsightRoll      = false
SWEP.PlayFullIronAnim   = true
SWEP.IronsightVMFOV     = 0.75

-- Scope settings
SWEP.Sniper        = true
SWEP.AllowBreath   = false
SWEP.AutoSniper    = true
SWEP.ScopeScale    = 0.65
SWEP.SniperTexture = "scope/rage_scope_rocketlauncher"

-- Ironsight positions
SWEP.IronSightsPos = Vector(-6.312, -6.31, 1.424)
SWEP.IronSightsAng = Vector(0.303, -11.613, -4.219)

-- Sprinting/Nearwall positions
SWEP.RunArmPos   = Vector(-0.16, -4.52, -3.264)
SWEP.RunArmAngle = Vector(-9.051, 22.249, -23.664)

-- Time for ammo to appear in the mag during reload
SWEP.ReloadAmmoTime = 0.5

-- Weapon animations
SWEP.ReloadAnimEmpty  = ACT_VM_RELOAD_EMPTY
SWEP.IronsightInAnim  = ACT_VM_IDLE_TO_LOWERED
SWEP.IronsightOutAnim = ACT_VM_LOWERED_TO_IDLE
SWEP.Primary.AnimIron = ACT_VM_DEPLOYED_IRON_FIRE

-- Don't use different bodygroups for firemodes
SWEP.UseVMBG = false

-- Magazine model settings
SWEP.MagModel    = SWEP.Primary.MagModel
SWEP.MagDropTime = 0.2

-- Effect settings
SWEP.MuzzleEffect     = "rage_muzzle_rpg"
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
    util.PrecacheSound("RAGE/Weapons/RocketLauncher/Aimin.wav")
    util.PrecacheSound("RAGE/Weapons/RocketLauncher/Aimout.wav")
    util.PrecacheSound("RAGE/Weapons/RocketLauncher/Load.wav")
    util.PrecacheSound("RAGE/Weapons/RocketLauncher/Magout.wav")
    util.PrecacheSound("RAGE/Weapons/RocketLauncher/Magin.wav")
    util.PrecacheSound("RAGE/Weapons/RocketLauncher/Magslap.wav")
    util.PrecacheModel("models/props/rage/pickup_rocket.mdl")
    util.PrecacheModel("models/props/rage/pickup_viper.mdl")
end


/*-----------------------------
    SetupDataTables
    Initializes predicted variables
-----------------------------*/

function SWEP:SetupDataTables()

    -- Rocket Launcher specific variables
    self:NetworkVar("Float", 0, "Buu_RAGE_Deploying")
    self:NetworkVar("Entity", 0, "Buu_Rage_ViperTarget") 
    
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
    self:SetBuu_RAGE_Deploying(CurTime()+1)
    
    -- Call the weapon base's version of this function
    return BaseClass.Deploy(self)
end


/*-----------------------------
    HandleIdle
    Handles going into idle state
-----------------------------*/

function SWEP:HandleIdle()
    if (CLIENT) then
    
        -- If the viewmodel bodygroups haven't been initialized yet, do so
        if (self.VMBG == nil) then
            self.VMBG = {}
            for i=1, self:GetMaxClip1() do
                self.VMBG[i] = 0
            end
        end
        
        -- Figure out the ammo count based on if we're reloading, changing ammo type, firing, or mid animation
        local ammoc = self:Clip1()
        if (self:GetBuu_Reloading() && self:GetBuu_RAGE_ChangeModeTime()-1 < CurTime()) then
            if (self:GetBuu_GotoIdle() < CurTime()+2) then
                ammoc = self:Clip1()+self.Owner:GetAmmoCount(self.Primary.Ammo)
            end
        elseif (self:GetBuu_RAGE_ChangeModeTime()-1 > CurTime()) then
            ammoc = self:GetBuu_RAGE_OldMag()
        else
            if (self:GetBuu_GotoIdle() >= CurTime() && self:GetBuu_RAGE_Deploying() < CurTime()) then
                ammoc = self:Clip1()+1
            end
        end
        
        -- Enable bodygroups based on how many rockets are left in the magazine
        for i=self:GetMaxClip1(), 1, -1 do
            if (ammoc < i) then
                self.VMBG[i] = 2
            else
                if (self:GetBuu_RAGE_ChangeModeTime()-1 < CurTime()) then
                    self.VMBG[i] = self:GetBuu_FireMode()
                else
                    self.VMBG[i] = self:GetBuu_RAGE_OldMode()
                end
            end
        end
    end
    
    -- Call the weapon base's version of this function
    BaseClass.HandleIdle(self)
end


/*-----------------------------
    Think
    Logic that runs every tick
-----------------------------*/

function SWEP:Think()

    -- If we're scoped in the viper rockets mode
    if (self:GetBuu_FireMode() == 1 && self:IsScoped()) then
    
        -- Get all the entities in a cone
        local closestdist = 5120
        local closest = NULL
        local entlist = ents.FindInCone(self.Owner:EyePos(), self.Owner:GetAimVector(), closestdist,  0.982)
        
        -- Iterate though all the entities in that list and find the closest vehicle
        for k, v in pairs(entlist) do
            if (v:IsVehicle()) then
                local dist = self.Owner:EyePos():Distance(v:GetPos())
                if (dist < closestdist) then
                    closest = v
                    cloestdist = dist
                end
            end
        end
        
        -- Store the target
        self:SetBuu_Rage_ViperTarget(closest)
    end
    
    -- Network our clip size to other players
    if (SERVER) then
        if (self.Clip1Old == nil || self:Clip1() != self.Clip1Old) then
            net.Start("Buu_RAGE_NetworkClip1RocketLauncher")
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
    CreateDroppedMag
    Creates the dropped magazine model
    @Return The mag entity
-----------------------------*/

function SWEP:CreateDroppedMag()
    local mag = ents.CreateClientProp()
    
    -- Create the magazine from the hand bone if it exists, otherwise from our butt
    if (self.Owner != LocalPlayer() && self.Owner:LookupBone("ValveBiped.Bip01_L_Hand")) then
        mag:SetPos(self.Owner:GetBonePosition(self.Owner:LookupBone("ValveBiped.Bip01_L_Hand")))
    else
        mag:SetPos(self.Owner:GetPos()+Vector(0, 0, 50))
    end
    
    -- Set the angles and model
    mag:SetAngles(self.Owner:GetAngles())
    mag:SetModel(self.MagModel)
    mag:SetBodygroup(3, 1)
    
    -- Enable bodygroups based on our clip
    if (self:Clip1() < 3) then
        mag:SetBodygroup(2, 1)
    end
    if (self:Clip1() < 2) then
        mag:SetBodygroup(1, 1)
    end
    
    -- Return the mag entity
    return mag
end


if (CLIENT) then

    /*-----------------------------
        RAGE_HideWorldModelMag
        Hides the worldmodel mag during reloads
        @Param Whether to hide or not
    -----------------------------*/

    function SWEP:RAGE_HideWorldModelMag(hiding)
        if (hiding) then
            
            -- Hide all the rockets and the mag itself
            self:SetBodygroup(1, 1)
            for i=2, 5 do
                self:SetBodygroup(i, 2)
            end
        else
            -- Unhide the mag
            self:SetBodygroup(1, 0)
            
            -- Iterate through our mag and set the rocket bodygroups
            for i=self:GetMaxClip1(), 0, -1 do
                local bg = self:GetBuu_FireMode()
                if (self:Clip1() < i) then
                    bg = 2
                end
                self:SetBodygroup(i+1, bg)
            end
        end
    end
    
    
    /*-----------------------------
        Buu_RAGE_NetworkClip1RocketLauncher
        Receives a player's Rocket Launcher clipsize from the server
    -----------------------------*/

    local function Buu_RAGE_NetworkClip1RocketLauncher()
        local wep = net.ReadEntity()
        local clip = net.ReadInt(32)
        if (!IsValid(wep) || wep.Owner == LocalPlayer()) then return end
        wep:SetClip1(clip)
    end
    net.Receive("Buu_RAGE_NetworkClip1RocketLauncher", Buu_RAGE_NetworkClip1RocketLauncher)
    
    
    /*-----------------------------
        Buu_RAGE_RocketlauncherBGs
        Sets bodygroups on the viewmodel based on our clip
        @Param The viewmodel
        @Param The player
        @Param The weapon
    -----------------------------*/

    local function Buu_RAGE_RocketlauncherBGs(vm, ply, wep)
        if (wep:GetClass() == "weapon_buu_rage_rocketlauncher") then
        
            -- If the VMBG table hasn't been initialized yet, do so
            if (wep.VMBG == nil) then
                wep.VMBG = {}
                for i=1, wep:GetMaxClip1() do
                    wep.VMBG[i] = 0
                end
            end
            
            -- Set each bodygroup
            for i=wep:GetMaxClip1(), 1, -1 do
                vm:SetBodygroup(i, wep.VMBG[i])
            end
        end
    end
    hook.Add("PreDrawViewModel", "Buu_RAGE_RocketlauncherBGs", Buu_RAGE_RocketlauncherBGs)
    
    
    /*-----------------------------
        PreDrawScope
        Allows extra stuff before drawing the scope
    -----------------------------*/

    -- Initialize some static global variables
    local crosshairsizew = 36
    local crosshairsizeh = 36
    local crosshairsizew2 = 225
    local crosshairsizeh2 = 161
    local ammosizew = 141
    local ammosizeh = 57
    local iconsizew = 85
    local iconsizeh = 31
    local iconsize2h = 24
    local iconuv2 = 0.3647*2
    local iconuv22 = 0.63
    local CrosshairTexture = "scope/rage_scope_rocketlauncher_aim1"
    local CrosshairTexture2 = "scope/rage_scope_rocketlauncher_aim2"
    local CrosshairTexture3 = "scope/rage_scope_rocketlauncher_aim3"
    local AmmoTexture = "scope/rage_scope_rocketlauncher_ammo"
    local IconTexture = "scope/rage_scope_rocketlauncher_icons"
    local AmmoChunks = {1, 0.75, 0.5, 0.25, 0}
    surface.CreateFont("RAGE_RPGAmmoFont", {
        font = "idGinza Narrow Light",
        extended = false,
        size = 48*ScrH()/900,
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
        local iconuv = 0.3647
        local iconuv_2 = iconuv
        local iconh = iconsizeh
        local ammocount = string.format("%01d", self.Owner:GetAmmoCount(self.Primary.Ammo)+self:Clip1())
        local xhairw = crosshairsizew
        local xhairh = crosshairsizeh
        local tw, th = surface.GetTextSize(ammocount)
        
        -- Tint everything red
        surface.SetDrawColor(215, 0, 5, 128)
        surface.DrawRect(0, 0, ScrW(), ScrH())
        
        -- Crosshair
        surface.SetDrawColor(255, 255, 255, 128)
        if (self:GetBuu_FireMode() == 1) then
            iconuv = iconuv2
            iconuv_2 = iconuv22
            iconh = iconsize2h
            xhairw = crosshairsizew2
            xhairh = crosshairsizeh2
            surface.SetTexture(surface.GetTextureID(CrosshairTexture2))
        else
            surface.SetTexture(surface.GetTextureID(CrosshairTexture))
        end
        surface.DrawTexturedRect(ScrW()/2-(xhairw/2)*hratio, ScrH()/2-(xhairh/2)*hratio, xhairw*hratio, xhairh*hratio)
        
        -- Ammo counter icon background
        surface.SetDrawColor(255, 255, 255, 128)
        surface.SetTexture(surface.GetTextureID(AmmoTexture))
        surface.DrawTexturedRect(ScrW()/2+290*wratio, ScrH()/2+160*hratio, ammosizew*hratio, ammosizeh*hratio)
        
        -- Little icon
        surface.SetDrawColor(255, 255, 255, 200)
        surface.SetTexture(surface.GetTextureID(IconTexture))
        surface.DrawTexturedRectUV(ScrW()/2+357*wratio, ScrH()/2+222*hratio, iconsizew*hratio, iconsize2h*hratio, 0, iconuv-0.3647, 1, iconuv_2)
        
        -- Ammo text
        surface.SetTextColor(255, 0, 0, 200)
        surface.SetFont("RAGE_RPGAmmoFont")
        surface.SetTextPos(ScrW()/2+352*wratio-tw, ScrH()/2+208*hratio)
        surface.DrawText(ammocount)
        
        -- Viper target
        if (self:GetBuu_FireMode() == 1 && self:GetBuu_Rage_ViperTarget() != NULL) then
            local xhairw = 26
            local xhairh = 22
            local point = self:GetBuu_Rage_ViperTarget():GetPos() + self:GetBuu_Rage_ViperTarget():OBBCenter()
            local data2D = point:ToScreen()
            surface.SetDrawColor(255, 255, 255, 200)
            surface.SetTexture(surface.GetTextureID(CrosshairTexture3))
            surface.DrawTexturedRect(data2D.x-(xhairw/2)*hratio, data2D.y-(xhairh/2)*hratio, xhairw*hratio, xhairh*hratio)
        end
    end
    
    
    /*-----------------------------
        PostDrawScope
        Allows extra stuff after drawing the scope
    -----------------------------*/
    
    function SWEP:PostDrawScope()
        local wratio = self.LensTable.w/1171
        local hratio = self.LensTable.h/1171
        local mag = (self:Clip1()/self:GetMaxClip1())
        local mmag = 1-mag
        local ammo = AmmoChunks[1+self:GetMaxClip1()-self:Clip1()]
        local w = ammosizew*hratio
        surface.SetDrawColor(255, 255, 255, 128)
        surface.SetTexture(surface.GetTextureID(AmmoTexture))
        surface.DrawTexturedRectUV(ScrW()/2+290*wratio+w-ammo*w, ScrH()/2+160*hratio, ammo*w, ammosizeh*hratio, 1-ammo, 0, 1, 1)
    end
end


if (SERVER) then

    -- Initialize network strings
    util.AddNetworkString("Buu_RAGE_NetworkClip1RocketLauncher")
end