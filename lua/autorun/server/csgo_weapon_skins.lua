util.AddNetworkString("CSGOWeaponSkins_UpdateViewModelSkin")

local function postSpawnEquip(ply, delayed)
    for _, wep in ipairs(ply:GetWeapons()) do
        if wep.SetCSGOSkin and ply.csgoSkins and ply.csgoSkins[wep:GetClass()] and not wep:HasCSGOSkin() then
            wep:SetCSGOSkin(ply.csgoSkins[wep:GetClass()])
        end
    end
end
hook.Add("PS_PostSpawnEquip", "CSGOWeaponSkins_PostSpawnEquip", postSpawnEquip)