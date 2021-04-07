/**************************************************************
                       Arrow Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile("shared.lua")
include("shared.lua")

-- Arrow settings
ENT.LifeTime     = 30
ENT.DirectDamage = 50
ENT.LoopSound    = nil

-- Hit sounds
ENT.HitSound = {
    "rage/weapons/crossbow/hitstuff-01.wav",
    "rage/weapons/crossbow/hitstuff-02.wav",
}

-- Flesh hit sounds
ENT.HitFleshSound = {
    "rage/weapons/crossbow/hitflesh-01.wav",
    "rage/weapons/crossbow/hitflesh-02.wav",
    "rage/weapons/crossbow/hitflesh-03.wav",
    "rage/weapons/crossbow/hitflesh-04.wav",
}

-- Model settings
ENT.Model = "models/weapons/w_rage_crossbow_arrow.mdl"
ENT.BodyGroup    = 0


/*-----------------------------
    Initialize
    Called when the entity is created.
-----------------------------*/

local size = 0.25
function ENT:Initialize()

    -- Initialize the model and physics
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:DrawShadow(false)
    self:SetBodygroup(0, self.BodyGroup)
    
    -- Wake up the physics
    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
        phys:EnableGravity(false)
        phys:SetBuoyancyRatio(0)
    end
    
    -- Setup the collison boxes
    self:SetCollisionBounds(Vector(-size, -size, -size), Vector(size, size, size))
    
    -- Initialize variables that we're going to use
    self.DoDamage = true
    self.HitEnt = nil
    self.HitPosAng = nil
    self.HitNormal = nil
    self.Stopped = false
    self.StartPos = self:GetPos()
    
    -- Start a looping sound if it exists
    if (self.LoopSound != nil) then
        local filter = RecipientFilter()
        filter:AddAllPlayers()
        self.LoopSound = CreateSound(self, self.LoopSound, filter)
        self.LoopSound:SetSoundLevel(60)
        self.LoopSound:Play()
    end
    
    -- Destroy the arrow entity after some time has passed
    timer.Simple(self.LifeTime or 10, function() if IsValid(self) then self:Remove() end end)
end


/*-----------------------------
    Think
    Handles logic every tick
-----------------------------*/

function ENT:Think()

    -- If we collided against something
    if (!self.DoDamage && SERVER) then
    
        -- Stop moving if we haven't already
        if (!self.Stopped) then
            local phys = self:GetPhysicsObject()
            phys:Wake()  
            phys:EnableGravity(false) 
            self:SetMoveType(MOVETYPE_NONE)
            self:PhysicsInit(SOLID_NONE)
            self.Stopped = true
        end
        
        -- If we didn't hit the world
        if (self.HitEnt != nil && !self.HitEnt:IsWorld()) then
        
            -- Parent ourselves to the entity we hit
            self:SetParent(self.HitEnt)
        else
        
            -- Otherwise, set our position to where we collided
            self:SetPos(self.HitPosAng[1])
            self:SetAngles(self.HitPosAng[2])
        end
    end
    
    -- If the entity we're attached to is dead, destroy ourselves
    if (self.HitEnt != nil && IsValid(self.HitEnt) && ((self.HitEnt:IsNPC() && self.HitEnt:Health() <= 0) || (self.HitEnt:IsPlayer() && !self.HitEnt:Alive()))) then
        self:Remove()
    end
end


/*-----------------------------
    PhysicsCollide
    Handles logic when the entity collides with something
    @Param The collision data
    @Param The physics object we collided with
-----------------------------*/

function ENT:PhysicsCollide(data, collider)

    -- If we can deal damage
    if (self.DoDamage) then
        self.DoDamage = false
        
        -- Initialize some useful variables
        local scale = 1
        local dir = (data.HitPos-self:GetPos()):GetNormalized()
        
        -- Store info on what we collided against
        self.HitEnt = data.HitEntity
        self.HitNormal = data.HitNormal
        self.HitPosAng = {data.HitPos, self:GetAngles()}

        -- Create a bullet so that there's impact effects
        local bullet    = {}
        bullet.Num      = 1
        bullet.Src      = self:GetPos()
        bullet.Dir      = dir
        bullet.Spread   = Vector(0, 0, 0)
        bullet.Tracer   = 0
        bullet.Force    = 0
        bullet.Damage   = 1
        self:FireBullets(bullet)
        
        -- If we hit an entity
        if (data.HitEntity != nil && IsValid(data.HitEntity) && !data.HitEntity:IsWorld()) then
            
            -- Create a damageinfo object
            local dmginfo = DamageInfo()
            
            -- Create a trace to see if hit a head, and if we did, double the damage
            local tr = {
                start = data.HitPos,
                endpos = data.HitPos + dir*32,
                filter = self
            }
            if (util.TraceLine(tr).HitGroup  == HITGROUP_HEAD) then
                scale = 2
            end
            
            -- Setup the damageinfo object and apply damage to what we hit
            dmginfo:SetDamage(self.DirectDamage*scale)
            dmginfo:SetAttacker(self.Owner)
            dmginfo:SetInflictor(self.Inflictor)
            dmginfo:SetDamageForce(data.OurOldVelocity:GetNormalized()*self.DirectDamage*100)
            data.HitEntity:TakeDamageInfo(dmginfo)
            
            -- Due to how entity inheritance works, this removes a useless table that gets appended to the end of our sound table 
            if (self.HitFleshSound.BaseClass != nil) then self.HitFleshSound.BaseClass = nil end
            
            -- Emit the hit sound
            self:EmitSound(table.Random(self.HitFleshSound), 55)
        else
            if (self.HitSound.BaseClass != nil) then self.HitSound.BaseClass = nil end
            self:EmitSound(table.Random(self.HitSound), 55)
        end
    end
end


/*-----------------------------
    DisableRAGE_ArrowPhysicsDamage
    Disables physics damage from the entity
-----------------------------*/

local function DisableRAGE_ArrowPhysicsDamage(ent, dmginfo)
    if IsValid (dmginfo:GetInflictor()) && (dmginfo:GetInflictor():GetClass() == "ent_rage_arrow_shot" || dmginfo:GetInflictor().Base == "ent_rage_arrow_shot") then
        dmginfo:SetDamage(0)
    end
end
hook.Add("EntityTakeDamage", "DisableRAGE_ArrowPhysicsDamage", DisableRAGE_ArrowPhysicsDamage)