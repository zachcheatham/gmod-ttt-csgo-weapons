ITEM.Name = "M4A4 | Tornado"
ITEM.Price = 124
ITEM.Model = "models/weapons/tfa_csgo/w_m4a4.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "M4A4"

ITEM.CSGOSkinEntity = "weapon_ttt_csgo_m4a4"
ITEM.CSGOSkinMaterial = "models/tfa_csgo/cringecity_reskinpack_m4a4/m4a4_tornado"

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