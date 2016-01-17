net.Receive("ApplyViewmodelCSGOSkin", function()
    local material = net.ReadString()
    
    if IsValid(LocalPlayer()) then
        --chat.AddText("[CS:GO Debug] Apply \"" .. material .. "\" to viewmodel.")
        LocalPlayer():GetViewModel():SetMaterial(material)
    end
end)

net.Receive("ClearViewmodelCSGOSkin", function()
    local material = net.ReadString()
    
    if IsValid(LocalPlayer()) then
        --chat.AddText("[CS:GO Debug] Clear viewmodel material.")
        LocalPlayer():GetViewModel():SetMaterial()
    end
end)

local check_files = {
    "materials/models/tfa_csgo/cringecity_reskinpack_ak47/ak47_cartel.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_deagle/deagle_blaze.vmt",
    "materials/models/tfa_csgo/lc_skins/fiveseven/fiveseven_banana.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_galil/galil_aquaterrace.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_glock/glock_bluefissure.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_m249/m249_magma.vmt",
    "materials/models/tfa_csgo/lc_skins/m4a1/m4a1s_atomicalloy.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_m4a4/m4a4_asiimov.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_mac10/mac_amberfade.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_famas/famas_afterimage.vmt"
	"materials/models/tfa_csgo/cringecity_reskinpack_r8/r8_crimsonweb.vmt"
}

local function displayCollectionDialog()
    chat.AddText("It appears you haven't downloaded our optional weapon skins. Type !skins to open the Workshop collection.")
end

local function playerReady()
    for _, f in ipairs(check_files) do
        if not file.Exists(f, "GAME") then
            print (f)
            displayCollectionDialog()
            return
        end
    end
end
hook.Add("MOTDClosed", "CSGOWeaponSkins", playerReady)