AddCSLuaFile()

SWEP.HoldType               = "ar2"

if CLIENT then
   SWEP.PrintName           = "MAC10"
   SWEP.Slot                = 2

   SWEP.Icon                = "vgui/ttt/icon_mac"
end

SWEP.Base                   = "weapon_ttt_csgo_base"
SWEP.Spawnable              = true

SWEP.Kind                   = WEAPON_HEAVY

SWEP.Primary.Delay          = 0.07
SWEP.Primary.Recoil         = 1.15
SWEP.Primary.Automatic      = true
SWEP.Primary.Ammo           = "smg1"
SWEP.Primary.Damage         = 12
SWEP.Primary.Cone           = 0.031
SWEP.Primary.ClipSize       = 30
SWEP.Primary.ClipMax        = 90
SWEP.Primary.DefaultClip    = 30
SWEP.AutoSpawnable          = true
SWEP.AmmoEnt                = "item_ammo_smg1_ttt"

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 56
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_mac10.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_mac10.mdl"

SWEP.Primary.Sound          = Sound("TFA_CSGO_MAC10.1")

SWEP.IronSightsPos          = Vector(-6.14, -12.061, 2.18)
SWEP.IronSightsAng          = Vector(-0.348, 0.14, -0.968)

SWEP.Offset = {
    Pos = {
        Up = -3.5,
        Right = 0.8,
        Forward = 4,
    },
    Ang = {
        Up = 3,
        Right = 90,
        Forward = 178
    },
    Scale = 1
}

function SWEP:GetHeadshotMultiplier(victim, dmginfo)
    local att = dmginfo:GetAttacker()
    if not IsValid(att) then return 2 end

    local dist = victim:GetPos():Distance(att:GetPos())
    local d = math.max(0, dist - 150)

    -- decay from 3.2 to 1.7
    return 1.7 + math.max(0, (1.5 - 0.002 * (d ^ 1.25)))
end