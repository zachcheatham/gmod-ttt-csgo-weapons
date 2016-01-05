AddCSLuaFile()

SWEP.HoldType				= "ar2"

if CLIENT then
	 SWEP.PrintName		 	= "M4A4"
	 SWEP.Slot				= 2

	 SWEP.Icon				= "vgui/ttt/icon_m16"
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
SWEP.ViewModel				= "models/weapons/tfa_csgo/c_m4a4.mdl"
SWEP.WorldModel			 	= "models/weapons/tfa_csgo/w_m4a4.mdl"

SWEP.Primary.Sound			= Sound("TFA_CSGO_M4A4.1")

SWEP.IronSightsPos = Vector(-7.58, -9.2, 0.55)
SWEP.IronSightsAng = Vector(2.599, -1.3, -3.6)

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