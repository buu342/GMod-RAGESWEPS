/**************************************************************
                        BFG Projectile
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
    
    -- Wake up the physics
    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
        phys:EnableGravity(false)
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
    util.BlastDamage(self.Inflictor, self.Owner, self:GetPos(), 350, 350)
    ParticleEffect("rage_proj_bfg_explo", data.HitPos, data.HitNormal:Angle())
    self:EmitSound("rage/weapons/cannon/bfgexplode.wav", 80)
    
    -- Shake the world around us
    local shake = ents.Create("env_shake")
    shake:SetOwner(self.Owner)
    shake:SetPos(data.HitPos)
    shake:SetKeyValue("amplitude", "16")
    shake:SetKeyValue("radius", "300")
    shake:SetKeyValue("duration", "2.5")
    shake:SetKeyValue("frequency", "255")
    shake:SetKeyValue("spawnflags", "28")
    shake:Spawn()
    shake:Activate()
    shake:Fire("StartShake", "", 0)
    
    -- Create a scorch decal
    local todecal1 = data.HitPos + data.HitNormal
    local todecal2 = data.HitPos - data.HitNormal
    util.Decal("Scorch", todecal1, todecal2)
    
    -- Remove ourselves
    self:Remove()
end


/*-----------------------------
    DisableRAGE_BFGPhysicsDamage
    Disables physics damage from the entity
-----------------------------*/

local function DisableRAGE_BFGPhysicsDamage(ent, dmginfo)
    if (IsValid(dmginfo:GetInflictor()) && dmginfo:GetInflictor():GetClass() == "ent_rage_bfg_shot") then
        dmginfo:SetDamage(0)
    end
end
hook.Add("EntityTakeDamage", "DisableRAGE_BFGPhysicsDamage", DisableRAGE_BFGPhysicsDamage)