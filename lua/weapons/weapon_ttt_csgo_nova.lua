AddCSLuaFile()

SWEP.HoldType                   = "shotgun"

if CLIENT then
    SWEP.PrintName              = "Nova"

    SWEP.Slot                   = 2
    SWEP.Icon                   = "vgui/ttt/icon_csgo_nova"
end

SWEP.Base                       = "weapon_tttbase"
SWEP.Spawnable                  = true

SWEP.Kind                       = WEAPON_HEAVY

SWEP.Primary.Ammo               = "Buckshot"
SWEP.Primary.Damage             = 8
SWEP.Primary.Cone               = 0.085
SWEP.Primary.Delay              = 0.5
SWEP.Primary.ClipSize           = 7
SWEP.Primary.ClipMax            = 24
SWEP.Primary.DefaultClip        = 7
SWEP.Primary.Automatic          = false
SWEP.Primary.NumShots           = 7
SWEP.AutoSpawnable              = true
SWEP.AmmoEnt                    = "item_box_buckshot_ttt"

SWEP.UseHands                   = true
SWEP.ViewModelFlip              = false
SWEP.ViewModelFOV               = 56
SWEP.ViewModel                  = "models/weapons/tfa_csgo/c_nova.mdl"
SWEP.WorldModel                 = "models/weapons/tfa_csgo/w_nova.mdl"
SWEP.Primary.Sound              = Sound("TFA_CSGO_NOVA.1")
SWEP.Primary.Recoil             = 7

SWEP.IronSightsPos              = Vector(-6.14, -12.061, 2.18)
SWEP.IronSightsAng              = Vector(-0.348, 0.14, -0.968)

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

function SWEP:SetupDataTables()
    self:DTVar("Bool", 0, "reloading")
    return self.BaseClass.SetupDataTables(self)
end

function SWEP:PrimaryAttack()
    if not self.dt.reloading then
        self.BaseClass.PrimaryAttack(self)
    end
end

function SWEP:Reload()
    if self.dt.reloading then return end
    --if not IsFirstTimePredicted() then return end
    
    if self:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount( self.Primary.Ammo ) > 0 then
        if self:StartReload() then
            return
        end
    end
end

function SWEP:StartReload()
    if self.dt.reloading then return false end
    
    self:SetIronsights(false)
    
    --if not IsFirstTimePredicted() then return false end
    
    self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
    
    local ply = self.Owner
    if not ply or ply:GetAmmoCount(self.Primary.Ammo) <= 0 then
        return false
    end
    
    if self:Clip1() >= self.Primary.ClipSize then
        return false
    end
    
    self.dt.reloading = true
    
    self.Weapon:SetNextPrimaryFire(CurTime() + 1)
    self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)
    self.Owner:SetAnimation( PLAYER_RELOAD )
    
    if SERVER then
        local shells = self.Primary.ClipSize - self.Weapon:Clip1()
        
        timer.Create("ShotgunReload_" ..  self.Owner:UserID(), 0.5, shells + 1, function()
            if not self.dt.reloading then return end
        
            if IsValid(self) and IsValid(self.Weapon) and IsValid(self.Owner) then
                if self.Weapon:Clip1() < self.Primary.ClipSize and self.Owner:GetAmmoCount(self.Primary.Ammo) > 0 then
                    self.InsertingShell = true
                    timer.Simple(.05, function() self.Weapon:SendWeaponAnim(ACT_VM_RELOAD) end)
                    
                    self.Owner:RemoveAmmo(1, self.Primary.Ammo, false)
                    self.Weapon:SetClip1(self.Weapon:Clip1() + 1)
                else
                    self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
                    self.dt.reloading = false
                    
                    self.Weapon:SetNextPrimaryFire(CurTime()+.55)
                    self.Weapon:SetNextSecondaryFire(CurTime()+.55)
                end
            else
                self.dt.reloading = false
            end
        end)
    end
end

function SWEP:Think()
    self.BaseClass.Think(self)

    -- There used to be very angry comments below here
    if self.InsertingShell == true and self.Owner:Alive() then
        vm = self.Owner:GetViewModel()
        vm:ResetSequence(vm:LookupSequence("after_reload"))
        vm:SetPlaybackRate(.01)
        self.InsertingShell = false
    end
end


-- The shotgun's headshot damage multiplier is based on distance. The closer it
-- is, the more damage it does. This reinforces the shotgun's role as short
-- range weapon by reducing effectiveness at mid-range, where one could score
-- lucky headshots relatively easily due to the spread.
function SWEP:GetHeadshotMultiplier(victim, dmginfo)
    local att = dmginfo:GetAttacker()
    if not IsValid(att) then return 3 end

    local dist = victim:GetPos():Distance(att:GetPos())
    local d = math.max(0, dist - 140)

    -- decay from 3.1 to 1 slowly as distance increases
    return 1 + math.max(0, (2.1 - 0.002 * (d ^ 1.25)))
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