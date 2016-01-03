AddCSLuaFile("shared.lua")

include("shared.lua")

function SWEP:Equip()
    self.BaseClass.BaseClass.Equip(self)

    if not self.csgoSkin then
        self:SetCSGOSkin("models/tfa_csgo/cringecity_reskinpack_m4a4/m4a4_asiimov")
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