
AddCSLuaFile()

SWEP.HoldType               = "pistol"

if CLIENT then
   SWEP.PrintName           = "Desert Eagle"            

   SWEP.Slot                = 1
   SWEP.SlotPos             = 1

   SWEP.Icon                = "vgui/ttt/icon_deagle"
end

SWEP.Base                   = "weapon_ttt_csgo_base"

SWEP.Spawnable              = true
SWEP.Kind                   = WEAPON_PISTOL

SWEP.Primary.Ammo           = "AlyxGun"
SWEP.Primary.Recoil         = 6
SWEP.Primary.Damage         = 37
SWEP.Primary.Delay          = 0.6
SWEP.Primary.Cone           = 0.02
SWEP.Primary.ClipSize       = 8
SWEP.Primary.ClipMax        = 36
SWEP.Primary.DefaultClip    = 8
SWEP.Primary.Automatic      = false

SWEP.HeadshotMultiplier     = 4

SWEP.AutoSpawnable          = true
SWEP.AmmoEnt                = "item_ammo_revolver_ttt"
SWEP.Primary.Sound          = Sound("TFA_CSGO_DEAGLE.1")

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 56
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_deagle.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_deagle.mdl"

SWEP.IronSightsPos = Vector(-6.361, -3.701, 2.15)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.Offset = {
    Pos = {
        Up = -3.5,
        Right = 0.8,
        Forward = 6,
    },
    Ang = {
        Up = 3,
        Right = 90,
        Forward = 178
    },
    Scale = 1
}