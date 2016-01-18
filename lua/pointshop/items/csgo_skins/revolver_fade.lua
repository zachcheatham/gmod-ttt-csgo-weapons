ITEM.Name = "Revolver | Fade"
ITEM.Price = 3000
ITEM.Model = "models/weapons/tfa_csgo/w_revolver.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "Revolver"

ITEM.CSGOSkinEntity = "weapon_ttt_csgo_revolver"
ITEM.CSGOSkinMaterial = "models/tfa_csgo/cringecity_reskinpack_r8/r8_fade"

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