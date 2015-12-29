AddCSLuaFile()

SWEP.HoldType				 = "ar2"

if CLIENT then
	SWEP.PrintName			= "Silenced M4A1"
	SWEP.Slot				= 6

	SWEP.Icon			 	= "vgui/ttt/icon_m16"

	SWEP.EquipMenuData = {
		type				= "item_weapon",
		desc				= "Silenced M4A1, a more powerful version of the M4A4."
	}
end

SWEP.Base					= "weapon_ttt_csgo_base"
SWEP.Spawnable 				= true
SWEP.Kind 					= WEAPON_EQUIP
SWEP.CanBuy 				= {ROLE_TRAITOR}
SWEP.LimitedStock 			= true
SWEP.AutoSpawnable 			= false
SWEP.AllowDrop 				= true

SWEP.Primary.Delay			= 0.19
SWEP.Primary.Recoil		 	= 1.6
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "Pistol"
SWEP.Primary.Damage		 	= 24
SWEP.Primary.Cone			= 0.018
SWEP.Primary.ClipSize	 	= 20
SWEP.Primary.ClipMax		= 60
SWEP.Primary.DefaultClip	= 20
SWEP.AmmoEnt				= "item_ammo_pistol_ttt"

SWEP.HeadshotMultiplier		= 2

SWEP.UseHands 				= true
SWEP.ViewModelFlip			= false
SWEP.ViewModelFOV		 	= 55
SWEP.ViewModel				= "models/weapons/tfa_csgo/c_m4a1.mdl"
SWEP.WorldModel			 	= "models/weapons/tfa_csgo/w_m4a1.mdl"

SWEP.Primary.Sound			= Sound("TFA_CSGO_M4A1.1")

SWEP.IronSightsPos			= Vector(-5.258, -5.628, 0.279)
SWEP.IronSightsAng			= Vector(1.235, -0.091, -1.407)

SWEP.Offset = {
    Pos = {
        Up = -2,
        Right = 0.8,
        Forward = 6
    },
    Ang = {
        Up = 1,
        Right = 90,
        Forward = 178
    },
    Scale = 1
}

function SWEP:SetZoom(state)
	if CLIENT then return end
	if not (IsValid(self.Owner) and self.Owner:IsPlayer()) then return end
	if state then
		self.Owner:SetFOV(35, 0.5)
	else
		self.Owner:SetFOV(0, 0.2)
	end
end

-- Add some zoom to ironsights for this gun
function SWEP:SecondaryAttack()
	if not self.IronSightsPos then return end
	if self:GetNextSecondaryFire() > CurTime() then return end

	local bIronsights = not self:GetIronsights()

	self:SetIronsights( bIronsights )

	if SERVER then
		self:SetZoom( bIronsights )
	end

	self:SetNextSecondaryFire( CurTime() + 0.3 )
end

function SWEP:PreDrop()
	self:SetZoom(false)
	self:SetIronsights(false)
	return self.BaseClass.PreDrop(self)
end

function SWEP:Reload()
	if (self:Clip1() == self.Primary.ClipSize or
		self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0) then
		return
	end
	self:DefaultReload(ACT_VM_RELOAD)
	self:SetIronsights(false)
	self:SetZoom(false)
end

function SWEP:Holster()
	self:SetIronsights(false)
	self:SetZoom(false)
	return true
end
