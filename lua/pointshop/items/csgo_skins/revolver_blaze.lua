ITEM.Name = "Revolver | Blaze"
ITEM.Price = 500
ITEM.Model = "models/weapons/tfa_csgo/w_revolver.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "Revolver"

ITEM.WeaponEntity = "weapon_ttt_csgo_revolver"
ITEM.CSGOSkin = "models/tfa_csgo/cringecity_reskinpack_r8/r8_blaze"

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