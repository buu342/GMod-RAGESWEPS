/**************************************************************
                     Pulse Shot Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile("shared.lua")
include("shared.lua")


/*-----------------------------
    Initialize
    Called when the entity is created.
-----------------------------*/

local size = 0.25
function ENT:Initialize()

    -- Initialize the model and physics
    self:SetModel("models/weapons/w_rage_crossbow_arrow.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:DrawShadow(false)
    self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)
    
    -- Wake up the physics
    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
        phys:EnableGravity(false)
        phys:SetBuoyancyRatio(0)
    end
    
    -- Setup the collision bounds
    self:SetCollisionBounds(Vector(-size, -size, -size), Vector(size, size, size))
    
    -- Create a trail
    util.SpriteTrail(self, 0, Color(50, 150, 255), true, 10, 0, 0.5, 0.01, "trails/electric")
    
    -- Destroy the entity after some time has passed
    timer.Simple(10, function() if IsValid(self) then self:Remove() end end)
end


/*-----------------------------
    PhysicsCollide
    Handles logic when the entity collides with something
    @Param The collision data
    @Param The physics object we collided with
-----------------------------*/

-- Blacklist of "mechanical" entities
local BlastList = {
    "npc_rollermine",
    "npc_strider",
    "npc_combinedropship",
    "npc_combinegunship",
    "npc_attackchopper",
    "phys_bone_follower",
}
function ENT:PhysicsCollide(data, collider)
    
    -- Correct for any invalid entities
    if (!IsValid(self.Inflictor)) then self.Inflictor = self end
    if (!IsValid(self.Owner)) then self.Owner = self end

    -- If we hit an entity
    if (data.HitEntity != nil && IsValid(data.HitEntity)) then
    
        -- Initialize a damageinfo object
        local dmginfo = DamageInfo()
        dmginfo:SetDamage(75)
        dmginfo:SetDamageType(DMG_SHOCK)
        dmginfo:SetAttacker(self.Owner)
        dmginfo:SetInflictor(self.Inflictor)
        
        -- If we hit something in our blacklist, set the damagetype to blast and perform blastdamage
        if (table.HasValue(BlastList, data.HitEntity:GetClass())) then
            dmginfo:SetDamageType(DMG_BLAST)
            util.BlastDamageInfo(dmginfo, data.HitPos, 200)
        elseif data.HitEntity:GetClass() == "npc_turret_floor" then
        
            -- If we hit a turret, send it flying
            dmginfo:SetDamageForce(self:GetVelocity():GetNormalized()*1000)
        end
        
        -- Make the entity take damage
        data.HitEntity:TakeDamageInfo(dmginfo)
    end
    
    -- Create a lot of sparks
    local effectdata = EffectData()
    effectdata:SetOrigin(data.HitPos)
    effectdata:SetNormal(data.HitNormal)
    effectdata:SetScale(10)
    util.Effect("cball_explode", effectdata, true, true)
    
    
    -- Leave a scorch behind
    local todecal1 = data.HitPos + data.HitNormal
    local todecal2 = data.HitPos - data.HitNormal
    util.Decal("FadingScorch", todecal1, todecal2)
    
    -- Destroy ourselves
    self:Remove()
end


/*-----------------------------
    DisableRAGE_PulsePhysicsDamage
    Disables physics damage from the entity
-----------------------------*/

local function DisableRAGE_PulsePhysicsDamage(ent, dmginfo)
    if IsValid(dmginfo:GetInflictor()) && (dmginfo:GetInflictor():GetClass() == "ent_rage_pulse_shot") then
        dmginfo:SetDamage(0)
    end
end
hook.Add("EntityTakeDamage", "DisableRAGE_PulsePhysicsDamage", DisableRAGE_PulsePhysicsDamage)