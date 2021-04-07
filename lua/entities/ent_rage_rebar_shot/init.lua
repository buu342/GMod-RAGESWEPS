/**************************************************************
                       Rebar Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile("shared.lua")
include("shared.lua")
DEFINE_BASECLASS("ent_rage_arrow_shot")

-- Arrow settings
ENT.DirectDamage = 200

-- Model settings
ENT.Model = "models/weapons/w_rage_nailgun_rebar.mdl"