AddCSLuaFile("shared.lua")

include("shared.lua")

function SWEP:Equip(newOwner)
    self.BaseClass.BaseClass.Equip(self, newOwner)

    if not self:HasCSGOSkin() then
        if self:GetOwner().csgoSkins then
            local skin = self:GetOwner().csgoSkins[self:GetClass()] -- Check if player has a skin for this weapon
            if skin then
                self:SetCSGOSkin(skin)
            end
        end
    end
end

function SWEP:HasCSGOSkin()
    return (self:GetCSGOSkin() and string.len(self:GetCSGOSkin()) > 0)
end

function SWEP:OnCSGOSkinChanged(name, old, new)
    ApplyCSGOSkin(self, new)

    -- If the viewmodel is visible, tell the client to refresh its skin
    if self:IsWeaponVisible() then
        net.Start("CSGOWeaponSkins_UpdateViewModelSkin")
        net.Send(self:GetOwner())
    end

    -- TODO: Update all the people spectating?
end