AddCSLuaFile()

SWEP.HoldType			  	= "ar2"

if CLIENT then
	SWEP.PrintName		 	= "MP5"
	SWEP.Slot				= 2

	SWEP.Icon				= ""
end
	
SWEP.Base					= "weapon_ttt_csgo_base"
SWEP.Spawnable				= true

SWEP.Kind					= WEAPON_HEAVY

SWEP.Primary.Delay			= 0.065
SWEP.Primary.Recoil		  	= 1.15
SWEP.Primary.Automatic	  	= true
SWEP.Primary.Ammo			= "smg1"
SWEP.Primary.Damage		  	= 12
SWEP.Primary.Cone			= 0.025
SWEP.Primary.ClipSize		= 30
SWEP.Primary.ClipMax		= 60
SWEP.Primary.DefaultClip	= 30
SWEP.AutoSpawnable			= true
SWEP.AmmoEnt				= "item_ammo_smg1_ttt"

SWEP.UseHands			  	= true
SWEP.ViewModelFlip			= false
SWEP.ViewModelFOV		 	= 59
SWEP.ViewModel			 	= "models/weapons/tfa_csgo/c_mp5.mdl"
SWEP.WorldModel				= "models/weapons/tfa_csgo/w_mp5.mdl"

SWEP.Primary.Sound			= Sound("TFA_CSGO_MP5.1")

SWEP.IronSightsPos 			= Vector(-5.16, -13.065, -0.32)
SWEP.IronSightsAng 			= Vector(-0.201, 0.173, 0.703)

SWEP.DeploySpeed = 3

 SWEP.Offset = {
        Pos = {
        Up = 0.5,
        Right = 1,
        Forward = 3,
        },
        Ang = {
        Up = 0,
        Right = 3,
        Forward = 180,
        },
		Scale = 1.2
}

function SWEP:GetHeadshotMultiplier(victim, dmginfo)
	local att = dmginfo:GetAttacker()
	if not IsValid(att) then return 2 end
 
	local dist = victim:GetPos():Distance(att:GetPos())
	local d = math.max(0, dist - 150)
 
	-- decay from 3.2 to 1.7
	return 1.7 + math.max(0, (1.5 - 0.002 * (d ^ 1.25)))
end