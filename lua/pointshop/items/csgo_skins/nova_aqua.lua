ITEM.Name = "Nova | Aqua"
ITEM.Price = 1500
ITEM.Model = "models/weapons/tfa_csgo/w_nova.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "Nova"

ITEM.CSGOSkinEntity = "weapon_ttt_csgo_nova"
ITEM.CSGOSkinMaterial = "models/tfa_csgo/clocktic_reskinpack_nova/nova_aqua"

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