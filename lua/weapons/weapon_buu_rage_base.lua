/**************************************************************
                     RAGE SWEPs Weapon Base
This is the weapon base used by the RAGE SWEPs. It is an 
extension of Buu342's Weapon Base 2, providing Wingstick
throwing capability, ammo type switching, and an upgrade system
for both viewmodels and worldmodels.
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()
DEFINE_BASECLASS( "weapon_buu_base2" )

-- SWEP Info
SWEP.PrintName = "RAGE Base"
SWEP.Purpose   = "You shouldn't be able to hold this!."
SWEP.Category  = "RAGE"

-- Weapon base
SWEP.Base = "weapon_buu_base2"

-- Spawning settings
SWEP.Spawnable      = false
SWEP.AdminSpawnable = false

-- Viewmodel/Worldmodel settings
SWEP.ViewModel    = "models/weapons/c_rage_pistol.mdl"
SWEP.WorldModel   = "models/weapons/w_rage_pistol.mdl"
SWEP.ViewModelFOV = 60

-- Icons
SWEP.KillIcon = "VGUI/entities/ent_rage_pickup_ammo_wingstick"
if (CLIENT) then
    killicon.Add("ent_rage_pickup_ammo_wingstick", SWEP.KillIcon, Color(255, 255, 255))
    SWEP.WepSelectIcon = surface.GetTextureID(SWEP.KillIcon)
end

-- Holdtype
SWEP.HoldType = "shotgun"

-- Primary fire settings
SWEP.Primary.Recoil      = 1
SWEP.Primary.Damage      = 17
SWEP.Primary.NumShots    = 1
SWEP.Primary.Cone        = 0.08
SWEP.Primary.ClipSize    = 8
SWEP.Primary.Delay       = 0.1
SWEP.Primary.DefaultClip = 16
SWEP.Primary.Automatic   = false
SWEP.Primary.Ammo        = "ammo_rage_pistol"
SWEP.Primary.BodyGroup   = 0
SWEP.Primary.MagModel    = nil
SWEP.Primary.Tracer      = "nil"

-- SWEP Base functionality
SWEP.ReloadAmmoTime     = 0.9
SWEP.IronsightSound     = 3
SWEP.UseNormalShootIron = false
SWEP.ChangeFireModes    = true

-- Viewmodel bodygroups settings
SWEP.UseVMBG      = true -- Use different bodygroups for firemodes
SWEP.VMBGSwapTime = 1.5 -- Time for the bodygroups to change (divisor of the reload animation) 

-- Third person settings
SWEP.NoMagBodygroup   = 1
SWEP.ThirdPersonShell = "RifleShellEject"

SWEP.IsRAGEBase = true  -- Don't touch


/*-----------------------------
    PrecacheStuff
    Precaches things to prevent lag spikes when
    using the weapon
-----------------------------*/

function SWEP:PrecacheStuff()
    
    -- Call the weapon base's version of this function
    BaseClass.PrecacheStuff(self)
    
    -- Precache wingstick models and sounds, as well as other generic stuff
    util.PrecacheModel("models/weapons/c_rage_wingstick.mdl")
    util.PrecacheModel("models/weapons/w_rage_wingstick.mdl")
    util.PrecacheModel("models/weapons/w_rage_wingstick_gib1.mdl")
    util.PrecacheModel("models/weapons/w_rage_wingstick_gib2.mdl")
    util.PrecacheModel("models/weapons/w_rage_wingstick_gib3.mdl")
    util.PrecacheModel("models/props/rage/pickup_wingstick.mdl")
    util.PrecacheSound("RAGE/Weapons/Wingstick/Throw-01.wav")
    util.PrecacheSound("RAGE/Weapons/Wingstick/Throw-02.wav")
    util.PrecacheSound("RAGE/Weapons/Wingstick/Throw-03.wav")
    util.PrecacheSound("RAGE/Weapons/Wingstick/Throw-04.wav")
    util.PrecacheSound("rage/weapons/wingstick/flight_loop.wav")
    util.PrecacheSound("rage/weapons/wingstick/catch-02.wav")
    util.PrecacheSound("rage/weapons/wingstick/catch-03.wav")
    util.PrecacheSound("rage/weapons/wingstick/catch-04.wav")
    util.PrecacheSound("rage/weapons/wingstick/break-01.wav")
    util.PrecacheSound("rage/weapons/wingstick/break-02.wav")
    util.PrecacheSound("rage/weapons/wingstick/break-03.wav")
    util.PrecacheSound("RAGE/pickup.wav")
    util.PrecacheSound("RAGE/pickup_ammo.wav")
    util.PrecacheSound("RAGE/select.wav")
    util.PrecacheSound("RAGE/Weapons/Generic/IronIn.wav")
    util.PrecacheSound("RAGE/Weapons/Generic/IronOut.wav")
    util.PrecacheSound("RAGE/Weapons/Generic/Draw.wav")
end


/*-----------------------------
    SetupDataTables
    Initializes predicted variables
-----------------------------*/

