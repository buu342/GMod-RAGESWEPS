/**************************************************************
                        BFG Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

-- Entity information
ENT.Type = "anim"
ENT.Name = "BFG Projectile"


/*-----------------------------
    Draw
    Draws the entity
-----------------------------*/

function ENT:Draw()

    -- Create a BFG ball particle, if it doesn't exist
    if (!self.ParticleAttachment) then
        ParticleEffectAttach("rage_proj_bfg_sphere", PATTACH_ABSORIGIN_FOLLOW, self, 1)
        self.ParticleAttachment = true
    end
end