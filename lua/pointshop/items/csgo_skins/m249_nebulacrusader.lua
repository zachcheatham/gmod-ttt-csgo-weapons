ITEM.Name = "M249 | Nebula Crusader"
ITEM.Price = 716
ITEM.Model = "models/weapons/tfa_csgo/w_m249.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "M249"

ITEM.CSGOSkinEntity = "weapon_ttt_csgo_m249"
ITEM.CSGOSkinMaterial = "models/tfa_csgo/cringecity_reskinpack_m249/m249_nebulacrusader"

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