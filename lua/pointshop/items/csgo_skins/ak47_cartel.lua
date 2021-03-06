ITEM.Name = "AK47 | Cartel"
ITEM.Price = 2189
ITEM.Model = "models/weapons/tfa_csgo/w_ak47.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "AK-47"

ITEM.CSGOSkinEntity = "weapon_ttt_csgo_ak47"
ITEM.CSGOSkinMaterial = "models/tfa_csgo/cringecity_reskinpack_ak47/ak47_cartel"

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