/**************************************************************
                   Dynamite Arrow Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile("shared.lua")
include("shared.lua")
DEFINE_BASECLASS("ent_rage_arrow_shot")

-- Arrow settings
ENT.LifeTime     = 3
ENT.DirectDamage = 25
ENT.LoopSound    = "rage/weapons/crossbow/fuse.wav"

-- Model settings
ENT.BodyGroup = 2


/*-----------------------------
    OnRemove
    Called when the entity is removed
-----------------------------*/

function ENT:OnRemove()

    -- Create an explosion
    util.BlastDamage(self.Inflictor, self.Owner, self:GetPos(), 200, 80) 
    ParticleEffect("rage_eff_explo", self:GetPos(), self:GetAngles())
    self:EmitSound("rage/weapons/grenade/explode-0"..math.random(1,5)..".wav", 100)
    
    -- Leave behind a scorch
    if (self.HitPosAng != nil) then
        local todecal1 = self.HitPosAng[1] + self.HitNormal
        local todecal2 = self.HitPosAng[1] - self.HitNormal
        util.Decal("Scorch", todecal1, todecal2)
    end
    
    -- Stop the fuse looping sound
    if (self.LoopSound != nil) then
        self.LoopSound:Stop()
        self.LoopSound = nil
    end
    
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
end