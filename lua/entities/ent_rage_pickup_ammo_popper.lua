/**************************************************************
                      Pop Rockets Pickup
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()

-- Entity base
ENT.Type = "anim"
ENT.Base = "ent_rage_pickup_base"

-- Entity information
ENT.PrintName    = "Pop Rockets"
ENT.Author       = "Buu342"
ENT.Instructions = "Half shotgun slug, half hand grenade. 'Nuff said."
ENT.Category     = "RAGE"

-- Model
ENT.Model = "models/props/rage/pickup_popper.mdl"

-- Allow the entity to be spawned
ENT.Spawnable      = true
ENT.AdminSpawnable = true

-- Allow the entity to be spawned
ENT.AmmoType   = "ammo_rage_popper"
ENT.AmmoAmount = 8

-- Pickup sound
ENT.PickupSound = "rage/pickup_ammo.wav"

-- Register the ammo type
game.AddAmmoType({name = ENT.AmmoType})
if CLIENT then
    language.Add(ENT.AmmoType.."_ammo", ENT.PrintName)
end


/*-----------------------------
    OnPickup
    Called when the entity is picked up by a player
    @Param The player that pressed E on the entity
-----------------------------*/

function ENT:OnPickup(activator)
    activator:GiveAmmo(self.AmmoAmount, self.AmmoType)
end