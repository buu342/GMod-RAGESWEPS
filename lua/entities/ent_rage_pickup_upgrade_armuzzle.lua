/**************************************************************
                    AR Concentrator Pickup
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()

-- Entity base
ENT.Type = "anim"
ENT.Base = "ent_rage_pickup_base"

-- Entity information
ENT.PrintName    = "AR Concentrator"
ENT.Author       = "Buu342"
ENT.Instructions = "Reduces the spread of your old, rusty Assault Rifle."
ENT.Category     = "RAGE"

-- Model
ENT.Model = "models/props/rage/pickup_hardware.mdl"

-- Allow the entity to be spawned
ENT.Spawnable      = true
ENT.AdminSpawnable = true

-- Mark the entity as being an upgrade
ENT.Upgrade = true