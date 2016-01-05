AddCSLuaFile()

SWEP.HoldType				= "ar2"

if CLIENT then
	 SWEP.PrintName		 	= "Galil"
	 SWEP.Slot				= 2

    SWEP.Icon				= "vgui/ttt/icon_csgo_galil"
end

SWEP.Base				 	= "weapon_ttt_csgo_base"
SWEP.Kind					= WEAPON_HEAVY

SWEP.Primary.Delay			= 0.19
SWEP.Primary.Recoil		 	= 1.6
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "Pistol"
SWEP.Primary.Damage		 	= 23
SWEP.Primary.Cone			= 0.018
SWEP.Primary.ClipSize	 	= 20
SWEP.Primary.ClipMax		= 60
SWEP.Primary.DefaultClip	= 20
SWEP.AutoSpawnable			= true
SWEP.AmmoEnt				= "item_ammo_pistol_ttt"

SWEP.UseHands				= true
SWEP.ViewModelFlip			= false
SWEP.ViewModelFOV		 	= 64
SWEP.ViewModel				= "models/weapons/tfa_csgo/c_galil.mdl"
SWEP.WorldModel			 	= "models/weapons/tfa_csgo/w_galil.mdl"

SWEP.Primary.Sound			= Sound("TFA_CSGO_GALIL.1")

SWEP.IronSightsPos			= Vector(-5.1725, -9.648, 0.855)
SWEP.IronSightsAng			= Vector(-0.25, -0.2, -2.112)

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
    Pos = {
        Up = -3.5,
        Right = 0.8,
        Forward = 6,
    },
    Ang = {
        Up = 3,
        Right = 84,
        Forward = 178
    },
    Scale = 1
}