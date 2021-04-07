/**************************************************************
                       Rocket Projectile
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
    
    -- Emit a rocket flying sound
    self:EmitSound("rage/weapons/rocketlauncher/rocket.wav")
end


/*-----------------------------
    PhysicsCollide
    Handles logic when the entity collides with something
    @Param The collision data
    @Param The physics object we collided with
-----------------------------*/

function ENT:PhysicsCollide(data, collider)

    -- Create an explosion
    util.BlastDamage(self.Inflictor, self.Owner, self:GetPos(), 300, 150)
    ParticleEffect("rage_eff_explo_large", data.HitPos, data.HitNormal:Angle())
    self:EmitSound("rage/weapons/rocketlauncher/explode-0"..math.random(1, 6)..".wav", 100)
    
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
    
    -- Create a big explosion that pushes props, ragdolls, and rope around
    local explode = ents.Create("env_explosion")
	explode:SetPos(data.HitPos)
	explode:SetOwner(self.Owner)
	explode:Spawn()
	explode:SetKeyValue("iMagnitude", "220")
	explode:SetKeyValue("spawnflags", "853")
	explode:Fire("Explode")
    
    -- Leave a scorch on the floor
    local todecal1 = data.HitPos + data.HitNormal
    local todecal2 = data.HitPos - data.HitNormal
    util.Decal("Scorch", todecal1, todecal2)
    
    -- Remove ourself
    self:Remove()
end


/*-----------------------------
    DisableRAGE_RocketPhysicsDamage
    Disables physics damage from the entity
-----------------------------*/

local function DisableRAGE_RocketPhysicsDamage(ent, dmginfo)
    if IsValid(dmginfo:GetInflictor()) && (dmginfo:GetInflictor():GetClass() == "ent_rage_rocket_shot" || dmginfo:GetInflictor().Base == "ent_rage_rocket_shot") then
        dmginfo:SetDamage(0)
    end
end
hook.Add("EntityTakeDamage", "DisableRAGE_RocketPhysicsDamage", DisableRAGE_RocketPhysicsDamage)
