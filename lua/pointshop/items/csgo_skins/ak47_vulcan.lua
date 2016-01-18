ITEM.Name = "AK47 | Vulcan"
ITEM.Price = 4358
ITEM.Model = "models/weapons/tfa_csgo/w_ak47.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "AK-47"

ITEM.WeaponEntity = "weapon_ttt_csgo_ak47"
ITEM.CSGOSkin = "models/tfa_csgo/cringecity_reskinpack_ak47/ak47_vulcan"

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