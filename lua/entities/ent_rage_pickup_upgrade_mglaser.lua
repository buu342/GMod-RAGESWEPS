/**************************************************************
                    AMG Laser Sight Pickup
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()

-- Entity base
ENT.Type = "anim"
ENT.Base = "ent_rage_pickup_base"

-- Entity information
ENT.PrintName    = "AMG Laser Sight"
ENT.Author       = "Buu342"
ENT.Instructions = "Attaches a military grade laser pointer to your Authority Machine Gun."
ENT.Category     = "RAGE"

-- Model
ENT.Model = "models/props/rage/pickup_wirekit.mdl"

-- Allow the entity to be spawned
ENT.Spawnable      = true
ENT.AdminSpawnable = true

-- Mark the entity as being an upgrade
ENT.Upgrade = true