SWEP.HoldType			= "grenade"

if CLIENT then
   SWEP.PrintName	 = "Frag Grenade"
   SWEP.Slot		 = 2

   SWEP.Icon = "VGUI/ttt/icon_nades"
end

SWEP.Base				= "weapon_tttbasegrenade"
SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.Kind = WEAPON_EQUIP2

SWEP.UseHands			= true
SWEP.ViewModelFlip		= false
SWEP.ViewModelFOV		= 54
SWEP.ViewModel			= "models/weapons/tfa_csgo/c_frag.mdl"
SWEP.WorldModel			= "models/weapons/tfa_csgo/w_frag.mdl"
SWEP.Weight			= 5
SWEP.AutoSpawnable      = false

SWEP.CanBuy = { ROLE_TRAITOR }

SWEP.EquipMenuData = {
   type = "Frag Grenade",
   desc = "A highly explosive grenade."
};

function SWEP:GetGrenadeName()
   return "ttt_frag_proj"
end

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
            Up = 0,
            Right = 1,
            Forward = 3,
        },
        Ang = {
            Up = -1,
            Right = -2,
            Forward = 178
        },
		Scale = 1
}

--------------------------
--- CSGO Functionality ---
--------------------------

function SWEP:DrawWorldModel()
    /*if CLIENT and !game.SinglePlayer() then
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
    end*/

    self:DrawModel()
end