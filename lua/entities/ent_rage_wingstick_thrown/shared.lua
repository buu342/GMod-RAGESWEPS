/**************************************************************
                     Wingstick Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

-- Entity information
ENT.Type = "anim"
ENT.Name = "Thrown Wingstick"

-- Create a killicon
if (CLIENT) then
    killicon.Add("ent_rage_wingstick_thrown", "VGUI/entities/ent_rage_pickup_ammo_wingstick", Color(255, 255, 255))
end


/*-----------------------------
    Buu_RAGE_DecapWingstick
    Decapitates the ragdoll of the entity we hit
-----------------------------*/

function Buu_RAGE_DecapWingstick()
    local pos = net.ReadVector()
    local mdl = net.ReadString()
    
    -- Look around us
    for k, v in pairs(ents.FindInSphere(pos, 64)) do
    
        -- If we found a ragdoll that matches the entity that we killed
        if (IsValid(v) && v:IsRagdoll() && v:LookupBone("ValveBiped.Bip01_Head1") != nil && v:GetModel() == mdl) then
        
            -- Create a blood fountain
            timer.Create("BloodSpray"..tostring(v), 0.05, 20, function()
                if !IsValid(v) then return end
                local attachment = v:LookupBone("ValveBiped.Bip01_Head1")
                local position, angles = v:GetBonePosition( attachment )
                local effectdata = EffectData()
                effectdata:SetOrigin(position)
                effectdata:SetAngles(angles)
                effectdata:SetFlags(3)
                effectdata:SetScale(4)
                effectdata:SetColor(0)
                util.Effect( "bloodspray", effectdata )
            end)
            
            -- Shrink the head
            v:ManipulateBoneScale(v:LookupBone("ValveBiped.Bip01_Head1"), Vector(0,0,0))
        end
    end
end
net.Receive("Buu_RAGE_DecapWingstick", Buu_RAGE_DecapWingstick)