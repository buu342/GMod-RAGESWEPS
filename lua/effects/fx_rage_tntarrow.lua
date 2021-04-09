/**************************************************************
                 Dynamite Arrow Tracer Effect
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/


/*-----------------------------
    Init
    Called when the effect is created.
    @Param The effect data used to create the effect
-----------------------------*/

function EFFECT:Init(data)

    -- Initialize the rendermode and get the entity+attachment info
    self:SetRenderMode(RENDERMODE_TRANSALPHA)
    self.Ent = data:GetEntity()
    self.Attachment = data:GetAttachment()
    
    -- If the entitiy we're attaching to doesn't exist, then stop
    if (!IsValid(self.Ent)) then return end
    
    -- Set the position to the entity's attachment
    self.Position = self:GetTracerShootPos(data:GetOrigin(), self.Ent, self.Attachment)
    
    -- Get the effect's angles
    self.Forward = data:GetNormal()
    self.Angle = self.Forward:Angle()

    -- Create a particle emitter
    self.Emitter = ParticleEmitter(self.Position)
end


/*-----------------------------
    Think
    Handles effect logic every tick
    @Return Whether the effect should live
-----------------------------*/

function EFFECT:Think()

    -- If our attached entity doesn't exist anymore, or it's not flying anymore, then kill the effect
    if (!IsValid(self.Ent) || self.Ent:GetMoveType() == MOVETYPE_NONE) then
        self.Emitter:Finish()
        return false
    end
    
    -- If the game isn't paused
    if (!game.SinglePlayer() || !gui.IsGameUIVisible()) then
    
        -- Update the position
        self.Position = self.Ent:GetPos()
        
        -- Emit particles
        local particle = self.Emitter:Add("particle/particle_smokegrenade", self.Position)
        particle:SetDieTime(math.Rand(1, 3))
        particle:SetStartAlpha(math.Rand(50, 100))
        particle:SetStartSize(math.random(1, 5))
        particle:SetEndSize(math.Rand(2, 3))
        particle:SetRoll(math.Rand(180, 480))
        particle:SetRollDelta(math.Rand(-1, 1))
        particle:SetColor(100, 100, 90)
        particle:SetAirResistance(140)
    end
    
    -- Return true to keep living    
    return true
end


/*-----------------------------
    Render
    Renders the effect
-----------------------------*/

function EFFECT:Render()
end