function SWEP:SetupDataTables()

    -- Call the weapon base's version of this function
    BaseClass.SetupDataTables(self)
    
    -- I'm starting the values at 20 so that weapons that derive this one
    -- don't need to worry about overriding the NetworkVars
    self:NetworkVar("Int",   20, "Buu_RAGE_OldMode")        -- What was the last fire mode we were using?
    self:NetworkVar("Int",   21, "Buu_RAGE_OldMag")         -- How much ammo did we have in our mag before changing mode?
    self:NetworkVar("Float", 20, "Buu_RAGE_ChangeModeTime") -- Mode change timer
    self:NetworkVar("Bool",  20, "Buu_RAGE_ChangedMode")    -- Did we just change weapon mode?
end


/*-----------------------------
    Deploy
    Called when the weapon is deployed
    @Return Whether to allow switching away from this weapon
-----------------------------*/

function SWEP:Deploy()

    -- On the next tick, clear all the bodygroups
    -- Done on the next tick to prevent issues with the last equipped weapon's bodygroups
    timer.Simple(0, function()
        if (!IsValid(self)) then return end
        
        -- I don't use more than 4 bodygroups, so 9 is a safe number
        for i=0, 9 do
            self:SetBodygroup(i, 0)
        end
    end)
    
    -- Call the weapon base's version of this function
    return BaseClass.Deploy(self)
end

/*-----------------------------
    Think
    Logic that runs every tick
-----------------------------*/

function SWEP:Think()

    -- Handle the weapon upgrades
    if (SERVER) then
        self:RAGE_HandleUpgrade()
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
    if (self.Owner.ThrowingStick != nil && self.Owner.ThrowingStick > CurTime()) then return false end
    
    -- Call the weapon base's version of this function
    BaseClass.Reload(self)
    
    -- Don't drop a mag if we're only changing the firemode
    if (self:GetBuu_RAGE_ChangeModeTime() > CurTime()) then
        self:SetBuu_MagDropTime(0)
    end
end


/*-----------------------------
    HandleFireModeChange
    Code that runs when the fire mode is changed.
    In my weapon base, the different firemodes are supposed to be
    for things like changing between semi/auto. This extends it to change
    the ammo types, among other things
    @Param False/Nil if cycling ammo foward, True if cycling backward
-----------------------------*/

