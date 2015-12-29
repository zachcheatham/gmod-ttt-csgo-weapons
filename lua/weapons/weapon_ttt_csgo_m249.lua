
AddCSLuaFile()

SWEP.HoldType               = "crossbow"

if CLIENT then
    SWEP.PrintName          = "H.U.G.E-249"            
    SWEP.Slot               = 2
    SWEP.Icon               = "vgui/ttt/icon_m249"
end

SWEP.Base                   = "weapon_tttbase"

SWEP.Spawnable              = true
SWEP.Kind                   = WEAPON_HEAVY

SWEP.Primary.Ammo           = "AirboatGun"
SWEP.Primary.Recoil         = 1.9
SWEP.Primary.Damage         = 8
SWEP.Primary.Delay          = 0.09
SWEP.Primary.Cone           = 0.07
SWEP.Primary.ClipSize       = 150
SWEP.Primary.ClipMax        = 150
SWEP.Primary.DefaultClip    = 150
SWEP.Primary.Automatic      = true

SWEP.HeadshotMultiplier     = 2.2

SWEP.AutoSpawnable           = true
SWEP.Primary.Sound          = Sound("TFA_CSGO_M249.1")

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 56
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_m249.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_m249.mdl"

SWEP.IronSightsPos          = Vector(-5.96, -5.119, 2.349)
SWEP.IronSightsAng          = Vector(0, 0, 0)

SWEP.Offset = {
    Pos = {
        Up = -4.75,
        Right = 0.5,
        Forward = 9
    },
    Ang = {
        Up = 3,
        Right = 80,
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