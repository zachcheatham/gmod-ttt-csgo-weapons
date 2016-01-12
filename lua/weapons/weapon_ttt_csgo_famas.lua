AddCSLuaFile()

SWEP.HoldType				= "ar2"

if CLIENT then
	 SWEP.PrintName		 	= "Famas"
	 SWEP.Slot				= 2

	 SWEP.Icon				= "vgui/ttt/icon_csgo_famas"
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
SWEP.ViewModel				= "models/weapons/tfa_csgo/c_famas.mdl"
SWEP.WorldModel			 	= "models/weapons/tfa_csgo/w_famas.mdl"

SWEP.Primary.Sound			= Sound("TFA_CSGO_FAMAS.1")

SWEP.IronSightsPos 			= Vector(-6.259, -9.849, 1.24)
SWEP.IronSightsAng 			= Vector(-0.3, -0.18, -2.115)

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -3.75,
        Right = 0.8,
        Forward = 3,
        },
        Ang = {
        Up = 3,
        Right = 86,
        Forward = 178
        },
		Scale = 1
}
