include("shared.lua")

-- Attach to the player's arm
function SWEP:PrePlayerDraw()
    local ply = self:GetOwner()

    if IsValid(ply) and self.Offset and self.Offset.Pos and self.Offset.Ang then
        local handBone = ply:LookupBone("ValveBiped.Bip01_R_Hand")
        if handBone then
            local pos, ang = ply:GetBonePosition(handBone)
            pos = pos + ang:Forward() * self.Offset.Pos.Forward + ang:Right() * self.Offset.Pos.Right + ang:Up() * self.Offset.Pos.Up
            ang:RotateAroundAxis(ang:Up(), self.Offset.Ang.Up)
            ang:RotateAroundAxis(ang:Right(), self.Offset.Ang.Right)
            ang:RotateAroundAxis(ang:Forward(),  self.Offset.Ang.Forward)
            self:SetPos(pos)
            self:SetAngles(ang)
            self:SetRenderOrigin(pos)
            self:SetRenderAngles(ang)
            self:SetModelScale(self.Offset.Scale or 1, 0) 
        end
    end
end