function ApplyCSGOSkin(entity, skinID)
    if skinID and string.len(skinID) > 0 then
        local psData = PS.Items[skinID]
        if psData then
            if type(psData.CSGOSkin) == "table" then
                for index, material in pairs(psData.CSGOSkin) do
                    entity:SetSubMaterial(index, material)
                end
            else
                entity:SetMaterial(psData.CSGOSkin)
            end

            return
        else
            ErrorNoHalt("[CS:GO Skins] Warning: attempted to apply non-existant skin: " .. skinID .. "\n")
        end
    end

    entity:SetMaterial() -- Clear the skin
end