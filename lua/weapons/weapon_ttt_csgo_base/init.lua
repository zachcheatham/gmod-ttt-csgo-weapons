AddCSLuaFile("shared.lua")

include("shared.lua")

function SWEP:Equip(newOwner)
    self.BaseClass.BaseClass.Equip(self, newOwner)

    if not self.csgoSkinData then -- Only skin weapons that haven't been skinned yet
        if self:GetOwner().csgoSkins then
            local skin = self:GetOwner().csgoSkins[self:GetClass()] -- Check if player has a skin for this weapon
            if skin then
                self:SetCSGOSkin(skin)
            end
        end
    end
end

function SWEP:OnCSGOSkinChanged(name, old, new)
    ApplyCSGOSkin(self, new)
end