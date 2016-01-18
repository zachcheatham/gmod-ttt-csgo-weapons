ITEM.Name = "Famas | Sergeant"
ITEM.Price = 1000
ITEM.Model = "models/weapons/tfa_csgo/w_famas.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "Famas"

ITEM.WeaponEntity = "weapon_ttt_csgo_famas"
ITEM.CSGOSkin = "models/tfa_csgo/cringecity_reskinpack_famas/famas_sergeant"

function ITEM:OnEquip(ply, modifications)
    if not ply.csgoSkins then
        ply.csgoSkins = {}
    end

    ply.csgoSkins[self.WeaponEntity] = self.ID
end

function ITEM:OnHolster(ply)
    if ply.csgoSkins then
        ply.csgoSkins[self.WeaponEntity] = nil
    end
end

-- This /should/ only get called for modifying the preview
function ITEM:ModifyClientsideModel(ply, ent, pos, ang)
    if not ent.csgoSkinApplied then
        ApplyCSGOSkin(ent, self.ID)
        ent.csgoSkinApplied = true
    end
end