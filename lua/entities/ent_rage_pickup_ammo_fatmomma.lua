/**************************************************************
                          Fat Mammas
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()

-- Entity base
ENT.Type = "anim"
ENT.Base = "ent_rage_pickup_base"

-- Entity information
ENT.PrintName    = "Fat Mammas"
ENT.Author       = "Buu342"
ENT.Instructions = "Twice as tough as Fatboys. If Mamma can't kill it, RUN!"
ENT.Category     = "RAGE"

-- Model
ENT.Model = "models/props/rage/pickup_fatmomma.mdl"

-- Allow the entity to be spawned
ENT.Spawnable      = true
ENT.AdminSpawnable = true

-- Ammo settings
ENT.AmmoType   = "ammo_rage_fatmomma"
ENT.AmmoAmount = 6

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