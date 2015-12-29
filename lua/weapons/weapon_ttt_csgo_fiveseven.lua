
AddCSLuaFile()

SWEP.HoldType               = "pistol"

if CLIENT then
    SWEP.PrintName          = "Five-SeveN"            

    SWEP.Slot               = 1
    SWEP.SlotPos            = 1

    SWEP.Icon               = "vgui/ttt/icon_pistol"
end

SWEP.Base                   = "weapon_tttbase"

SWEP.Spawnable              = true
SWEP.Kind                   = WEAPON_PISTOL

SWEP.Primary.Ammo           = "Pistol"
SWEP.Primary.Recoil         = 1.5
SWEP.Primary.Damage         = 25
SWEP.Primary.Delay          = 0.38
SWEP.Primary.Cone           = 0.02
SWEP.Primary.ClipSize       = 20
SWEP.Primary.ClipMax        = 60
SWEP.Primary.DefaultClip    = 20
SWEP.Primary.Automatic      = true

SWEP.AutoSpawnable          = true
SWEP.AmmoEnt                = "item_ammo_pistol_ttt"
SWEP.Primary.Sound          = Sound("TFA_CSGO_FIVESEVEN.1")

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 56
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_fiveseven.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_fiveseven.mdl"

SWEP.IronSightsPos          = Vector(-2.721, -5.026, 0.65)
SWEP.IronSightsAng          = Vector(0.95, 0.324, 0)

SWEP.Offset = {
    Pos = {
        Up = -2,
        Right = 0.8,
        Forward = 4.5
    },
    Ang = {
        Up = 3,
        Right = 90,
        Forward = 178
    },
    Scale = 0.9
}

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