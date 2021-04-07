/**************************************************************
                 Mind Control Arrow Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile("shared.lua")
include("shared.lua")
DEFINE_BASECLASS("ent_rage_arrow_shot")

-- Arrow settings
ENT.DirectDamage = 25

-- Model settings
ENT.BodyGroup = 3


/*-----------------------------
    PhysicsCollide
    Handles logic when the entity collides with something
    @Param The collision data
    @Param The physics object we collided with
-----------------------------*/

function ENT:PhysicsCollide(data, collider)

    -- If we were going to kill what we hit, then don't do any damage to it
    if (((data.HitEntity:IsPlayer() && GetConVar("sv_buu_rage_mindcontrolplayers"):GetBool()) || data.HitEntity:IsNPC()) && data.HitEntity:Health() <= self.DirectDamage) then
        self.DirectDamage = 0
    end
    
    -- Call the entity base's version of this function
    BaseClass.PhysicsCollide(self, data, collider)
end