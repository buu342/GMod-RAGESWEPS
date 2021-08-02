/**************************************************************
               RAGE SWEPs Client+Server Settings
https://github.com/buu342/GMod-RAGESWEPS
**************************************************************/

if CLIENT then

    local function Buu_RAGE_Settings()
    
        spawnmenu.AddToolMenuOption("Options", "RAGE SWEPs Settings", "RageSWEPsSettings_Client", "Client", "", "", function(panel)

            local RageSWEPsSettings = {
                Options = {}, 
                CVars = {}, 
                Label = "#Presets", 
                MenuButton = "1", 
                Folder = "RAGE SWEPs Settings"
            }
            
            RageSWEPsSettings.Options["#Default"] = {    
                cl_buu_rage_wingstickbutton = tostring(KEY_G),
                cl_buu_rage_ammobutton = tostring(KEY_N),
                cl_buu_rage_ammobuttonback = tostring(KEY_M),
                cl_buu_rage_showwingsticks = "1",
                cl_buu_rage_alwaysshowwingsticks = "1",
                cl_buu_rage_clipincount = "0",
                cl_buu_rage_showammo = "1",
                cl_buu_rage_showcurrammo = "1",
                cl_buu_rage_nonemptyammo = "1",
                cl_buu_rage_ammox = "1",
                cl_buu_rage_ammoy = "0.5",
                cl_buu_rage_ammotrans = "128",
            }

            panel:AddControl("ComboBox", RageSWEPsSettings)
            
            panel:AddControl( "Numpad", { Label = "Wingstick Key", Command = "cl_buu_rage_wingstickbutton", ButtonSize = 22 } )
            panel:AddControl( "Numpad", { Label = "Ammo Swap Key (Forward)", Command = "cl_buu_rage_ammobutton", ButtonSize = 22 } )
            panel:AddControl( "Numpad", { Label = "Ammo Swap Key (Backward)", Command = "cl_buu_rage_ammobuttonback", ButtonSize = 22 } )
            
            panel:AddControl("Label", {Text = ""})
            
            panel:AddControl("CheckBox", {
                Label = "Show wingsticks on the HUD",
                Command = "cl_buu_rage_showwingsticks",
            })
            
            panel:AddControl("CheckBox", {
                Label = "Always show wingsticks on the HUD",
                Command = "cl_buu_rage_alwaysshowwingsticks",
            })
            
            panel:AddControl("Label", {Text = ""})
            
            panel:AddControl("CheckBox", {
                Label = "Show special ammo types",
                Command = "cl_buu_rage_showammo",
            })
            
            panel:AddControl("CheckBox", {
                Label = "Only display ammo if it's not 0",
                Command = "cl_buu_rage_nonemptyammo",
            })
            
            panel:AddControl("CheckBox", {
                Label = "Include clip in ammo count",
                Command = "cl_buu_rage_clipincount",
            })
            
            panel:AddControl("CheckBox", {
                Label = "Highlight selected ammo type",
                Command = "cl_buu_rage_showcurrammo",
            })
            
            panel:AddControl("Label", {Text = ""})
            
            panel:AddControl("Slider", {
                Label     = "Ammo Display x",
                Command     = "cl_buu_rage_ammox",
                Type         = "Float",
                Min         = "0",
                Max         = "1",
            })
            
            panel:AddControl("Slider", {
                Label     = "Ammo Display Y",
                Command     = "cl_buu_rage_ammoy",
                Type         = "Float",
                Min         = "0",
                Max         = "1",
            })
            
            panel:AddControl("Slider", {
                Label     = "Ammo Display Transparency",
                Command     = "cl_buu_rage_ammotrans",
                Type         = "Integer",
                Min         = "0",
                Max         = "255",
            })
            
            panel:AddControl("Label", {Text = ""})
            panel:AddControl("Label", {Text = ""})
            panel:AddControl("Label", {Text = "By buu342"})
            
        end)
    
        spawnmenu.AddToolMenuOption("Options", "RAGE SWEPs Settings", "RageSWEPsSettings_Server", "Server", "", "", function(panel)

            local RageSWEPsSettings = {
                Options = {}, 
                CVars = {}, 
                Label = "#Presets", 
                MenuButton = "1", 
                Folder = "RAGE SWEPs Settings"
            }
            
            RageSWEPsSettings.Options["#Default"] = {
                sv_buu_rage_wingstickalways = "1",
                sv_buu_rage_mindcontrolplayers = "1",
                sv_buu_rage_dropupgradesondeath = "1",
                sv_buu_rage_hl2ammo = "0",
            }

            panel:AddControl("ComboBox", RageSWEPsSettings)
            
            panel:AddControl("CheckBox", {
                Label = "Allow throwing wingsticks without RAGE weapons",
                Command = "sv_buu_rage_wingstickalways",
            })
            
            panel:AddControl("CheckBox", {
                Label = "Allow mind controlling players",
                Command = "sv_buu_rage_mindcontrolplayers",
            })

            panel:AddControl("Label", {Text = ""})

            panel:AddControl("CheckBox", {
                Label = "Drop unused upgrades on death",
                Command = "sv_buu_rage_dropupgradesondeath",
            })
            
            panel:AddControl("Label", {Text = "Dropped upgrade despawn time (0 for no despawn)"})

            panel:AddControl("Slider", {
                Label     = "Seconds",
                Command     = "sv_buu_rage_droppedupgradetime",
                Type         = "Integer",
                Min         = "0",
                Max         = "600",
            })
            
            panel:AddControl("Label", {Text = ""})
            panel:AddControl("Label", {Text = ""})
            panel:AddControl("Label", {Text = "By buu342"})
            
        end)
    
    end
    hook.Add("PopulateToolMenu", "RageSWEPsSettings", Buu_RAGE_Settings)
    
