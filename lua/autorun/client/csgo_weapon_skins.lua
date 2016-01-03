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