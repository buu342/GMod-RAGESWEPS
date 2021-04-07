/**************************************************************
                     AR Stabilizer Pickup
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()

-- Entity base
ENT.Type = "anim"
ENT.Base = "ent_rage_pickup_base"

-- Entity information
ENT.PrintName = "AR Stabilizer"
ENT.Author = "Buu342"
ENT.Instructions = "Keeps your Assault Rifle stable, even if you're not."
ENT.Category = "RAGE"

-- Model
ENT.Model = "models/props/rage/pickup_hardware.mdl"

-- Allow the entity to be spawned
ENT.Spawnable      = true
ENT.AdminSpawnable = true

-- Mark the entity as being an upgrade
ENT.Upgrade = true