-- We need to store a copy of the original values from the original SWEP.Primary, as we'll be overwriting it
SWEP.OriginalPrimary = nil
function SWEP:HandleFireModeChange(backwards)
    if (self:GetNextPrimaryFire() > CurTime() || self:GetBuu_Reloading()) then return end

    -- Initialize a table of the firemodes
    -- This has to be done dynamically because the values can change
    local firemodes = { 
        self.Primary,
        self.Secondary,
        self.Tertiary,
        self.Quaternary,
    }
    
    -- If we didn't initialize the OriginalPrimary variable, do so
    if (self.OriginalPrimary == nil) then
        self.OriginalPrimary = {}
        self.OriginalPrimary.Ammo = self.Primary.Ammo
        self.OriginalPrimary.ClipSize = self.Primary.ClipSize
    end

    -- Iterate through all the firemodes
    local currmode
    local oldmode = self:GetBuu_FireMode()
    local checking = self:GetBuu_FireMode()
    for i=1, #firemodes do
    
        -- Increment/Decrement the firemode we're checking
        if (backwards) then
            checking = (checking-1)%(#firemodes)
        else
            checking = (checking+1)%(#firemodes)
        end
        currmode = table.Copy(firemodes[checking+1]) -- Plus 1 to prevent indexing zero
        
        -- If we're checking firemode 0, then use the original weapon values
        if (checking == 0) then
            currmode.Ammo = self.OriginalPrimary.Ammo
            currmode.ClipSize = self.OriginalPrimary.ClipSize
        end
        
        -- If the firemode we're checking can be changed into
        if (checking != oldmode && currmode != nil && currmode.Ammo != nil && self.Owner:GetAmmoCount(currmode.Ammo) > 0) then
        
            -- Network the new firemode data to overwrite to the client
            if (SERVER && game.SinglePlayer()) then
                net.Start("Buu_RAGE_SendNewModeToClient")
                    net.WriteString(currmode.Ammo)
                    net.WriteInt(currmode.ClipSize, 32)
                    if (currmode.MagModel != nil) then
                        net.WriteString(currmode.MagModel)
                    end
                net.Send(self.Owner)
            elseif (CLIENT) then
                self.Owner:PrintMessage(HUD_PRINTCENTER, "Switching ammo to "..language.GetPhrase(currmode.Ammo.."_ammo"))
            end
            
            -- Store the old magazine size, and wipe the magazine clip
            self:SetBuu_RAGE_OldMag(self:Clip1())
            if (SERVER && self:Clip1() > 0) then
                self.Owner:GiveAmmo(self:Clip1(), firemodes[oldmode+1].Ammo, true)
                self:SetClip1(0)
            end
            
            -- Set our predicted variables
            self:SetBuu_FireMode(checking)
            self:SetBuu_RAGE_OldMode(oldmode)
            
            -- Change weapon settings to the new firemode's values
            self.Primary.Ammo     = currmode.Ammo
            self.Primary.ClipSize = currmode.ClipSize
            if (currmode.MagModel != nil) then
                self.MagModel = currmode.MagModel
            end
            
            -- Call a helper function for changing anything else we might want to
            self:RAGE_FireModeChangeExtra(currmode)

            -- State that we're now changing our weapon made
            self:SetBuu_RAGE_ChangeModeTime(CurTime()+self.Owner:GetViewModel():SequenceDuration(self.Owner:GetViewModel():SelectWeightedSequence(ACT_VM_RELOAD))/self.VMBGSwapTime)
            self:SetBuu_RAGE_ChangedMode(true)
            return
        end
    end
end


/*-----------------------------
    HandleFireModeChange
    Helper function for extra things to change when the
    fire mode is swapped
    @Param the new weapon mode table
-----------------------------*/

function SWEP:RAGE_FireModeChangeExtra(modetable)
end


/*-----------------------------
    HandleIdle
    Handles going into idle state
-----------------------------*/

function SWEP:HandleIdle()
    if (CLIENT && self.UseVMBG) then
    
        -- If we haven't initialized the viewmodel bodygroups variable, do so
        if (self.VMBGMode == nil) then
            self.VMBGMode = -1
        end
        
        -- If we're changing the firemode
        if (self:GetBuu_Reloading() && self:GetBuu_RAGE_ChangeModeTime() < CurTime()) then
            local mode = self:GetFireModeTable()
            
            -- If this firemode has a different bodygroup, then change to it, otherwise go back to default
            if (mode.BodyGroup != nil && mode.BodyGroup != -1) then
                self.VMBGMode = mode.BodyGroup
            else
                self.VMBGMode = -1
            end
        end
    end
    
    -- Call the weapon base's version of this function
    BaseClass.HandleIdle(self)
end


/*-----------------------------
    MuzzleFlashEffect
    Handles the muzzleflash effect emission
    @Param Where to attach the effect to
-----------------------------*/

function SWEP:MuzzleFlashEffect(attachment)
    if (self.Silenced) then return end
    
    -- Select which effect to use
    local effect = self.MuzzleEffect
    local mode = self:GetFireModeTable()
    if (mode.Silenced) then
        effect = self.MuzzleEffectS
    end
    if (mode.Muzzle != nil) then
        effect = mode.Muzzle
    end
    
    -- If we have a valid effect
    if (effect != nil && effect != -1 && effect != "") then
        local ent = self
        
        -- If we're a player, attach it to the viewmodel
        if (self.Owner:IsPlayer()) then
            ent = self.Owner:GetViewModel()
        end
        
        -- If we're in thirdperson, attach it to the weapon instead of the viewmodel
        if (LocalPlayer() != self.Owner || self.Owner:ShouldDrawLocalPlayer() || self.Owner:IsNPC()) then
            ent = self
        end
        
        -- Emit the effect. Doesn't work in SinglePlayer in third person, for some reason...
        ParticleEffectAttach(effect, PATTACH_POINT_FOLLOW, ent, 1)
    end
end


/*-----------------------------
    MuzzleLightEffect
    Handles the muzzle light emission
    @Param Where to attach the light to
-----------------------------*/

function SWEP:MuzzleLightEffect(attachment)
    local dlight = DynamicLight(self.Owner:EntIndex())
    
    -- If we successfully created a dynamic light
    if (dlight != nil) then
    
        -- If the attachment exists, then set its position to it, otherwise use the player's shoot pos
        if (attachment != nil) then
            dlight.pos = attachment.Pos
        else
            dlight.pos = self.Owner:GetShootPos()
        end
        
        -- Ensure this firemode actually has a dynamic light
        local effect = self.MuzzleLight
        local mode = self:GetFireModeTable()
        if (mode.Light == -1) then return end
        if (mode.Light != nil) then
            effect = mode.Light
        end
        
        -- Setup the dynamic light
        dlight.r = effect.r
        dlight.g = effect.g
        dlight.b = effect.b
        dlight.brightness = 2
        dlight.Decay = 1024
        dlight.Size = 256
        dlight.DieTime = CurTime() + 0.3
    end
end


/*-----------------------------
    RAGE_HideWorldModelMag
    Hides the worldmodel mag during reloads
    @Param Whether to hide or not
-----------------------------*/

function SWEP:RAGE_HideWorldModelMag(hiding)
    local mode = self:GetFireModeTable()
    if (hiding) then
        self:SetBodygroup(1, self.NoMagBodygroup)
    else
        if (mode.BodyGroup != nil) then
            self:SetBodygroup(1, mode.BodyGroup)
        end
    end
end


/*-----------------------------
    Buu_RAGE_ForceReloadModeChange
    Forces the player to reload if they changes firemode
    @Param The player to check
    @Param The CUserCmd data
-----------------------------*/

local function Buu_RAGE_ForceReloadModeChange(ply, cmd)

    -- If the player is holding a RAGE SWEP, and they changed firemode
    if (IsValid(ply:GetActiveWeapon()) && ply:GetActiveWeapon().IsRAGEBase && ply:GetActiveWeapon():GetBuu_RAGE_ChangedMode()) then
    
        -- If they're reloading, stop changing the firemode, otherwise, spam the reload key
        if (ply:GetActiveWeapon():GetBuu_Reloading()) then
            ply:GetActiveWeapon():SetBuu_RAGE_ChangedMode(false)
        else
            cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_RELOAD))
        end
    end
