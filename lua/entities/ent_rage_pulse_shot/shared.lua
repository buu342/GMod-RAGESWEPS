/**************************************************************
                     Pulse Shot Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

-- Entity information
ENT.Type = "anim"
ENT.Name = "Pulse Shot Projectile"


/*-----------------------------
    Draw
    Draws the entity
-----------------------------*/

function ENT:Draw()
    
    -- If it doesn't exist, create a pulse trail effect
    if (self.PulseTrail == nil) then
        self.PulseTrail = EffectData()
        self.PulseTrail:SetOrigin(self:GetPos())
        self.PulseTrail:SetEntity(self)
        self.PulseTrail:SetStart(self:GetPos())
        self.PulseTrail:SetNormal(self:GetAngles():Forward())
        self.PulseTrail:SetAttachment(1)
        util.Effect("fx_rage_pulseshot", self.PulseTrail, true, true)    
    end
end