ITEM.Name = "Five-Seven | Case Hardened"
ITEM.Price = 1078
ITEM.Model = "models/weapons/tfa_csgo/w_fiveseven.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "Five-Seven"

ITEM.WeaponEntity = "weapon_ttt_csgo_fiveseven"
ITEM.CSGOSkin = "models/tfa_csgo/lc_skins/fiveseven/fiveseven_casehardened"

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