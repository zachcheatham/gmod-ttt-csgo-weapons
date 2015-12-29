
AddCSLuaFile()

SWEP.HoldType               = "pistol"

if CLIENT then
    SWEP.PrintName          = "USP-S"            
    SWEP.Slot               = 6

    SWEP.EquipMenuData = {
        type                = "item_weapon",
        desc                = "sipistol_desc"
    };

    SWEP.Icon               = "vgui/ttt/icon_silenced"
end

SWEP.Base                   = "weapon_tttbase"
SWEP.Spawnable              = true
SWEP.Kind                   = WEAPON_EQUIP
SWEP.CanBuy                 = {ROLE_TRAITOR}
SWEP.LimitedStock           = true
SWEP.AutoSpawnable          = false
SWEP.AllowDrop              = true

SWEP.Primary.Ammo           = "Pistol"
SWEP.Primary.Recoil         = 1.35
SWEP.Primary.Damage         = 28
SWEP.Primary.Delay          = 0.38
SWEP.Primary.Cone           = 0.02
SWEP.Primary.ClipSize       = 20
SWEP.Primary.ClipMax        = 80
SWEP.Primary.DefaultClip    = 20
SWEP.Primary.Automatic      = true

SWEP.AmmoEnt                = "item_ammo_pistol_ttt"

SWEP.Primary.Sound          = Sound("TFA_CSGO_USP.1")
SWEP.Primary.SoundLevel     = 50

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 56
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_usp.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_usp.mdl"

SWEP.IronSightsPos          = Vector(-2.84, -7.84, 1.48)
SWEP.IronSightsAng          = Vector(-0.571, 0.008, 0)

SWEP.PrimaryAnim            = ACT_VM_PRIMARYATTACK_SILENCED
SWEP.ReloadAnim             = ACT_VM_RELOAD_SILENCED

SWEP.Offset = {
    Pos = {
        Up = -2.5,
        Right = 0.8,
        Forward = 7,
    },
    Ang = {
        Up = 1,
        Right = 90,
        Forward = 178
    },
    Scale = 1
}


function SWEP:Deploy()
    self:SendWeaponAnim(ACT_VM_DRAW_SILENCED)
    return true
end

-- We were bought as special equipment, and we have an extra to give
function SWEP:WasBought(buyer)
    if IsValid(buyer) then -- probably already self.Owner
        buyer:GiveAmmo( 20, "Pistol" )
    end
end

--------------------------
--- CSGO Functionality ---
--------------------------

function SWEP:DrawWorldModel()
    if CLIENT and !game.SinglePlayer() then
        local hand, offset, rotate

        local ply = self:GetOwner()

        if IsValid(ply) and self.Offset and self.Offset.Pos and self.Offset.Ang then
            local handBone = ply:LookupBone("ValveBiped.Bip01_R_Hand")
            if handBone then
                local pos, ang = ply:GetBonePosition( handBone )
                pos = pos + ang:Forward() * self.Offset.Pos.Forward + ang:Right() * self.Offset.Pos.Right + ang:Up() * self.Offset.Pos.Up
                ang:RotateAroundAxis( ang:Up(), self.Offset.Ang.Up)
                ang:RotateAroundAxis( ang:Right(), self.Offset.Ang.Right )
                ang:RotateAroundAxis( ang:Forward(),  self.Offset.Ang.Forward )
                self:SetRenderOrigin( pos )
                self:SetRenderAngles( ang )
                self:SetModelScale( self.Offset.Scale or 1, 0 )
            end
        else
            self:SetRenderOrigin()
            self:SetRenderAngles()
            self:SetModelScale(1, 0)
        end
    end

    self:DrawModel()
end