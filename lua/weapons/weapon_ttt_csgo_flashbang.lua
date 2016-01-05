SWEP.HoldType               = "grenade"

if CLIENT then
    SWEP.PrintName          = "Flashbang"
    SWEP.SlotPos            = 7
    
    SWEP.EquipMenuData = {
        type                = "item_weapon",
        desc                = "This grenade's detonation blinds nearby victims."
    };

    SWEP.Icon               = "VGUI/ttt/icon_nades"
end

SWEP.Base                   = "weapon_ttt_csgo_base_grenade"
SWEP.Kind                   = WEAPON_EQUIP
SWEP.CanBuy                 = {ROLE_TRAITOR}
SWEP.AutoSpawnable          = false
SWEP.AllowDrop              = true

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 54
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_flash.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_flash.mdl"

SWEP.Offset = {
    Pos = {
        Up = -1.6,
        Right = 2.2,
        Forward = 3.3,
    },
    Ang = {
        Up = -1,
        Right =  23,
        Forward = 200
    },
    Scale = 1.2
}

function SWEP:GetGrenadeName()
    return "ttt_csgo_flash_proj"
end