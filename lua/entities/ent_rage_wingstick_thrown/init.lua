/**************************************************************
                     Wingstick Projectile
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

AddCSLuaFile("shared.lua")
include("shared.lua")

-- Wingstick damage
ENT.Damage = 50

-- Enable this to allow animations to play
ENT.AutomaticFrameAdvance = true

-- Intialize network strings
util.AddNetworkString("Buu_RAGE_DecapWingstick") 


/*-----------------------------
    Initialize
    Called when the entity is created.
-----------------------------*/

function ENT:Initialize()

    -- Initialize the model and physics
    self:SetModel("models/weapons/w_rage_wingstick.mdl")
    self:PhysicsInit(SOLID_VPHYSICS)
    self:SetMoveType(MOVETYPE_VPHYSICS)
    self:SetSolid(SOLID_VPHYSICS)
    self:DrawShadow(false)
    
    -- Wake up the physics
    local phys = self:GetPhysicsObject()
    if (phys:IsValid()) then
        phys:Wake()
        phys:EnableGravity(false)
        phys:SetBuoyancyRatio(0)
    end
    
    -- Start the spinning animation
    self:SetSequence(self:LookupSequence("spin"))
    
    -- Initialize entity specific variables
    self.Ang = self:GetAngles()
    self.StartPos = self:GetPos()
    self.CollideTime = 0
    self.DamagedEnts = {}
    self.Dir = nil
    
    -- Create a looping sound
    self.LoopSound = CreateSound( self, Sound("rage/weapons/wingstick/flight_loop.wav") )
    self.LoopSound:SetSoundLevel(60)
    self.LoopSound:Play()
    self.LoopSound:ChangePitch(math.random(130, 140), 0)
end


/*-----------------------------
    Think
    Handles logic every tick
-----------------------------*/

-- List for bones to target, in order of preference
local BoneTargets = {
    "ValveBiped.Bip01_Spine4",
    "ValveBiped.Bip01_Head1",
    "ValveBiped.Bip01_Neck1",
    "ValveBiped.Bip01_Spine2",
    "ValveBiped.Bip01_Spine1",
    "ValveBiped.Bip01_Spine",
    "ValveBiped.Bip01_Pelvis",
    "ValveBiped.Bip01",
}
function ENT:Think()

    -- Set the animation playing speed
    self:SetPlaybackRate(0.5)
    
    -- Figure out what to target
    local phys = self:GetPhysicsObject()
    if (self.Target != nil && IsValid(self.Target) && ((self.Target:IsPlayer() && self.Target:Alive()) || self.Target:IsNPC()) && self:Visible(self.Target)) then
    
        -- Look through the target's bones
        local found = false
        for k, v in pairs(BoneTargets) do
            if (self.Target:LookupBone(v) != nil) then
                self.TargetPos = self.Target:GetBonePosition(self.Target:LookupBone(v))
                found = true
                break
            end
        end
        
        -- If we didn't target anything, then just target somewhere above the entity
        if (!found) then
            self.TargetPos = self.Target:GetPos()+Vector(0,0,10)
        end
    end
    
    -- Move in the direction of the target
    local phys = self:GetPhysicsObject()
    if (self.Target != nil && IsValid(self.Target) && (self.Target:IsNPC() || self.Target:Alive()) || self.Dir == nil) then
        self.Dir = self.TargetPos-self:GetPos()
        self.Dir:Normalize()
    end
    phys:ApplyForceCenter(self.Dir*5000)
    
    -- Destroy if killed
    if (self.Killed) then
        
        -- Play a sound and create gibs
        self:EmitSound("rage/weapons/wingstick/break-0"..math.random(1,3)..".wav", 70)
        for i=1, 3 do
            local ent = ents.Create("prop_physics")
            ent:SetPos(self:GetPos())
            ent:SetAngles(self:GetAngles())
            ent:SetModel("models/weapons/w_rage_wingstick_gib"..i..".mdl")
            ent:SetCollisionGroup( COLLISION_GROUP_WEAPON )
            ent:Spawn()
            timer.Simple(10, function() if !IsValid(ent) then return end ent:Remove() end)
        end
        
        -- Destroy ourselves
        self:Remove()
    end

    -- If our owner is the target, and we're near our owner
    if (self.Target == self.Owner && IsValid(self.Target) && self.Target:Alive() && self:GetPos():Distance(self.TargetPos) < 32) then
    
        -- Catch the wingstick
        self:EmitSound("rage/weapons/wingstick/catch-0"..math.random(1,4)..".wav", 50)
        self.Owner:GiveAmmo(1, "ammo_rage_wingstick", true)
        self:Remove()
    end
    
    -- Fix our angles, and set the next think to the next tick
    self:SetAngles(self.Ang)
    self:NextThink(CurTime()) 
    return true
