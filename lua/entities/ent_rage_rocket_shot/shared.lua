/**************************************************************
                       Rocket Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

-- Entity information
ENT.Type = "anim"
ENT.Name = "Rocket Projectile"


/*-----------------------------
    Draw
    Draws the entity
-----------------------------*/

function ENT:Draw()
    
    -- Draw the rocket
    self:DrawModel()
    
    -- If we're unpaused, emit a muzzle effect
    --if (!game.SinglePlayer() || !gui.IsGameUIVisible()) then
        --local effectdata = EffectData()
        --effectdata:SetOrigin(self:GetPos())
        --effectdata:SetEntity(self)
        --effectdata:SetAngles(self:GetAttachment(1).Ang)
        --effectdata:SetStart(self:GetPos())
        --effectdata:SetNormal(self:GetAngles():Forward())
        --effectdata:SetAttachment(1)
        --effectdata:SetScale(0.5)
        --util.Effect("MuzzleEffect", effectdata, true, true)
    --end
	
	-- Create a Rocket flare particle, if it doesn't exist
    if (!self.ParticleAttachment) then
        ParticleEffectAttach("rage_eff_rocket_flare", PATTACH_ABSORIGIN_FOLLOW, self, 1)
        self.ParticleAttachment = true
    end
    
    -- If it doesn't exist, create a smoke trail effect
    if (self.RocketSmoke == nil) then
        self.RocketSmoke = EffectData()
        self.RocketSmoke:SetOrigin(self:GetPos())
        self.RocketSmoke:SetEntity(self)
        self.RocketSmoke:SetStart(self:GetPos())
        self.RocketSmoke:SetNormal(self:GetAngles():Forward())
        self.RocketSmoke:SetAttachment(1)
        util.Effect("fx_rage_rocketsmoke", self.RocketSmoke, true, true)    
    end
end