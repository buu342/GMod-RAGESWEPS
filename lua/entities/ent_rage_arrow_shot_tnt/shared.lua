/**************************************************************
                   Dynamite Arrow Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

-- Entity information
ENT.Type = "anim"
ENT.Name = "Dynamite Arrow Projectile"

-- Entity base
ENT.Base = "ent_rage_arrow_shot"


/*-----------------------------
    Draw
    Draws the entity
-----------------------------*/

function ENT:Draw()

    -- Draw the entity's model
    self:DrawModel()
    
    -- Create a fuse trail if it doesn't exist
    if (!self.ParticleAttachment) then
        ParticleEffectAttach("rage_proj_arrow_dynamite_fuse", PATTACH_POINT_FOLLOW, self, 1)
        self.ParticleAttachment = true
    end
    
    -- Create a smoke trail if it doesn't exist
    if (self.SmokeTrail == nil) then
        self.SmokeTrail = EffectData()
        self.SmokeTrail:SetOrigin(self:GetPos())
        self.SmokeTrail:SetEntity(self)
        self.SmokeTrail:SetStart(self:GetPos())
        self.SmokeTrail:SetNormal(self:GetAngles():Forward())
        self.SmokeTrail:SetAttachment(1)
        util.Effect("fx_rage_tntarrow", self.SmokeTrail, true, true)    
    end
end