end
hook.Add("StartCommand", "Buu_RAGE_ForceReloadModeChange", Buu_RAGE_ForceReloadModeChange)


/*-----------------------------
    Buu_RAGE_BindChecks
    Checks if the player pressed specific binds used by the RAGE SWEPs
    @Param The player to check
    @Param The button that was pressed
-----------------------------*/

local function Buu_RAGE_BindChecks(ply, button)
    local wep = ply:GetActiveWeapon()
    
    -- If the player pressed the wingstick button, and they can use wingsticks
    if (button == GetConVar("cl_buu_rage_wingstickbutton"):GetInt() && ply:GetAmmoCount("ammo_rage_wingstick") > 0 && (ply.ThrowingStick == nil || ply.ThrowingStick < CurTime())) then
        local throwing = false
        
        -- Ensure that the player can use wingsticks
        if (IsValid(wep) && wep.IsRAGEBase) then
            throwing = (!wep:GetBuu_Sprinting() && !wep:GetBuu_NearWall() && !wep:GetBuu_Ironsights() && !wep:GetBuu_Reloading() && !wep:GetBuu_RAGE_ChangedMode() && wep:GetNextPrimaryFire() < CurTime())
        elseif (GetConVar("sv_buu_rage_wingstickalways"):GetBool()) then
            throwing = (wep:GetNextPrimaryFire() < CurTime())
        end
        
        -- If they can, throw the wingstick
        if (throwing && SERVER) then
            ply:SetNWFloat("Buu_Rage_Wingstick", CurTime() + 0.1)
            ply.ThrowingStick = CurTime() + 1
            ply:RemoveAmmo(1, "ammo_rage_wingstick")
            
            -- Network the throw to the client
            net.Start("Buu_RAGE_ClientsideWingstickThrow")
                net.WriteFloat(ply.ThrowingStick)
            net.Send(ply)
        end
    end

    -- If the player pressed the weapon firemode switch button, then change the weapon mode
    if ((button == GetConVar("cl_buu_rage_ammobutton"):GetInt() || button == GetConVar("cl_buu_rage_ammobuttonback"):GetInt()) && IsValid(wep) && wep.IsRAGEBase) then
        wep:HandleFireModeChange(button == GetConVar("cl_buu_rage_ammobuttonback"):GetInt())
    end
end
hook.Add("PlayerButtonDown", "Buu_RAGE_BindChecks", Buu_RAGE_BindChecks)


/*-----------------------------
    Buu_RAGE_ThrowStick
    Throws the wingstick
    @Param The player that threw the Wingstick
    @Param The move data
-----------------------------*/

local function Buu_RAGE_ThrowStick(ply, mv)

    -- If the player threw a wingstick
    if (ply:GetNWFloat("Buu_Rage_Wingstick") < CurTime() && ply:GetNWFloat("Buu_Rage_Wingstick") != 0) then
    
        -- Reset the timer and play a throwing sound
        ply:SetNWFloat("Buu_Rage_Wingstick", 0)
        ply:EmitSound("RAGE/Weapons/Wingstick/Throw-0"..math.random(1,4)..".wav", 35)
        ply:GetActiveWeapon():SetNextPrimaryFire(CurTime() + 1)
        
        -- Throw the wingstick serverside
        if (SERVER) then
        
            -- Create a trace to see if the player was looking at someone
            local size = 150
            local tr = util.TraceHull({
                start = ply:GetShootPos(),
                endpos = ply:GetShootPos() + ply:GetAimVector()*1024,
                filter = function(ent) 
                    return (!(ent == ply || !(ent:IsPlayer() || ent:IsNPC()) || !ent:Visible(ply))) -- Make sure we only chase players and NPC's that we can see
                end,
                ignoreworld = true,
                mins = Vector(-size/2, -size/2, -size/2),
                maxs = Vector(size/2, size/2, size/2),
                mask = MASK_SHOT_HULL
            })
            
            -- Create the wingstick
            local ent = ents.Create("ent_rage_wingstick_thrown")
            local pos = ply:GetShootPos()
            pos = pos + ply:GetForward()*5 
            pos = pos + ply:GetRight()*(-2)
            pos = pos + ply:GetUp()*(-4)
            ent:SetPos(pos)
            ent:SetAngles(Angle(ply:GetAngles().p, ply:GetAngles().y, 0))
            ent:SetOwner(ply)
            ent.Owner = ply
            ent:Spawn()
            ent:Activate()
            ent:ResetSequence( ent:LookupSequence("spin") )
            
            -- If the trace found someone, then set them as the Wingstick's target
            if (tr.HitNonWorld && (tr.Entity:IsPlayer() || tr.Entity:IsNPC())) then
                ent.Target = tr.Entity
                ent.TargetOriginal = tr.Entity
                ent.TargetPos = tr.Entity:GetPos()+Vector(0,0,50)
            else
                ent.Target = nil
                ent.TargetPos = ply:GetEyeTrace().HitPos
            end
             
             -- Apply velocity to the Wingstick
            local phys = ent:GetPhysicsObject()
            local dir = ply:GetAimVector()
            dir = dir + ply:GetRight()*0.5
            phys:ApplyForceCenter(dir*3000)
        end
    end
