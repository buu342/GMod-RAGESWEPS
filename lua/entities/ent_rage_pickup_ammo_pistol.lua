/**************************************************************
                     Pistol Rounds Pickup
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()

-- Entity base
ENT.Type = "anim"
ENT.Base = "ent_rage_pickup_base"

-- Entity information
ENT.PrintName    = "Pistol Rounds"
ENT.Author       = "Buu342"
ENT.Instructions = "Standard issue pistol ammo.  Guaranteed to kill Muties and Bandits... eventually."
ENT.Category     = "RAGE"

-- Model
ENT.Model = "models/props/rage/pickup_pistol.mdl"

-- Allow the entity to be spawned
ENT.Spawnable      = true
ENT.AdminSpawnable = true

-- Allow the entity to be spawned
ENT.AmmoType   = "ammo_rage_pistol"
ENT.AmmoAmount = 12

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