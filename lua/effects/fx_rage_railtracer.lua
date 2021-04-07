/**************************************************************
                     Railgun Tracer Effect
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/


/*-----------------------------
    Init
    Called when the effect is created.
    @Param The effect data used to create the effect
-----------------------------*/

function EFFECT:Init(data)
    
    -- Get the start position from the data
    self.StartPos = data:GetStart()
    self.EndPos = data:GetOrigin()

    -- Get the entity its attachment from the data
    self.Ent = data:GetEntity()
    self.Att = data:GetAttachment()
    
    -- If we have somewhere to attach
    if (IsValid(self.Ent) && self.Att > 0) then
    
        -- Set the attachment to the viewmodel, if in firstperson
        if (self.Ent.Owner == LocalPlayer() && !LocalPlayer():ShouldDrawLocalPlayer()) then 
            self.Ent = self.Ent.Owner:GetViewModel() 
        end

        -- Set the attachment data from the entity's attachment info
        self.Att = self.Ent:GetAttachment(self.Att)
        
        -- If the attachment exists, then set the start position to that attachment
        if (self.Att) then
            self.StartPos = self.Att.Pos
        end
    end
    
    -- If we're in thirdperson and the attachment is the viewmodel, then don't draw
    if (LocalPlayer():ShouldDrawLocalPlayer() && self.Ent == self.Ent.Owner:GetViewModel()) then return end

    -- Create the railgun attachment and set its settings
    local particle = CreateParticleSystem(self.Ent, "rage_proj_nailgun_rail", PATTACH_POINT, att)
    if (IsValid(particle)) then
        particle:SetControlPoint(0, self.StartPos)
        particle:SetControlPoint(1, self.EndPos)
        particle:StartEmission()
    end
    
    -- Destroy the railgun particle after some time
    timer.Simple(3, function()
        if (IsValid(particle)) then
            particle:StopEmissionAndDestroyImmediately()
        end
    end)
end


/*-----------------------------
    Think
    Handles effect logic every tick
    @Return Whether the effect should live
-----------------------------*/

function EFFECT:Think()
	return false
end


/*-----------------------------
    Render
    Renders the effect
-----------------------------*/

function EFFECT:Render()
end