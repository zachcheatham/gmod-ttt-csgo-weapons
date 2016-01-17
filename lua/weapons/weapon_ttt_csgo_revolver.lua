
AddCSLuaFile()

SWEP.HoldType               = "pistol"

if CLIENT then
    SWEP.PrintName           = "Revolver"            

    SWEP.Slot                = 6
   	
	SWEP.EquipMenuData = {
	    type = "item_weapon",
        desc = "Detective's Best Friend - High Accuracy"
    };

   SWEP.Icon                = "icon_csgo_revolver"
end

SWEP.Base                   = "weapon_ttt_csgo_base"

SWEP.Spawnable              = true
SWEP.Kind                   = WEAPON_EQUIP
SWEP.CanBuy					        = {ROLE_DETECTIVE}
SWEP.AutoSpawnable			    = false
SWEP.LimitedStock           = true

SWEP.Primary.Ammo           = "AirboatGun"
SWEP.Primary.Recoil         = 1
SWEP.Primary.Damage         = 25
SWEP.Primary.Delay          = 0.75
SWEP.Primary.Cone           = 0.001
SWEP.Primary.ClipSize       = 6
SWEP.Primary.ClipMax        = 32
SWEP.Primary.DefaultClip    = 12
SWEP.Primary.Automatic      = false

SWEP.HeadshotMultiplier     = 2

SWEP.AmmoEnt                = "item_ammo_revolver_ttt"
SWEP.Primary.Sound          = Sound("TFA_CSGO_REVOLVER.1")

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 56
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_revolver.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_revolver.mdl"

SWEP.IronSightsPos 			= Vector(-3.76, -5.628, 0.38)
SWEP.IronSightsAng 			= Vector(0.68, 0.30, 0)

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -3,
        Right = 0.8,
        Forward = 8,
        },
        Ang = {
        Up = 3,
        Right = 0,
        Forward = 178
        },
		Scale = 0.9
}