end


/*-----------------------------
    OnRemove
    Called when the entity is removed
-----------------------------*/

function ENT:OnRemove()

    -- Stop the looping sound if it exists
    if (self.LoopSound != nil) then
        self.LoopSound:SetSoundLevel(0)
        self.LoopSound:Stop()
        self.LoopSound = nil
    end
end


/*-----------------------------
    OnTakeDamage
    Called when the entity takes damage
-----------------------------*/

function ENT:OnTakeDamage()

    -- Mark the entity as killed, and create sparks
    self.Killed = true
    local effect = EffectData()  
    local origin = self:GetPos()
    effect:SetOrigin( origin )
    util.Effect("ManhackSparks", effect) 
end


/*-----------------------------
    PhysicsCollide
    Handles logic when the entity collides with something
    @Param The collision data
    @Param The physics object we collided with
-----------------------------*/

function ENT:PhysicsCollide(data, collider)

    -- If we already collided this tick, ignore
    if (self.CollideTime == CurTime()) then return end
    
    
    -- Store what we collided with
    local ent = data.HitEntity
    self.Target = self.Owner
    self.HitPos = self:GetPos()
    self.CollideTime = CurTime()
    if (self.Dir != nil) then
        self.Dir = -self.Dir
    end
    
    -- If we collided with the world
    if (ent:IsWorld()) then
    
        -- Create sparks and leave a manhack cut on the wall
        local effect = EffectData()  
        local origin = self:GetPos()
        effect:SetOrigin( origin )
        util.Effect("ManhackSparks", effect) 
        util.Decal("ManhackCut", data.HitPos+data.HitNormal, data.HitPos-data.HitNormal )
    elseif (IsValid(ent)) then
    
        -- If we hit a trigger or func brush, then ignore it
        if (string.find(ent:GetClass(), "trigger") || string.find(ent:GetClass(), "func")) then return end
        
        -- If we hit something that we hadn't before, and they're not our owner
        if (ent != self.Owner && !table.HasValue(self.DamagedEnts,ent) && (ent:IsNPC() || ent:IsPlayer())) then
        
            -- If we were going to kill something, and they have a head
            if (ent:Health()-self.Damage <= 0 && ent:LookupBone("ValveBiped.Bip01_Head1") != nil) then
            
                -- Decapitate them next frame
                timer.Simple(0, function()
                    if !IsValid(ent) then return end
                    net.Start("Buu_RAGE_DecapWingstick")
                        net.WriteVector(self:GetPos())
                        net.WriteString(ent:GetModel())
                    net.Broadcast()
                end)
                ent:EmitSound("physics/flesh/flesh_bloody_break.wav", 70)
            end
            
            -- Play a flesh grind sound
            self:EmitSound("npc/manhack/grind_flesh"..math.random(1,3)..".wav", 70)
            
            -- Create effects based on what we hit
            if (ent:GetMaterialType() == MAT_FLESH || ent:GetMaterialType() == MAT_BLOODYFLESH || ent:GetMaterialType() == MAT_CONCRETE) then
                
                -- Make blood if we hit something fleshy
                local effect = EffectData()  
                local origin = self:GetPos()
                effect:SetOrigin( origin )
                util.Effect( "bloodimpact", effect ) 
            elseif (ent:GetMaterialType() == MAT_ANTLION || ent:GetMaterialType() == MAT_ALIENFLESH) then
                
                -- Make yellow blood if we hit and alien
                local BloodTrail = ents.Create("info_particle_system")
                BloodTrail:SetKeyValue("effect_name", "xblood_advisor_shrapnel_impact")
                BloodTrail:SetKeyValue("start_active", "1")
                BloodTrail:SetPos(self:GetPos())
                BloodTrail:SetAngles(ent:GetAngles())
                BloodTrail:Spawn()
                BloodTrail:Activate()
                BloodTrail:Fire("Kill", nil, 0.4)
            end
            
            -- Make the entity take damage, and insert the entity into our table of things we hit
            ent:TakeDamage(self.Damage, self.Owner, self)
            table.insert(self.DamagedEnts, ent)
        end
    end
    
    -- Destroy ourselves, maybe
    if (math.random(1,8) == 1) then
        self.Killed = true
    elseif (ent:IsWorld()) then
    
        -- If we didn't destroy ourselves, and we hit the world, make world grinding sounds
        self:EmitSound("npc/manhack/grind"..math.random(1,5)..".wav", 70)
    end
end