end
hook.Add("PlayerTick", "Buu_RAGE_ThrowStick", Buu_RAGE_ThrowStick)


if (CLIENT) then

    /*-----------------------------
        DrawWorldModel
        Draws the worldmodel
    -----------------------------*/

    function SWEP:DrawWorldModel()
    
        -- Check if we should hide the mag, and pass that information to the mag hiding function
        local hide = (self:GetBuu_Reloading() && self:GetBuu_MagDropTime() < CurTime())
        self:RAGE_HideWorldModelMag(hide)
        
        -- Draw the worldmodel
        self:DrawModel()
    end


    /*-----------------------------
        Buu_RAGE_BaseBGs
        Handles viewmodel bodygroups due to weapon modes
        @Param The viewmodel
        @Param The player
        @Param The weapon
    -----------------------------*/

    local function Buu_RAGE_BaseBGs(vm, ply, wep)
    
        -- If the weapon's mode has a different bodygroup, change it on the viewmodel
        if (wep.IsRAGEBase && wep.UseVMBG && wep.VMBGMode != nil && wep.VMBGMode != -1) then
            vm:SetBodygroup(1, wep.VMBGMode)
        end
    end
    hook.Add("PreDrawViewModel", "Buu_RAGE_BaseBGs", Buu_RAGE_BaseBGs)


    /*-----------------------------
        Buu_RAGE_ThrowingViewModelLower
        Lowers the viewmodel when throwing a Wingstick
        @Param The weapon
        @Param The viewmodel
        @Param The old viewmodel position (before we change it)
        @Param The old viewmodel angle (before we change it)
        @Param The new viewmodel position
        @Param The new viewmodel angle
    -----------------------------*/

    local function Buu_RAGE_ThrowingViewModelLower(wep, vm, oldpos, oldang, pos, ang) 
    
        -- If a Wingstick is currently being thrown
        if (LocalPlayer().ThrowingStick != nil && LocalPlayer().ThrowingStick > CurTime() && (LocalPlayer().ThrowingStick - CurTime()) <= 1) then
        
            -- Calculate how much change to make
            local change = LocalPlayer().ThrowingStick - CurTime()
            change = change*3.14
            if change < 0 then
                change = 0
            end
            local newpos = pos + Vector(0,0,math.sin(change*2)*5)
            local newang = ang + Angle(math.sin(change)*30,0,0)
            
            -- Rotate the viewmodel
            if (weapons.IsBasedOn(wep:GetClass(), "mg_base")) then -- Workaround for Mushroom Guy's Modern Warfare Base
                wep.m_ViewModel:SetPos(newpos)
                wep.m_ViewModel:SetAngles(newang)
            else
                vm:SetRenderOrigin(newpos)
                vm:SetRenderAngles(newang)
            end
        end
    end
    hook.Add("CalcViewModelView", "Buu_RAGE_ThrowingViewModelLower", Buu_RAGE_ThrowingViewModelLower)


    /*-----------------------------
        Buu_RAGE_ThrowingAnimation
        Creates a fake viewmodel that plays the Wingstick throwing animation
    -----------------------------*/

    local function Buu_RAGE_ThrowingAnimation() 
        local ply = LocalPlayer()
    
        -- If a Wingstick is currently being thrown
        if (ply.ThrowingStick != nil && ply.ThrowingStick > CurTime() && GetViewEntity() == LocalPlayer() && !LocalPlayer():ShouldDrawLocalPlayer()) then
        
            -- Create a 3D camera, and iterate through all the entities
            cam.Start3D(EyePos(), EyeAngles(), 50) 
                for k, v in pairs(ents.GetAll()) do 
                
                    -- If we found our viewmodel
                    if (v:GetClass() == "viewmodel") then
                    
                        -- Don't manipulate our current viewmodel model
                        v:SetRenderOrigin(EyePos())
                        v:SetRenderAngles(EyeAngles())
                        
                        -- Get the player's c_hands, and make sure they exist
                        local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
                        local info = player_manager.TranslatePlayerHands( simplemodel )
                        if (!info) then return end
                        
                        -- If the Wingstick throw clientside model doesn't exist, create it
                        if (!IsValid(ply.Wingstick)) then
                            ply.Wingstick = ClientsideModel("models/weapons/c_rage_wingstick.mdl")
                        end
                        
                        -- Set stuff on the Wingstick throwing viewmodel, but don't render it
                        ply.Wingstick:ResetSequence("throw")
                        ply.Wingstick:SetRenderOrigin(v:GetPos() )
                        ply.Wingstick:SetRenderAngles( v:GetAngles() )
                        ply.Wingstick:SetupBones()
                        ply.Wingstick:SetCycle(1-(ply.ThrowingStick-CurTime()))
                        ply.Wingstick:DrawModel()
                        ply.Wingstick:SetNoDraw(true)
                        
                        -- If the viewmodel hands don't exist, create them
                        if (!IsValid(ply.WingstickHands)) then
                            ply.WingstickHands = ClientsideModel(info.model)
                        end
                        
                        -- Get the player's color
                        local playerColor = v:GetOwner():GetPlayerColor()
                        ply.WingstickHands.GetPlayerColor = function()
                            return playerColor
                        end
                        
                        -- Draw the Wingstick throwing hands by bonemerging them to the Wingstick throw viewmodel
                        ply.WingstickHands:SetSkin(info.skin )
                        ply.WingstickHands:SetBodyGroups(info.body)
                        ply.WingstickHands:AddEffects(EF_BONEMERGE)
                        ply.WingstickHands:SetParent(ply.Wingstick)
                        ply.WingstickHands:DrawModel()
                        ply.WingstickHands:SetNoDraw(true)
                    end
                end 
            cam.End3D() 
        end
        
        -- If we're not throwing anymore, or the player is dead, then remove the clientside model
        if (!IsValid(ply) || !ply:Alive() || (ply.ThrowingStick != nil && ply.ThrowingStick < CurTime())) then
            if (ply.Wingstick != nil) then
                ply.Wingstick:Remove()
                ply.Wingstick = nil
                ply.WingstickHands:Remove()
                ply.WingstickHands = nil
            end
        end
    end
    hook.Add("RenderScreenspaceEffects", "Buu_RAGE_ThrowingAnimation", Buu_RAGE_ThrowingAnimation)
    
    
    /*-----------------------------
        Buu_RAGE_WingstickAnimTP
        Plays an animation in thirdperson when throwing a Wingstick
    -----------------------------*/
    
    local function Buu_RAGE_WingstickAnimTP(ply)
    
        -- If we haven't initialized the animation tracker variable, do so
        if (ply.CurrentWingstickCycle == nil) then
            ply.TPWingstickAnimPlaying = false
        end
        
        -- If we're throwing a Wingstick
        if (ply.ThrowingStick != nil && ply.ThrowingStick > CurTime()) then
            
            -- If the player animation cycle hasn't been reset, do so
            if (!ply.TPWingstickAnimPlaying) then
                ply.TPWingstickAnimPlaying = true
                ply:SetCycle(0)
            end
            
            -- Play a throwing animation
            ply:SetPlaybackRate(1)
            ply.CalcIdeal = ACT_MP_STAND_IDLE
            ply.CalcSeqOverride = -1
            ply.CalcSeqOverride = ply:LookupSequence("seq_baton_swing")
            return ply.CalcIdeal, ply.CalcSeqOverride
        else
        
            -- Otherwise, reset the animation tracker
            ply.TPWingstickAnimPlaying = false
        end
    end
    hook.Add("CalcMainActivity", "Buu_RAGE_WingstickAnimTP", Buu_RAGE_WingstickAnimTP)


    /*-----------------------------
        Buu_RAGE_AmmoCountHUD
        Helper function for getting the ammo count of a specific ammo types
        @Param  The ammo type to check
        @Return The amount of ammo left in that mag
    -----------------------------*/

    local function Buu_RAGE_AmmoCountHUD(ammotype)
        if (ammotype == nil || ammotype == "" || ammotype == "none" || !LocalPlayer():Alive() || !IsValid(LocalPlayer():GetActiveWeapon())) then return 0 end
    
        -- Get the player's ammo count
        local count = LocalPlayer():GetAmmoCount(ammotype)
        
        -- If the player enabled including the clip into the ammo count, then add that as well
        if (GetConVar("cl_buu_rage_clipincount"):GetBool() && LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType() == game.GetAmmoID(ammotype)) then
            count = count + LocalPlayer():GetActiveWeapon():Clip1()
        end
        
        -- Return the ammo count
        return count
    end
    
    
    /*-----------------------------
        Buu_RAGE_AmmoHUD
        Draws RAGE SWEPs Ammo HUD
    -----------------------------*/

    -- Initialize some static global variables
    local wratio = ScrW()/1600
    local hratio = ScrH()/900
    local iconw  = 64*hratio
    local iconh  = 64*hratio
    local iconhh = iconh/2
    surface.CreateFont("RAGE_AmmoFont", {
        font = "idGinza Narrow Medium",
        extended = false,
        size = ScreenScale(18),
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
    local function Buu_RAGE_AmmoHUD() 
    
        if (!GetConVar("cl_buu_rage_showammo"):GetBool()) then return end
        
        -- If the player is alive
        if (LocalPlayer():Alive()) then
        
            -- Initialize some useful values and tables
            local wep = LocalPlayer():GetActiveWeapon()
            local drawstack = {}
            local modetable = {
                wep.Primary,
                wep.Secondary,
                wep.Tertiary,
                wep.Quaternary,
            }
            
            -- Typically, you would only want to recreate the drawing stack when something changes, but the amount of
            -- branch conditionioning that needs would've resulted in something slower, or a silly amount of back and fourth between
            -- different functions.
            
            -- If the player is using a RAGE weapon, then cycle through
            if (IsValid(wep) && wep.IsRAGEBase) then
                local class = wep:GetClass()
                
                -- Iterate through all the ammo types
                for k, v in pairs(modetable) do
                    local ammotype = v.Ammo
                    
                    -- If we're looking at the first fire mode, then use the OriginalPrimary values instead
                    if (k == 1 && wep.OriginalPrimary != nil) then
                        ammotype = wep.OriginalPrimary.Ammo
                    end
                    
                    -- If we have ammo for this firemode, then insert that into our draw stack
                    if (modetable[k] != nil && modetable[k].Ammo != nil && modetable[k].Ammo != "" && modetable[k].Ammo != "none" && (!GetConVar("cl_buu_rage_nonemptyammo"):GetBool() || Buu_RAGE_AmmoCountHUD(ammotype) > 0)) then
                        local name = "ent_rage_pickup_"..string.Replace(ammotype, "_rage_", "_")
                        table.insert(drawstack, {ammotype, "VGUI/entities/"..name})
                    end
                end
            end
            
            -- Add our Wingstick ammo count to the drawing stack, or remove it if it's in the table
            local stacksize = #drawstack
            if (((GetConVar("cl_buu_rage_alwaysshowwingsticks"):GetBool() && GetConVar("cl_buu_rage_showwingsticks"):GetBool()) || (IsValid(wep) && wep.IsRAGEBase && GetConVar("cl_buu_rage_showwingsticks"):GetBool())) && (!GetConVar("cl_buu_rage_nonemptyammo"):GetBool() || LocalPlayer():GetAmmoCount("ammo_rage_wingstick") > 0)) then
                if (stacksize == 0 || drawstack[stacksize][1] != "ammo_rage_wingstick") then
                    drawstack[stacksize+1] = {"ammo_rage_wingstick", "VGUI/entities/ent_rage_pickup_ammo_wingstick"}
                end
            end
            
            -- If the drawing stack isn't empty
            if (#drawstack != 0 && LocalPlayer():Alive()) then
                local recheight = (#drawstack/2)*iconh
                local starty = math.Clamp(ScrH()*GetConVar("cl_buu_rage_ammoy"):GetFloat()-recheight, 0, ScrH()-recheight*2)
                
                -- Iterate through the drawing stack
                for k, v in pairs(drawstack) do
                    local align = TEXT_ALIGN_RIGHT
                    local ammox = 0
                    local iconx = math.Clamp(ScrW()*GetConVar("cl_buu_rage_ammox"):GetFloat(), 0, ScrW()-iconw)
                    local icony = starty+iconh*(k-1)
                    local ammoc = Buu_RAGE_AmmoCountHUD(v[1])
                    local alpha = GetConVar("cl_buu_rage_ammotrans"):GetInt()
                    local yellow = 255
                    
                    -- If we have this ammo type currently being used, then highlight it
                    if (v[1] != "ammo_rage_wingstick" && wep.IsRAGEBase && wep:GetPrimaryAmmoType() == game.GetAmmoID(v[1])) then
                        if (GetConVar("cl_buu_rage_showcurrammo"):GetBool()) then
                            if (alpha > 128) then
                                yellow = yellow-(alpha-128)*2
                            end
                            alpha = 255
                        end
                    end
                    
                    -- Align the text based on the user's ConVar
                    if (GetConVar("cl_buu_rage_ammox"):GetFloat() < 0.5) then
                        ammox = iconw
                        align = TEXT_ALIGN_LEFT
                    end
                    
                    -- Draw the ammo icon and count
                    surface.SetDrawColor(255, 255, yellow, alpha)
                    surface.SetTexture(surface.GetTextureID(v[2]))
                    surface.DrawTexturedRect(iconx, icony, iconw, iconh)
                    draw.SimpleTextOutlined(ammoc, "RAGE_AmmoFont", iconx+ammox, icony+iconhh, Color(255, 255, yellow, alpha), align, TEXT_ALIGN_CENTER, 2, Color(0, 0, 0, alpha))
                end
            end
        end
    end
    hook.Add("HUDPaint", "Buu_RAGE_AmmoHUD", Buu_RAGE_AmmoHUD)
    

    /*-----------------------------
        Buu_RAGE_ClientsideWingstickThrow
        Receives indication that we're throwing a Wingstick from the server
        @Param The length of incoming network data
        @Param The player to check
    -----------------------------*/

    local function Buu_RAGE_ClientsideWingstickThrow(len, ply)
        LocalPlayer().ThrowingStick = net.ReadFloat()
    end
    net.Receive("Buu_RAGE_ClientsideWingstickThrow", Buu_RAGE_ClientsideWingstickThrow)


    /*-----------------------------
        Buu_RAGE_SendNewModeToClient
        Receives the firemode from the server
        @Param The length of incoming network data
        @Param The player to check
    -----------------------------*/

    local function Buu_RAGE_SendNewModeToClient(len, ply)
        local ammo = net.ReadString()
        local clip = net.ReadInt(32)
        local mag = net.ReadString()
        local wep = LocalPlayer():GetActiveWeapon()
        
        -- Print the ammo switch message
        LocalPlayer():PrintMessage(HUD_PRINTCENTER, "Switching ammo to "..language.GetPhrase(ammo.."_ammo"))
        
        -- If a mag model exists in this weapon mode, then change it
        if (mag != nil) then
            wep.MagModel = mag
        end
        
        -- If we haven't initialize dthe OriginalPrimary information clientside, do so
        if (wep.OriginalPrimary == nil) then
            wep.OriginalPrimary = {}
            wep.OriginalPrimary.Ammo = wep.Primary.Ammo
            wep.OriginalPrimary.ClipSize = wep.Primary.ClipSize
        end
        
        -- Change the weapon's primary data
        wep.Primary.Ammo = ammo
        wep.Primary.ClipSize = clip
        
        -- Call the extra firemode function with the new firemode weapon table
        wep:RAGE_FireModeChangeExtra(wep:GetFireModeTable())
    end
    net.Receive("Buu_RAGE_SendNewModeToClient", Buu_RAGE_SendNewModeToClient)


    /*-----------------------------
        Buu_RAGE_ClearUpgradesClient
        Clears the player's upgrades table 
        @Param The length of incoming network data
        @Param The player to check
    -----------------------------*/

    local function Buu_RAGE_ClearUpgradesClient(len, ply)
        LocalPlayer().Buu_RAGE_UpgradesList = {}
    end
    net.Receive("Buu_RAGE_ClearUpgradesClient", Buu_RAGE_ClearUpgradesClient)
end


if (SERVER) then

    -- Initialize network strings
    util.AddNetworkString("Buu_RAGE_ClientsideWingstickThrow")
    util.AddNetworkString("Buu_RAGE_SendNewModeToClient")
    util.AddNetworkString("Buu_RAGE_ClearUpgradesClient")


    /*-----------------------------
        RAGE_HandleUpgrade
        Allows for adding extra logic when an upgrade
        is received.
    -----------------------------*/

    function SWEP:RAGE_HandleUpgrade()
    end
    

    /*-----------------------------
        RAGE_CheckUpgrade
        Helper function for checking whether we have an upgrade or not
        @Param  The upgrade to check for
        @Return Whether we have the upgrade or not
    -----------------------------*/

    function SWEP:RAGE_CheckUpgrade(upgrade)

        -- If the upgrades table hasn't been initialized yet, then do so
        if (self.Owner.Buu_RAGE_UpgradesList == nil) then
            self.Owner.Buu_RAGE_UpgradesList = {}
        end

        -- Return whether we have the upgrade or not
        return (table.HasValue(self.Owner.Buu_RAGE_UpgradesList, upgrade))
    end


    /*-----------------------------
        RAGE_RemoveUpgrade
        Helper function for removing the upgrade from the player's upgrades table
        @Param The upgrade to remove
    -----------------------------*/

    function SWEP:RAGE_RemoveUpgrade(upgrade)
        table.RemoveByValue(self.Owner.Buu_RAGE_UpgradesList, upgrade)
    end


    /*-----------------------------
        Buu_RAGE_DropUpgradeOnDeath
        Drops all the unattached weapon upgrades on death
        @Param The player who died
    -----------------------------*/

    local function Buu_RAGE_DropUpgradeOnDeath(ply)
        
        -- If the player was carrying upgrades, and we can drop them
        if (GetConVar("sv_buu_rage_dropupgradesondeath"):GetBool() && ply.Buu_RAGE_UpgradesList != nil) then
        
            -- Iterate through the upgrade stack
            for k, v in pairs(ply.Buu_RAGE_UpgradesList) do
            
                -- Drop the upgrade entity on the floor
                local drop = ents.Create(v)
                drop:SetPos(ply:EyePos())
                drop:Spawn()
                
                -- Remove it after some time
                if (GetConVar("sv_buu_rage_droppedupgradetime"):GetInt() > 0) then
                    timer.Simple(GetConVar("sv_buu_rage_droppedupgradetime"):GetInt(), function() if IsValid(drop) then drop:Remove() end end)
                end
            end
        end
        
        -- Clear our the player's upgrade table
        ply.Buu_RAGE_UpgradesList = {}
        net.Start("Buu_RAGE_ClearUpgradesClient")
        net.Send(ply)
    end
    hook.Add("PlayerDeath", "Buu_RAGE_DropUpgrades", Buu_RAGE_DropUpgradeOnDeath)
end