ITEM.Name = "M4A1 | Golden Coil"
ITEM.Price = 5811
ITEM.Model = "models/weapons/tfa_csgo/w_m4a1.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "M4A1-S"

ITEM.WeaponEntity = "weapon_ttt_csgo_m4a1"
ITEM.CSGOSkin = "models/tfa_csgo/lc_skins/m4a1/m4a1s_goldencoil"

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