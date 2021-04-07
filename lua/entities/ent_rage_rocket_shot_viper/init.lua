/**************************************************************
                    Viper Rocket Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile("shared.lua")
include("shared.lua")
DEFINE_BASECLASS("ent_rage_rocket_shot")


/*-----------------------------
    Initialize
    Called when the entity is created.
-----------------------------*/

function ENT:Initialize()

    -- If the weapon we were fired from had a target, then store it
    if (IsValid(self.Inflictor) && self.Inflictor:GetBuu_Rage_ViperTarget() != NULL) then
        self.Target = self.Inflictor:GetBuu_Rage_ViperTarget()
    else
        self.Target = NULL
    end
    
    -- Call the entity base's version of this function
    BaseClass.Initialize(self)
end


/*-----------------------------
    Think
    Handles logic every tick
-----------------------------*/

function ENT:Think()

    -- If we have a target
    if (self.Target != NULL) then
    
        -- Move in the direction of the target
        local phys = self:GetPhysicsObject()
        if (IsValid(self.Target) && (self.Target:IsVehicle() || self.Dir == nil)) then
            self.Dir = self.Target:GetPos()-self:GetPos()
            self.Dir:Normalize()
        end
        phys:ApplyForceCenter(self.Dir*10000)
    end
end