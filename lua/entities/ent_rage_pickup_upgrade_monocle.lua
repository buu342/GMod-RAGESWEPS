/**************************************************************
                        Monocle Pickup
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile()

-- Entity base
ENT.Type = "anim"
ENT.Base = "ent_rage_pickup_base"

-- Entity information
ENT.PrintName    = "Monocle"
ENT.Author       = "Buu342"
ENT.Instructions = "Half a binocular... the good half."
ENT.Category     = "RAGE"

-- Model
ENT.Model = "models/weapons/w_rage_monocle.mdl"

-- Allow the entity to be spawned
ENT.Spawnable      = true
ENT.AdminSpawnable = true

-- Mark the entity as being an upgrade
ENT.Upgrade = true