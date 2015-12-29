
AddCSLuaFile()

SWEP.HoldType               = "pistol"

if CLIENT then
   SWEP.PrintName           = "Desert Eagle"            

   SWEP.Slot                = 1
   SWEP.SlotPos             = 1

   SWEP.Icon                = "vgui/ttt/icon_deagle"
end

SWEP.Base                   = "weapon_tttbase"

SWEP.Spawnable              = true
SWEP.Kind                   = WEAPON_PISTOL

SWEP.Primary.Ammo           = "AlyxGun"
SWEP.Primary.Recoil         = 6
SWEP.Primary.Damage         = 37
SWEP.Primary.Delay          = 0.6
SWEP.Primary.Cone           = 0.02
SWEP.Primary.ClipSize       = 8
SWEP.Primary.ClipMax        = 36
SWEP.Primary.DefaultClip    = 8
SWEP.Primary.Automatic      = false

SWEP.HeadshotMultiplier     = 4

SWEP.AutoSpawnable          = true
SWEP.AmmoEnt                = "item_ammo_revolver_ttt"
SWEP.Primary.Sound          = Sound("TFA_CSGO_DEAGLE.1")

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 56
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_deagle.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_deagle.mdl"

SWEP.IronSightsPos          = Vector(-3.76, -5.628, 0.38)
SWEP.IronSightsAng          = Vector(0.68, 0.30, 0)

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