function ApplyCSGOSkin(entity, skinID)
    if skinID and string.len(skinID) > 0 then
        local psData = PS.Items[skinID]
        if psData then
            if type(psData.CSGOSkinMaterial) == "table" then
                entity:SetMaterial() -- Clear the material
                for index, material in pairs(psData.CSGOSkinMaterial) do
                    entity:SetSubMaterial(index - 1, material)
                end
            else
                entity:SetSubMaterial() -- Clear the submaterial
                entity:SetMaterial(psData.CSGOSkinMaterial)
            end
            return
        else
            ErrorNoHalt("[CS:GO Skins] Warning: attempted to apply non-existant skin: " .. skinID .. "\n")
        end
    end

     -- Clear the skin
    entity:SetMaterial()
    entity:SetSubMaterial()
end