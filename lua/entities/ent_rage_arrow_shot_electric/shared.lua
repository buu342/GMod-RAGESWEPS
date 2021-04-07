/**************************************************************
                   Electric Arrow Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

-- Entity information
ENT.Type = "anim"
ENT.Name = "Electric Arrow Projectile"

-- Entity base
ENT.Base = "ent_rage_arrow_shot"


/*-----------------------------
    Draw
    Draws the entity
-----------------------------*/

function ENT:Draw()

    -- Draw the entity's model
    self:DrawModel()
    
    -- Create an electricity trail if it doesn't exist
    if (!self.ParticleAttachment) then
        ParticleEffectAttach("rage_proj_arrow_elec_trail", PATTACH_POINT_FOLLOW, self, 1)
        self.ParticleAttachment = true
    end
end