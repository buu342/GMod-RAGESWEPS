/**************************************************************
                 Mind Control Arrow Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

DEFINE_BASECLASS("ent_rage_arrow_shot")

-- Entity information
ENT.Type = "anim"
ENT.Name = "Shot Arrow Mind Control"

-- Entity Base
ENT.Base = "ent_rage_arrow_shot"


/*-----------------------------
    Think
    Handles logic every tick
-----------------------------*/

local ExplodeTime = 10
function ENT:Think()

    -- Initialize the ExplodeTimeLeft variable
    if (self.ExplodeTimeLeft == nil) then
        self.ExplodeTimeLeft = 0
    end

    -- If we hit a mind-controllable entity, and we have damage disabled
    if (IsValid(self.Owner) && IsValid(self.HitEnt) && (self.HitEnt:IsNPC() || (self.HitEnt:IsPlayer() && GetConVar("sv_buu_rage_mindcontrolplayers"):GetBool())) && !IsValid(self.Owner:GetNWEntity("Buu_RAGE_MindControlling")) && self.DirectDamage == 0) then
        
        -- Force the arrow's owner to start driving this entity
        drive.PlayerStartDriving(self.Owner, self.HitEnt, "drive_rage_mindcontrol")
        self.Owner:SetNWEntity("Buu_RAGE_MindControlling", self.HitEnt)
        
        -- Start the explosion timer
        self.ExplodeTimeLeft = CurTime()+ExplodeTime
        
        -- If we hit a player, freeze them
        if (self.HitEnt:IsPlayer()) then
            self.HitEnt:Freeze(true)
        end
    end
    
    -- If we're going to explode, then set our position to the center of the entity we're attched to
    if (self.Owner:GetNWEntity("Buu_RAGE_MindControlling").Detonate || (self.ExplodeTimeLeft != 0 && self.ExplodeTimeLeft < CurTime())) then
        self.Owner:GetNWEntity("Buu_RAGE_MindControlling").Detonate = false
        if (SERVER) then
            self:SetPos(self.Owner:GetNWEntity("Buu_RAGE_MindControlling"):GetPos()+Vector(0,0,self.Owner:GetNWEntity("Buu_RAGE_MindControlling"):BoundingRadius()/2))
            self:Remove()
        end
    end
    
    -- If our owner died, stop driving
    if (IsValid(self.Owner) && !self.Owner:Alive()) then
        self.Owner:SetNWEntity("Buu_RAGE_MindControlling", nil)
        drive.PlayerStopDriving(self.Owner)
    end
    
    -- Call the entity base's version of this function
    self.BaseClass.Think(self)
end


/*-----------------------------
    OnRemove
    Called when the entity is removed
-----------------------------*/

function ENT:OnRemove()

    -- If we have a valid owner
    if (IsValid(self.Owner)) then
        
        -- If this arrow was being used for mind control
        if (IsValid(self.Owner:GetNWEntity("Buu_RAGE_MindControlling")) && self.DirectDamage == 0) then
        
            -- Stop driving
            self.Owner:SetNWEntity("Buu_RAGE_MindControlling", nil)
            drive.PlayerStopDriving(self.Owner)
            
            -- Explode
            util.BlastDamage(self.Inflictor, self.Owner, self:GetPos(), 256, 200) 
            ParticleEffect("rage_eff_explo", self:GetPos(), self:GetAngles())
            self:EmitSound("rage/weapons/grenade/explode-0"..math.random(1,5)..".wav", 100)
            
            -- Shake the world around us
            local shake = ents.Create("env_shake")
            shake:SetOwner(self.Owner)
            shake:SetPos(self:GetPos())
            shake:SetKeyValue("amplitude", "16")
            shake:SetKeyValue("radius", "256")
            shake:SetKeyValue("duration", "1")
            shake:SetKeyValue("frequency", "255")
            shake:SetKeyValue("spawnflags", "28")
            shake:Spawn()
            shake:Activate()
            shake:Fire("StartShake", "", 0)
            
            -- Create a big explosion that pushes props, ragdolls, and rope around
            local explode = ents.Create("env_explosion")
            explode:SetPos(self:GetPos())
            explode:SetOwner(self.Owner)
            explode:Spawn()
            explode:SetKeyValue("iMagnitude", "196")
            explode:SetKeyValue("spawnflags", "853")
            explode:Fire("Explode")
            
            -- If we were attached to a player, unfreeze them
            if (IsValid(self.HitEnt) && self.HitEnt:IsPlayer()) then
                self.HitEnt:Freeze(false)
            end
        end
    elseif (self.DirectDamage == 0) then
    
        -- If we were attached to a player, unfreeze them
        if (IsValid(self.HitEnt) && self.HitEnt:IsPlayer()) then
            self.HitEnt:Freeze(false)
        end
    end
end


