function ApplyCSGOSkin(entity, skinID)
    if skinID and string.len(skinID) > 0 then
        local psData = PS.Items[skinID]
        if psData then
            if type(psData.CSGOSkinMaterial) == "table" then
                for index, material in pairs(psData.CSGOSkinMaterial) do
                    entity:SetSubMaterial(index, material)
                end
            else
                entity:SetMaterial(psData.CSGOSkinMaterial)
            end

            return
        else
            ErrorNoHalt("[CS:GO Skins] Warning: attempted to apply non-existant skin: " .. skinID .. "\n")
        end
    end

    entity:SetMaterial() -- Clear the skin
end