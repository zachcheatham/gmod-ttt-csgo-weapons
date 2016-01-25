ITEM.Name = "P90 | Sand"
ITEM.Price = 300
ITEM.Model = "models/weapons/tfa_csgo/w_p90.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "P90"

ITEM.CSGOSkinEntity = "weapon_ttt_csgo_p90"
ITEM.CSGOSkinMaterial = "models/tfa_csgo/clocktic_reskinpack_p90/p90_sand"

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