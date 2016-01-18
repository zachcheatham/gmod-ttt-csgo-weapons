ITEM.Name = "Deagle | Urban Rubble"
ITEM.Price = 10000
ITEM.Model = "models/weapons/tfa_csgo/w_deagle.mdl"
ITEM.Except = true
ITEM.DelayedEquip = false

ITEM.SubCategory = "Deagle"

ITEM.WeaponEntity = "weapon_ttt_csgo_deagle"
ITEM.CSGOSkin = "models/tfa_csgo/cringecity_reskinpack_deagle/deagle_urbanrubble"

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