AddCSLuaFile("shared.lua")

include("shared.lua")

function SWEP:Equip()
    self.BaseClass.BaseClass.Equip(self)

    if not self.csgoSkin then -- Only skin weapons that haven't been skinned yet
        if self:GetOwner().csgoSkins then
            local skin = self:GetOwner().csgoSkins[self:GetClass()] -- Check if player has a skin for this weapon
            if skin then
                self:SetCSGOSkin(skin)
            end
        end
    end
end

function SWEP:SetCSGOSkin(skin)
    self.csgoSkin = skin
    self:SetMaterial(skin)

    /*if IsValid(self:GetOwner()) and self:IsWeaponVisible() then
        net.Start("ApplyViewmodelCSGOSkin")
        net.WriteString(skin)
        net.Send(self:GetOwner())
    end*/
end