/**************************************************************
                    Pickupable Entity Base
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

-- Entity information
ENT.Type      = "anim"
ENT.PrintName = "Entity Pickup Base"
ENT.Author    = "Buu342"

-- Don't allow this entity to be spawned
ENT.Spawnable      = false
ENT.AdminSpawnable = false


if (CLIENT) then

    /*-----------------------------
        Buu_RAGE_ReceiveUpgradeClientside
        Receives the upgrade information clientside
    -----------------------------*/

    local function Buu_RAGE_ReceiveUpgradeClientside()
        local upgrade = net.ReadString()
        
        -- If the player doesn't have an upgrade table, initialize it
        if (LocalPlayer().Buu_RAGE_UpgradesList == nil) then
            LocalPlayer().Buu_RAGE_UpgradesList = {}
        end

        -- If the player already owns the upgrade, then don't allow it to be received
        if (table.HasValue(LocalPlayer().Buu_RAGE_UpgradesList, upgrade)) then return end

        -- Insert this upgrade into the player's upgrade table
        table.insert(LocalPlayer().Buu_RAGE_UpgradesList, upgrade)
    end
    net.Receive("Buu_RAGE_ReceiveUpgradeClientside", Buu_RAGE_ReceiveUpgradeClientside)
    
    
    /*-----------------------------
        Buu_RAGE_PickupHUD
        Draws the pickup information when looking at it
    -----------------------------*/
    
    -- Initialize some static variables
    local CursorMat = Material( "vgui/rage_cursor_pickup" )
    local hratio = 900/ScrH()
    local cursor = 32*hratio
    local cursorh = cursor/2
    surface.CreateFont("RAGE_PickupFont", {
        font = "idGinza Narrow Medium",
        extended = false,
        size = ScreenScale(11),
        weight = 500,
        blursize = 0,
        scanlines = 0,
        antialias = true,
        underline = false,
        italic = false,
        strikeout = false,
        symbol = false,
        rotary = false,
        shadow = false,
        additive = false,
        outline = false,
    })
    local function Buu_RAGE_PickupHUD()
        local tr = LocalPlayer():GetEyeTrace()
        
        -- If we're looking at a pickup
        if (tr.Entity.Base == "ent_rage_pickup_base" && LocalPlayer():GetPos():Distance(tr.Entity:GetPos()) < 84) then
            
            -- Draw a little hand
            surface.SetDrawColor(255, 255, 255, 255)
            surface.SetMaterial(CursorMat)
            surface.DrawTexturedRect(ScrW()/2-cursorh, ScrH()/2-cursorh, cursor, cursor)
            
            -- Draw the pickup's name
            draw.SimpleTextOutlined(tr.Entity.PrintName, "RAGE_PickupFont", ScrW()/2, ScrH()/2+cursorh, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color( 0, 0, 0, 255 ) )
        end
    end
    hook.Add("HUDPaint", "Buu_RAGE_PickupHUD", Buu_RAGE_PickupHUD)
end