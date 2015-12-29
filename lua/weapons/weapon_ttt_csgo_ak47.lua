AddCSLuaFile()

SWEP.HoldType                = "ar2"

if CLIENT then
    SWEP.PrintName            = "AK-47"
    SWEP.Slot                = 6

    SWEP.Icon                 = "vgui/ttt/icon_ak47"

    SWEP.EquipMenuData = {
        type                 = "Weapon",
        desc                 = "A powerful assault rifle with a large recoil."
    }
end

SWEP.Base                    = "weapon_ttt_csgo_base"
SWEP.Spawnable                 = true
SWEP.Kind                     = WEAPON_EQUIP
SWEP.CanBuy                 = {ROLE_TRAITOR}
SWEP.LimitedStock             = true
SWEP.AutoSpawnable             = false
SWEP.AllowDrop                 = true

SWEP.Primary.Delay            = 0.10
SWEP.Primary.Recoil            = 1.6
SWEP.Primary.Automatic         = true
SWEP.Primary.Ammo             = "smg1"
SWEP.Primary.Damage            = 27
SWEP.Primary.Cone             = 0.018
SWEP.Primary.ClipSize        = 20
SWEP.Primary.ClipMax        = 60
SWEP.Primary.DefaultClip    = 20
SWEP.AmmoEnt                = "item_ammo_smg1_ttt"

SWEP.HeadshotMultiplier     = 2

SWEP.UseHands                = true
SWEP.ViewModelFlip            = false
SWEP.ViewModelFOV            = 56
SWEP.ViewModel                = "models/weapons/tfa_csgo/c_ak47.mdl"
SWEP.WorldModel                = "models/weapons/tfa_csgo/w_ak47.mdl"

SWEP.Primary.Sound            = Sound("TFA_CSGO_AK47.1")

SWEP.IronSightsPos = Vector(-7.58, -9.2, 0.55)
SWEP.IronSightsAng = Vector(2.599, -1.3, -3.6)

SWEP.Offset = {
    Pos = {
        Up = -1.6,
        Right = 1.2,
        Forward = 6,
    },
    Ang = {
        Up = 7,
        Right = 83,
        Forward = 178
    },
    Scale = 1
}

function SWEP:SetZoom(state)
    if CLIENT then return end
    if not (IsValid(self.Owner) and self.Owner:IsPlayer()) then return end
    if state then
        self.Owner:SetFOV(60, 0.3)
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
