-- Viewmodel skinning

local previousWeapon = nil
local function postDrawViewModel(viewModel, ply, weapon)
    if weapon ~= previousWeapon then
        previousWeapon = weapon

        if weapon.GetCSGOSkin then
            local skinID = weapon:GetCSGOSkin()
            ApplyCSGOSkin(LocalPlayer():GetViewModel(), skinID)
        else
            LocalPlayer():GetViewModel():SetMaterial() -- Clear the skin
        end
    end
end
-- I really don't like using hooks that get called constantly, but there's no client-side weapon switch hook.
-- Not sure if Think would be more efficient.
hook.Add("PostDrawViewModel", "CSGOWeaponSkins_ViewModelSkin", postDrawViewModel)

-- Called when the server has changed the skin in our hand
net.Receive("CSGOWeaponSkins_UpdateViewModelSkin", function(len)
    previousWeapon = nil
end)

-- Fix skin material colors
local function initPostEntity()
    for _, item in pairs(PS.Items) do
        if item.CSGOSkinColor then
            Material(item.CSGOSkinMaterial):SetVector("$color2", item.CSGOSkinColor)
        end
    end
end
hook.Add("InitPostEntity", "CSGOWeaponSkins_MaterialColors", initPostEntity)
initPostEntity()

-- Addon Checks

local checkFiles = {
    "materials/models/tfa_csgo/cringecity_reskinpack_ak47/ak47_cartel.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_deagle/deagle_blaze.vmt",
    "materials/models/tfa_csgo/lc_skins/fiveseven/fiveseven_banana.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_galil/galil_aquaterrace.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_glock/glock_bluefissure.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_m249/m249_magma.vmt",
    "materials/models/tfa_csgo/lc_skins/m4a1/m4a1s_atomicalloy.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_m4a4/m4a4_asiimov.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_mac10/mac_amberfade.vmt",
    "materials/models/tfa_csgo/cringecity_reskinpack_famas/famas_afterimage.vmt",
	"materials/models/tfa_csgo/cringecity_reskinpack_r8/r8_crimsonweb.vmt",
	"materials/models/tfa_csgo/clocktic_reskinpack_nova/nova_moon.vmt"
}

local function displayCollectionDialog()
    chat.AddText("It appears you haven't downloaded all of our optional weapon skins. Type !skins to open the Workshop collection.")
end

local function playerReady()
    for _, f in ipairs(checkFiles) do
        if not file.Exists(f, "GAME") then
            displayCollectionDialog()
            return
        end
    end
end
hook.Add("MOTDClosed", "CSGOWeaponSkins", playerReady)