end


/*===============================================================
                            Clientside
===============================================================*/

if (!ConVarExists("cl_buu_rage_wingstickbutton")) then
    CreateClientConVar("cl_buu_rage_wingstickbutton", tostring(KEY_G), FCVAR_ARCHIVE)
end

if (!ConVarExists("cl_buu_rage_ammobutton")) then
    CreateClientConVar("cl_buu_rage_ammobutton", tostring(KEY_N), FCVAR_ARCHIVE)
end

if (!ConVarExists("cl_buu_rage_ammobuttonback")) then
    CreateClientConVar("cl_buu_rage_ammobuttonback", tostring(KEY_M), FCVAR_ARCHIVE)
end

if (!ConVarExists("cl_buu_rage_showwingsticks")) then
    CreateClientConVar("cl_buu_rage_showwingsticks", '1', FCVAR_ARCHIVE)
end

if (!ConVarExists("cl_buu_rage_alwaysshowwingsticks")) then
    CreateClientConVar("cl_buu_rage_alwaysshowwingsticks", '1', FCVAR_ARCHIVE)
end

if (!ConVarExists("cl_buu_rage_clipincount")) then
    CreateClientConVar("cl_buu_rage_clipincount", '0', FCVAR_ARCHIVE)
end

if (!ConVarExists("cl_buu_rage_showammo")) then
    CreateClientConVar("cl_buu_rage_showammo", '1', FCVAR_ARCHIVE)
end

if (!ConVarExists("cl_buu_rage_showcurrammo")) then
    CreateClientConVar("cl_buu_rage_showcurrammo", '1', FCVAR_ARCHIVE)
end

if (!ConVarExists("cl_buu_rage_nonemptyammo")) then
    CreateClientConVar("cl_buu_rage_nonemptyammo", '1', FCVAR_ARCHIVE)
end

if (!ConVarExists("cl_buu_rage_ammox")) then
    CreateClientConVar("cl_buu_rage_ammox", '1', FCVAR_ARCHIVE)
end

if (!ConVarExists("cl_buu_rage_ammoy")) then
    CreateClientConVar("cl_buu_rage_ammoy", '0.5', FCVAR_ARCHIVE)
end

if (!ConVarExists("cl_buu_rage_ammotrans")) then
    CreateClientConVar("cl_buu_rage_ammotrans", '128', FCVAR_ARCHIVE)
end


/*===============================================================
                            Serverside
===============================================================*/

if (!ConVarExists("sv_buu_rage_wingstickalways")) then
    CreateConVar("sv_buu_rage_wingstickalways", '1', FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED)
end

if (!ConVarExists("sv_buu_rage_mindcontrolplayers")) then
    CreateConVar("sv_buu_rage_mindcontrolplayers", '1', FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED)
end

if (!ConVarExists("sv_buu_rage_dropupgradesondeath")) then
    CreateConVar("sv_buu_rage_dropupgradesondeath", '1', FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED)
end

if (!ConVarExists("sv_buu_rage_droppedupgradetime")) then
    CreateConVar("sv_buu_rage_droppedupgradetime", '30', FCVAR_ARCHIVE + FCVAR_NOTIFY + FCVAR_REPLICATED)
end