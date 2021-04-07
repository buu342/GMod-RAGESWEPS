/**************************************************************
                    Shotgun Extender Pickup
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()

-- Entity base
ENT.Type = "anim"
ENT.Base = "ent_rage_pickup_base"

-- Entity information
ENT.PrintName    = "Shotgun Extender"
ENT.Author       = "Buu342"
ENT.Instructions = "Shoot more, reload less."
ENT.Category     = "RAGE"

-- Model
ENT.Model = "models/weapons/w_rage_shotgun_mag.mdl"

-- Allow the entity to be spawned
ENT.Spawnable      = true
ENT.AdminSpawnable = true

-- Mark the entity as being an upgrade
ENT.Upgrade = true