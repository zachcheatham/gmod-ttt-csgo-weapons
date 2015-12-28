
AddCSLuaFile()

SWEP.HoldType               = "pistol"

if CLIENT then
    SWEP.PrintName          = "Glock"            

    SWEP.Slot               = 1
    SWEP.SlotPos            = 1

    SWEP.Icon               = "vgui/ttt/icon_glock"
end

SWEP.Base                   = "weapon_tttbase"

SWEP.Spawnable              = true
SWEP.Kind                   = WEAPON_PISTOL

SWEP.Primary.Ammo           = "Pistol"
SWEP.Primary.Recoil         = 0.9
SWEP.Primary.Damage         = 11
SWEP.Primary.Delay          = 0.10
SWEP.Primary.Cone           = 0.028
SWEP.Primary.ClipSize       = 20
SWEP.Primary.ClipMax        = 60
SWEP.Primary.DefaultClip    = 20
SWEP.Primary.Automatic      = true

SWEP.HeadshotMultiplier     = 1.75

SWEP.AutoSpawnable           = true
SWEP.AmmoEnt                = "item_ammo_pistol_ttt"
SWEP.Primary.Sound          = Sound("TFA_CSGO_GLOCK18.1")

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 56
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_glock18.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_glock18.mdl"

SWEP.IronSightsPos          = Vector(-2.76, -3.433, 1.1)
SWEP.IronSightsAng          = Vector(0.6, 0.15, 0)