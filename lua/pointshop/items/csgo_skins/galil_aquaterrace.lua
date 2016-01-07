ITEM.Name = "Galil | Aqua Terrace"
ITEM.Price = 10000
ITEM.Model = "models/weapons/tfa_csgo/w_galil.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "Galil"

ITEM.WeaponEntity = "weapon_ttt_csgo_galil"
ITEM.CSGOSkin = "models/tfa_csgo/cringecity_reskinpack_galil/galil_aquaterrace"

function ITEM:OnEquip(ply, modifications)
    if not ply.csgoSkins then
        ply.csgoSkins = {}
    end

    ply.csgoSkins[self.WeaponEntity] = self.CSGOSkin
end

function ITEM:OnHolster(ply)
    if ply.csgoSkins then
        ply.csgoSkins[self.WeaponEntity] = nil
    end
end

-- This /should/ only get called for modifying the preview
function ITEM:ModifyClientsideModel(ply, ent, pos, ang)
    if not ent.csgoSkinApplied then
        ent:SetMaterial(self.CSGOSkin)
        ent.csgoSkinApplied = true
    end
end