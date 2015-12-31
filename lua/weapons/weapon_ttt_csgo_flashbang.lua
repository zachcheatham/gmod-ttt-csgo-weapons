SWEP.HoldType			= "grenade"

if (CLIENT) then --the init.lua stuff goes in here


	SWEP.PrintName = "Flashbang"
	SWEP.SlotPos = 2
	SWEP.IconLetter			= "g"
	
	SWEP.EquipMenuData = {
	   type = "item_weapon",
	   desc = "Best Flash you've/ll ever see/n - NOT FOR ISA!"
   };

end

SWEP.Primary.NumNades = 2 --number of throwable grenades at your disposal
SWEP.Grenade = "ttt_thrownflashbang" --self explanitory

local here = true

SWEP.Spawnable = true
SWEP.AdminSpawnable = true
SWEP.Base = "weapon_tttbasegrenade"
SWEP.UseHands = true

SWEP.ViewModel			= "models/weapons/tfa_csgo/c_flash.mdl"
SWEP.WorldModel			= "models/weapons/tfa_csgo/w_flash.mdl"
SWEP.ViewModelFlip		= false

SWEP.DrawCrosshair		= false

SWEP.IsGrenade = true
SWEP.NoSights = true

SWEP.was_thrown = false

SWEP.Kind = WEAPON_EQUIP2
SWEP.CanBuy = {ROLE_TRAITOR,ROLE_DETECTIVE} 
SWEP.LimitedStock = true
SWEP.Icon = "VGUI/ttt/icon_nades"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

function SWEP:GetGrenadeName()
   return "ttt_thrownflashbang"
end

SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = -2,
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
