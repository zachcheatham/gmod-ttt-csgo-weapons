SWEP.HoldType               = "grenade"

if CLIENT then
    SWEP.PrintName          = "Frag Grenade"
    SWEP.Slot               = 7

    SWEP.EquipMenuData = {
        type                = "item_weapon",
        desc                = "A highly explosive grenade."
    };

    SWEP.Icon               = "VGUI/ttt/icon_csgo_frag"
end

SWEP.Base                   = "weapon_ttt_csgo_base_grenade"
SWEP.Kind                   = WEAPON_EQUIP2
SWEP.CanBuy                 = {ROLE_TRAITOR}
SWEP.AutoSpawnable          = false
SWEP.AllowDrop              = true

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 54
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_frag.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_frag.mdl"

SWEP.detonate_timer = 2

SWEP.Offset = {
    Pos = {
        Up = -0.7,
        Right = 2.5,
        Forward = 3.2
    },
    Ang = {
        Up = -1,
        Right = -2,
        Forward = 178
    },
    Scale = 1
}

function SWEP:GetGrenadeName()
    return "ttt_csgo_frag_proj"
end

