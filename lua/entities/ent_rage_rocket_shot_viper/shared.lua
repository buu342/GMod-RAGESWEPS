/**************************************************************
                    Viper Rocket Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

DEFINE_BASECLASS("ent_rage_rocket_shot")

-- Entity information
ENT.Type = "anim"
ENT.Name = "Shot Viper"

-- Entity Base
ENT.Base = "ent_rage_rocket_shot"


/*-----------------------------
    Draw
    Draws the entity
-----------------------------*/

function ENT:Draw()

    -- Change our bodygroup
    self:SetBodygroup(0, 1)
    
    -- Call the entity base's version of this function
    BaseClass.Draw(self)
end