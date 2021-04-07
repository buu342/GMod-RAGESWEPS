/**************************************************************
                 Authority Pulse Rounds Pickup
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()

-- Entity base
ENT.Type = "anim"
ENT.Base = "ent_rage_pickup_base"

-- Entity information
ENT.PrintName    = "Authority Pulse Rounds"
ENT.Author       = "Buu342"
ENT.Instructions = "Feltrite-infused rounds of death, handle with care."
ENT.Category     = "RAGE"

-- Model
ENT.Model = "models/weapons/w_rage_cannon_mag1.mdl"

-- Allow the entity to be spawned
ENT.Spawnable      = true
ENT.AdminSpawnable = true

-- Ammo settings
ENT.AmmoType = "ammo_rage_cannon"
ENT.AmmoAmount = 100

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