/**************************************************************
                   Electric Arrow Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile("shared.lua")
include("shared.lua")
DEFINE_BASECLASS("ent_rage_arrow_shot")

-- Arrow settings
ENT.LifeTime       = 5
ENT.DirectDamage   = 50
ENT.ElectricDamage = 10

-- Hit sounds
ENT.HitSound = {
    "rage/weapons/crossbow/impactelectric-01.wav",
    "rage/weapons/crossbow/impactelectric-02.wav",
    "rage/weapons/crossbow/impactelectric-03.wav",
    "rage/weapons/crossbow/impactelectric-04.wav",
    "rage/weapons/crossbow/impactelectric-05.wav"
} 

-- Flesh hit sounds
ENT.HitFleshSound = {
    "rage/weapons/crossbow/impactelectric-01.wav",
    "rage/weapons/crossbow/impactelectric-02.wav",
    "rage/weapons/crossbow/impactelectric-03.wav",
    "rage/weapons/crossbow/impactelectric-04.wav",
    "rage/weapons/crossbow/impactelectric-05.wav"
}

-- Water electric sounds
ENT.WaterSound = {
    "rage/weapons/crossbow/water-01.wav",
    "rage/weapons/crossbow/water-02.wav",
    "rage/weapons/crossbow/water-03.wav",
    "rage/weapons/crossbow/water-04.wav",
    "rage/weapons/crossbow/water-05.wav"
}

-- Model settings
ENT.BodyGroup = 1

-- Electic arrow settings
ENT.DamageCount        = 4
ENT.NextDamageTime     = 0
ENT.DamageTime         = 0.3
ENT.ElecticWaterRadius = 128


/*-----------------------------
    Think
    Handles logic every tick
-----------------------------*/

function ENT:Think()

    -- If we stopped moving
    if (self.Stopped) then
    
        -- And we can damage things
        if (self.DamageCount > 0) then
        
            -- And the damage timer is over
            if (self.NextDamageTime < CurTime()) then
            
                -- If we're not electrocuting for the first time
                if (self.NextDamageTime != 0) then
                    
                    -- If the entity we hit is valid
                    if (self.HitEnt != nil) then
                    
                        -- Damage the entity
                        local dmginfo = DamageInfo()
                        dmginfo:SetDamage(self.ElectricDamage)
                        if (IsValid(self.Owner)) then
                            dmginfo:SetAttacker(self.Owner)
                        end
                        if (IsValid(self.Inflictor)) then
                            dmginfo:SetInflictor(self.Inflictor)
                        end
                        self.HitEnt:TakeDamageInfo(dmginfo)
                        
                        --- Create sparks on the entity we're damaging
                        self:EmitElectricEffect(self.HitEnt)
                    end
                elseif (self:WaterLevel() > 0) then
                
                    -- Emit an electrocution sound effect
                    self:EmitSound(table.Random(self.WaterSound), 70)
                end
                
                -- If we're under water, or we're attached to an entity on water
                if (self:WaterLevel() > 0 || (self.HitEnt != nil && self.HitEnt:WaterLevel() > 0)) then
                
                    -- Find all the entities near us
                    for k, v in pairs(ents.FindInSphere(self:GetPos(), self.ElecticWaterRadius)) do
                    
                        -- If this entity is not the one we're attached to, and they're also on water
                        if (v != self.HitEnt && v:WaterLevel() > 0) then
                        
                            -- Damage the entity
                            local dmginfo = DamageInfo()
                            dmginfo:SetDamage(self.ElectricDamage)
                            if (IsValid(self.Owner)) then
                                dmginfo:SetAttacker(self.Owner)
                            end
                            if (IsValid(self.Inflictor)) then
                                dmginfo:SetInflictor(self.Inflictor)
                            end
                            v:TakeDamageInfo(dmginfo)
                            
                            -- Create sparks on the entity we're damaging
                            self:EmitElectricEffect(v)
                        end
                    end
                    
                    -- Create sparks on ourself
                    self:EmitElectricEffect(self)
                end
                
                -- Lower the damage counter and reset the timer
                self.DamageCount = self.DamageCount - 1
                self.NextDamageTime = CurTime() + self.DamageTime
            end
        end
    end
    
    -- Call the entity base's version of this function
    BaseClass.Think(self)
end


/*-----------------------------
    EmitElectricEffect
    Creates the electricity effect on an entity
    @Param The entity to create the effect on
-----------------------------*/

function ENT:EmitElectricEffect(ent)

    -- If the entity we're creating the effect on is the world, then ignore it
    if (ent:IsWorld()) then return end
    
    -- Create a rain of sparks
    local effectdata = EffectData()
    effectdata:SetOrigin(ent:GetPos())
    effectdata:SetEntity(ent)
    if (IsValid(self:GetAttachment(1))) then
        effectdata:SetNormal(-self:GetAttachment(1).Ang:Up())
    end
    util.Effect("cball_explode", effectdata, true, true)
    
    -- Create an electric effect
    ParticleEffect("rage_proj_arrow_elec_water_explo", ent:GetPos(), ent:GetAngles())
end


/*-----------------------------
    OnRemove
    Called when the entity is removed
-----------------------------*/

function ENT:OnRemove()
    ParticleEffect("rage_proj_arrow_elec_break", self:GetPos(), self:GetAngles())
end