drive.Register("drive_rage_mindcontrol", 
{

    /*-----------------------------
        Init
        Called when the driving begins
    -----------------------------*/
    
    Init = function(self)
        self.Entity.Detonate = false
    end,


    /*-----------------------------
        StartMove
        Converts user commands into move
    -----------------------------*/

    StartMove = function(self, mv, cmd)
    
        -- Make the player chase this entity
        self.Player:SetObserverMode(OBS_MODE_CHASE)
        
        -- If we're driving an NPC, freeze it, otherwise get the player's data
        if (self.Entity:IsNPC()) then
            if (SERVER) then
                self.Entity:SetSchedule(SCHED_NPC_FREEZE)
            end
        else
            mv:SetOrigin(self.Entity:GetNetworkOrigin())
            mv:SetVelocity(self.Entity:GetAbsVelocity())
            mv:SetMoveAngles(mv:GetAngles())
            mv:SetAngles(mv:GetAngles())
        end
        
        -- If we pressed left click, explode
        if (mv:KeyPressed(IN_ATTACK)) then
            self.Entity.Detonate = true
        end
    end,
    
    
    /*-----------------------------
        Move
        Actually performs the movement
    -----------------------------*/
    
    Move = function(self, mv)
    
        -- If we're attached to an NPC
        if (self.Entity:IsNPC()) then
            local pos = self.Entity:GetPos()
            local ang = self.Entity:GetAngles()
            
            -- Set where we want to go
            pos = pos + ang:Forward()*mv:GetForwardSpeed()/100 + ang:Right()*mv:GetSideSpeed()/100
            
            -- Stop the current NPC logic
            if (SERVER) then
                self.Entity:ClearGoal()
                self.Entity:ClearEnemyMemory()
                self.Entity:ClearSchedule()
            end
            
            -- Make it go where we want
            self.Entity:SetSaveValue("m_vecLastPosition", pos)
            self.Entity:SetSaveValue("m_bIsMoving", true)
            if (SERVER) then
                self.Entity:SetSchedule(SCHED_FORCED_GO)
            end
        else
            local ang = self.Entity:GetAngles()
            local pos = mv:GetOrigin()
            local vel = Vector(0, 0, 0)
            
            -- Move the player where we want
            vel = vel + ang:Forward()*mv:GetForwardSpeed()
            vel = vel + ang:Right()*mv:GetSideSpeed()        
            vel = vel + ang:Up()*mv:GetUpSpeed()        
            self.Entity:SetVelocity(vel*0.001)
        end
    end,
}, "drive_base" )


if (CLIENT) then

    /*-----------------------------
        Buu_RAGE_MindControllingCalcView
        Modifies the player's view. 
        Supposedly this should work inside the drive, but it doesn't...
        @Param  The player
        @Param  The view position
        @Param  The view angles
        @Param  The view FOV
        @Return The final view table
    -----------------------------*/

    local function Buu_RAGE_MindControllingCalcView(ply, pos, angles, fov)
    
        -- If we're mind controlling something
        if (IsValid(ply:GetNWEntity("Buu_RAGE_MindControlling")) && ply:IsDrivingEntity()) then
        
            -- Set our view to be behind the entity, and return the view table
            local view = {
                origin = pos - (angles:Forward()*100) + Vector(0, 0, ply:GetNWEntity("Buu_RAGE_MindControlling"):BoundingRadius()),
                angles = Angle(angles.p, angles.y, 0),
                fov = fov,
                drawviewer = true
            }
            return view
        end
    end
    hook.Add("CalcView", "Buu_RAGE_MindControllingCalcView", Buu_RAGE_MindControllingCalcView)


    /*-----------------------------
        Buu_RAGE_MindControlHUD
        Draws the mind control HUD
    -----------------------------*/

    -- Initialize some static variables
    local wratio = ScrW()/1600
    local hratio = ScrH()/900
    local hudw = 500*wratio
    local hudh = 48*hratio
    local hudwh = hudw/2
    local hudx = ScrW()/2-hudwh
    local hudy = ScrH()-hudh-48*hratio
    local time = 0
    local function Buu_RAGE_MindControlHUD()
    
        -- If we're mind controlling something
        if (IsValid(LocalPlayer():GetNWEntity("Buu_RAGE_MindControlling")) && LocalPlayer():IsDrivingEntity()) then
            if (time == 0) then
                time = CurTime()+ExplodeTime
            end
            local timeleft = math.max(0, 1-((time-CurTime())/ExplodeTime))
            
            -- Draw the back of our time rectangle
            surface.SetDrawColor(0, 0, 0, 255)
            surface.DrawRect(hudx, hudy, hudw, hudh)
            
            -- Draw the time left in white
            surface.SetDrawColor(255, 255, 255, 255)
            surface.DrawRect(hudx+2+hudwh*timeleft, hudy+2, hudw-hudw*timeleft-4, hudh-4)
        elseif (time != 0) then
            time = 0
        end
    end
    hook.Add("HUDPaint", "Buu_RAGE_MindControlHUD", Buu_RAGE_MindControlHUD)


    /*-----------------------------
        Buu_RAGE_MindControlBlackWhite
        Make the screen black and white if we're mind controlling something
    -----------------------------*/

    local blackwhite = {
        [ "$pp_colour_addr" ] = 0,
        [ "$pp_colour_addg" ] = 0,
        [ "$pp_colour_addb" ] = 0,
        [ "$pp_colour_brightness" ] = 0,
        [ "$pp_colour_contrast" ] = 1,
        [ "$pp_colour_colour" ] = 0,
        [ "$pp_colour_mulr" ] = 0,
        [ "$pp_colour_mulg" ] = 0,
        [ "$pp_colour_mulb" ] = 0
    }
    local function Buu_RAGE_MindControlBlackWhite()
        if (IsValid(LocalPlayer():GetNWEntity("Buu_RAGE_MindControlling")) && LocalPlayer():IsDrivingEntity()) then
            DrawColorModify(blackwhite)
        end
    end
    hook.Add("RenderScreenspaceEffects", "Buu_RAGE_MindControlBlackWhite", Buu_RAGE_MindControlBlackWhite)
end