
AddCSLuaFile()

SWEP.HoldType               = "crossbow"

if CLIENT then
    SWEP.PrintName          = "H.U.G.E-249"            
    SWEP.Slot               = 2
    SWEP.Icon               = "vgui/ttt/icon_m249"
end

SWEP.Base                   = "weapon_ttt_csgo_base"

SWEP.Spawnable              = true
SWEP.Kind                   = WEAPON_HEAVY

SWEP.Primary.Ammo           = "AirboatGun"
SWEP.Primary.Recoil         = 1.6
SWEP.Primary.Damage         = 8
SWEP.Primary.Delay          = 0.09
SWEP.Primary.Cone           = 0.03
SWEP.Primary.ClipSize       = 150
SWEP.Primary.ClipMax        = 150
SWEP.Primary.DefaultClip    = 150
SWEP.Primary.Automatic      = true

SWEP.HeadshotMultiplier     = 2.2

SWEP.AutoSpawnable           = true
SWEP.Primary.Sound          = Sound("TFA_CSGO_M249.1")

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 56
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_m249.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_m249.mdl"

SWEP.IronSightsPos          = Vector(-5.96, -5.119, 2.349)
SWEP.IronSightsAng          = Vector(0, 0, 0)

SWEP.Offset = {
    Pos = {
        Up = -4.75,
        Right = 0.5,
        Forward = 9
    },
    Ang = {
        Up = 3,
        Right = 80,
        Forward = 178
    },
    Scale = 0.9
}