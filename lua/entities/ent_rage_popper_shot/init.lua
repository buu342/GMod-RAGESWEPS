/**************************************************************
                     Pop Rocket Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile("shared.lua")
include("shared.lua")


/*-----------------------------
    Initialize
    Called when the entity is created.
-----------------------------*/

function ENT:Initialize()

    -- Initialize the model and physics
    self:SetModel("models/weapons/w_rage_rocketlauncher_rocket.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:DrawShadow(false)
    self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE_DEBRIS)
    
    -- Wake up the physics
    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
        phys:EnableGravity(true)
        phys:SetBuoyancyRatio(0)
    end
end


/*-----------------------------
    PhysicsCollide
    Handles logic when the entity collides with something
    @Param The collision data
    @Param The physics object we collided with
-----------------------------*/

function ENT:PhysicsCollide(data, collider)

    -- Correct for any invalid entities
    if (!IsValid(self.Inflictor)) then self.Inflictor = self end
    if (!IsValid(self.Owner)) then self.Owner = self end
    
    -- Create an explosion
    util.BlastDamage(self.Inflictor, self.Owner, self:GetPos(), 80, 150)
    ParticleEffect("rage_eff_explo", self:GetPos(), self:GetAngles())
    self:EmitSound("rage/weapons/shotgun/explosion-0"..math.random(1, 7)..".wav", 100)
    
    -- Leave a scorch on the floor
    local todecal1 = data.HitPos + data.HitNormal
    local todecal2 = data.HitPos - data.HitNormal
    util.Decal("Scorch", todecal1, todecal2)
    
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
    
    -- Remove ourselves
    self:Remove()
end


/*-----------------------------
    DisableRAGE_PopperPhysicsDamage
    Disables physics damage from the entity
-----------------------------*/

local function DisableRAGE_PopperPhysicsDamage(ent, dmginfo)
    if IsValid(dmginfo:GetInflictor()) && (dmginfo:GetInflictor():GetClass() == "ent_rage_popper_shot") then
        dmginfo:SetDamage(0)
    end
end
hook.Add("EntityTakeDamage", "DisableRAGE_PopperPhysicsDamage", DisableRAGE_PopperPhysicsDamage)