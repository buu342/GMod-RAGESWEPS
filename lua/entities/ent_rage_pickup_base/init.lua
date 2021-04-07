/**************************************************************
                    Pickupable Entity Base
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile("shared.lua")
include("shared.lua")

-- Pickup sound
ENT.PickupSound = "rage/pickup.wav"

-- Initialize network strings
util.AddNetworkString("Buu_RAGE_ReceiveUpgradeClientside")


/*-----------------------------
    Initialize
    Called when the entity is created.
-----------------------------*/

function ENT:Initialize()

    -- Initialize the model and physics
    self:SetModel(self.Model)
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS )
    self:DrawShadow(true)
    
    -- Wake up the physics
    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
        phys:EnableGravity(true)
    end
    
    -- Set our usetype to simple
    self:SetUseType(SIMPLE_USE)
end


/*-----------------------------
    Use
    Called when the entity is picked up by a player
    @Param The player that pressed E on the entity
-----------------------------*/

function ENT:Use(activator)

    -- Check if we already have this entity equipped
    if (self:OnPickup(activator) == false) then
        activator:ChatPrint("You are already carrying this upgrade")
        return 
    end
    
    -- Play a pickup sound and remove ourselves
    activator:EmitSound(self.PickupSound, 40)
    self:Remove()
end


/*-----------------------------
    OnPickup
    Called when the entity is picked up by a player
    @Param  The player that pressed E on the entity
    @Return True if we were able to pick it up
-----------------------------*/

function ENT:OnPickup(activator)

    -- If the player doesn't have an upgrade table, initialize it
    if (activator.Buu_RAGE_UpgradesList == nil) then
        activator.Buu_RAGE_UpgradesList = {}
    end

    -- If the player already owns the upgrade, then don't allow it to be picked up
    if (activator.Buu_RAGE_UpgradesList != nil && table.HasValue(activator.Buu_RAGE_UpgradesList, self:GetClass())) then 
        return false 
    end

    -- Insert this upgrade into the player's upgrade table, and network what the player picked up
    table.insert(activator.Buu_RAGE_UpgradesList, self:GetClass())
    net.Start("Buu_RAGE_ReceiveUpgradeClientside")
        net.WriteString(self:GetClass())
    net.Send(activator)
    return true
end