util.AddNetworkString("ApplyViewmodelCSGOSkin")
util.AddNetworkString("ClearViewmodelCSGOSkin")

local function playerSwitchWeapon(ply, oldWeapon, newWeapon)
    if newWeapon.csgoSkin then
        net.Start("ApplyViewmodelCSGOSkin")
        net.WriteString(newWeapon.csgoSkin)
        net.Send(ply)
    elseif not IsValid(oldWeapon) or oldWeapon.csgoSkin then
        net.Start("ClearViewmodelCSGOSkin")
        net.Send(ply)
    end

    /*if ply:Nick() == "Zach." then
        print "================="
        print (IsValid(oldWeapon) and oldWeapon:GetClass() or "nil")
        print (IsValid(newWeapon) and newWeapon:GetClass() or "nil")
        print "-----------------"
    end*/
end
hook.Add("PlayerSwitchWeapon", "CSGOWeaponSkins", playerSwitchWeapon)