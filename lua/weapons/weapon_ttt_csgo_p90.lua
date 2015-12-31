AddCSLuaFile()

SWEP.HoldType			  	= "ar2"

if CLIENT then
	SWEP.PrintName		 	= "P90"
	SWEP.Slot				= 2

	SWEP.Icon				= "vgui/ttt/icon_csgo_p90"
end
	
SWEP.Base					= "weapon_tttbase"
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
SWEP.ViewModel			 	= "models/weapons/tfa_csgo/c_p90.mdl"
SWEP.WorldModel				= "models/weapons/tfa_csgo/w_p90.mdl"

SWEP.Primary.Sound			= Sound("TFA_CSGO_P90.1")

SWEP.IronSightsPos 			= Vector(-5.16, -13.065, -0.32)
SWEP.IronSightsAng 			= Vector(-0.201, 0.173, 0.703)

SWEP.DeploySpeed = 3

SWEP.Offset = {
	Pos = {
		Up = -3.5,
		Right = 1.5,
		Forward = 3,
	},
	Ang = {
		Up = 3,
		Right = 70,
		Forward = 178
	},
	Scale = 1.3
}

function SWEP:GetHeadshotMultiplier(victim, dmginfo)
	local att = dmginfo:GetAttacker()
	if not IsValid(att) then return 2 end
 
	local dist = victim:GetPos():Distance(att:GetPos())
	local d = math.max(0, dist - 150)
 
	-- decay from 3.2 to 1.7
	return 1.7 + math.max(0, (1.5 - 0.002 * (d ^ 1.25)))
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