
AddCSLuaFile()

SWEP.HoldType               = "pistol"

if CLIENT then
    SWEP.PrintName          = "Five-SeveN"            

    SWEP.Slot               = 1
    SWEP.SlotPos            = 1

    SWEP.Icon               = "vgui/ttt/icon_pistol"
end

SWEP.Base                   = "weapon_ttt_csgo_base"

SWEP.Spawnable              = true
SWEP.Kind                   = WEAPON_PISTOL

SWEP.Primary.Ammo           = "Pistol"
SWEP.Primary.Recoil         = 1.5
SWEP.Primary.Damage         = 25
SWEP.Primary.Delay          = 0.38
SWEP.Primary.Cone           = 0.02
SWEP.Primary.ClipSize       = 20
SWEP.Primary.ClipMax        = 60
SWEP.Primary.DefaultClip    = 20
SWEP.Primary.Automatic      = true

SWEP.AutoSpawnable          = true
SWEP.AmmoEnt                = "item_ammo_pistol_ttt"
SWEP.Primary.Sound          = Sound("TFA_CSGO_FIVESEVEN.1")

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 56
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_fiveseven.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_fiveseven.mdl"

SWEP.IronSightsPos = Vector(-5.95, -4, 2.799)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.Offset = {
    Pos = {
        Up = -2,
        Right = 0.8,
        Forward = 4.5
    },
    Ang = {
        Up = 3,
        Right = 90,
        Forward = 178
    },
    Scale = 0.9
}