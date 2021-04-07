/**************************************************************
                      Feltrite AR Rounds
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()

-- Entity base
ENT.Type = "anim"
ENT.Base = "ent_rage_pickup_base"

-- Entity information
ENT.PrintName    = "Feltrite AR Rounds"
ENT.Author       = "Buu342"
ENT.Instructions = "Feltrite-infused rounds. Double the ass-kicking against armored enemies."
ENT.Category     = "RAGE"

-- Model
ENT.Model = "models/weapons/w_rage_rifle_mag1.mdl"

-- Allow the entity to be spawned
ENT.Spawnable      = true
ENT.AdminSpawnable = true

-- Ammo settings
ENT.AmmoType   = "ammo_rage_feltritear"
ENT.AmmoAmount = 40

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