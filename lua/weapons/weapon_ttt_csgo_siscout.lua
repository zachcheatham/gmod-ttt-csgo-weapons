AddCSLuaFile()

SWEP.HoldType               = "ar2"

if CLIENT then
    SWEP.PrintName          = "Silenced Scout"
    SWEP.Slot               = 6

    SWEP.EquipMenuData = {
        type                = "item_weapon",
        desc                = "Silent scout for silent hunting."
    }

    SWEP.Icon               = "vgui/ttt/icon_scout"
end

SWEP.Base                   = "weapon_ttt_csgo_base"
SWEP.Spawnable              = true
SWEP.Kind                   = WEAPON_EQUIP
SWEP.CanBuy                 = {ROLE_TRAITOR}
SWEP.LimitedStock           = true
SWEP.AutoSpawnable          = false
SWEP.AllowDrop              = true

SWEP.Primary.Delay          = 1.5
SWEP.Primary.Recoil         = 7
SWEP.Primary.Automatic      = true
SWEP.Primary.Ammo           = "357"
SWEP.Primary.Damage         = 50
SWEP.Primary.Cone           = 0.005
SWEP.Primary.ClipSize       = 10
SWEP.Primary.ClipMax        = 20
SWEP.Primary.DefaultClip    = 10

SWEP.HeadshotMultiplier     = 4

SWEP.AmmoEnt                = "item_ammo_357_ttt"

SWEP.UseHands               = true
SWEP.ViewModelFlip          = false
SWEP.ViewModelFOV           = 56
SWEP.ViewModel              = "models/weapons/tfa_csgo/c_scout.mdl"
SWEP.WorldModel             = "models/weapons/tfa_csgo/w_scout.mdl"

SWEP.Primary.Sound          = Sound("weapons/usp/usp1.wav")
SWEP.Secondary.Sound        = Sound("Default.Zoom")

SWEP.IronSightsPos          = Vector(5, -15, -2)
SWEP.IronSightsAng          = Vector(2.6, 1.37, 3.5)

SWEP.Offset = {
    Pos = {
        Up = 0.7,
        Right = 0.5,
        Forward = 1.0,
    },
    Ang = {
        Up = 0,
        Right = -9,
        Forward = 180,
    },
    Scale = 1.2
}

function SWEP:SetZoom(state)
    if CLIENT then
        return
    elseif IsValid(self.Owner) and self.Owner:IsPlayer() then
        if state then
            self.Owner:SetFOV(20, 0.3)
        else
            self.Owner:SetFOV(0, 0.2)
        end
    end
end

-- Add some zoom to ironsights for this gun
function SWEP:SecondaryAttack()
    if not self.IronSightsPos then return end
    if self:GetNextSecondaryFire() > CurTime() then return end

    local bIronsights = not self:GetIronsights()

    self:SetIronsights( bIronsights )

    if SERVER then
        self:SetZoom(bIronsights)
    else
        self:EmitSound(self.Secondary.Sound)
    end

    self:SetNextSecondaryFire( CurTime() + 0.3)
end

function SWEP:PreDrop()
    self:SetZoom(false)
    self:SetIronsights(false)
    return self.BaseClass.PreDrop(self)
end

function SWEP:Reload()
    if ( self:Clip1() == self.Primary.ClipSize or self.Owner:GetAmmoCount( self.Primary.Ammo ) <= 0 ) then return end
    self:DefaultReload( ACT_VM_RELOAD )
    self:SetIronsights( false )
    self:SetZoom( false )
end


function SWEP:Holster()
    self:SetIronsights(false)
    self:SetZoom(false)
    return true
end

if CLIENT then
    local scope = surface.GetTextureID("sprites/scope")
    function SWEP:DrawHUD()
        if self:GetIronsights() then
            surface.SetDrawColor( 0, 0, 0, 255 )
            
            local scrW = ScrW()
            local scrH = ScrH()

            local x = scrW / 2.0
            local y = scrH / 2.0
            local scope_size = scrH

            -- crosshair
            local gap = 80
            local length = scope_size
            surface.DrawLine( x - length, y, x - gap, y )
            surface.DrawLine( x + length, y, x + gap, y )
            surface.DrawLine( x, y - length, x, y - gap )
            surface.DrawLine( x, y + length, x, y + gap )

            gap = 0
            length = 50
            surface.DrawLine( x - length, y, x - gap, y )
            surface.DrawLine( x + length, y, x + gap, y )
            surface.DrawLine( x, y - length, x, y - gap )
            surface.DrawLine( x, y + length, x, y + gap )


            -- cover edges
            local sh = scope_size / 2
            local w = (x - sh) + 2
            surface.DrawRect(0, 0, w, scope_size)
            surface.DrawRect(x + sh - 2, 0, w, scope_size)
            
            -- cover gaps on top and bottom of screen
            surface.DrawLine( 0, 0, scrW, 0 )
            surface.DrawLine( 0, scrH - 1, scrW, scrH - 1 )

            surface.SetDrawColor(255, 0, 0, 255)
            surface.DrawLine(x, y, x + 1, y + 1)

            -- scope
            surface.SetTexture(scope)
            surface.SetDrawColor(255, 255, 255, 255)

            surface.DrawTexturedRectRotated(x, y, scope_size, scope_size, 0)
        else
            return self.BaseClass.DrawHUD(self)
        end
    end

    function SWEP:AdjustMouseSensitivity()
        return (self:GetIronsights() and 0.2) or nil
    end
end
