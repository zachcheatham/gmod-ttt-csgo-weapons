ITEM.Name = "Galil | Stone Cold"
ITEM.Price = 834
ITEM.Model = "models/weapons/tfa_csgo/w_galil.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "Galil"

ITEM.CSGOSkinEntity = "weapon_ttt_csgo_galil"
ITEM.CSGOSkinMaterial = "models/tfa_csgo/cringecity_reskinpack_galil/galil_stonecold"

function ITEM:OnEquip(ply, modifications)
    if not ply.csgoSkins then
        ply.csgoSkins = {}
    end

    ply.csgoSkins[self.CSGOSkinEntity] = self.ID
end

function ITEM:OnHolster(ply)
    if ply.csgoSkins then
        ply.csgoSkins[self.CSGOSkinEntity] = nil
    end
end

-- This /should/ only get called for modifying the preview
function ITEM:ModifyClientsideModel(ply, ent, pos, ang)
    if not ent.csgoSkinApplied then
        ApplyCSGOSkin(ent, self.ID)
        ent.csgoSkinApplied = true
    end
end