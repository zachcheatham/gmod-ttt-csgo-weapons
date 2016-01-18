ITEM.Name = "Five-Seven | Contractor"
ITEM.Price = 188
ITEM.Model = "models/weapons/tfa_csgo/w_fiveseven.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "Five-Seven"

ITEM.WeaponEntity = "weapon_ttt_csgo_fiveseven"
ITEM.CSGOSkin = "models/tfa_csgo/lc_skins/fiveseven/fiveseven_contractor"

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