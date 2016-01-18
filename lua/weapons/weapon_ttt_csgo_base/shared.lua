DEFINE_BASECLASS("weapon_tttbase")

-- Attach to the player's arm
-- TODO: There's probably a better way to do this
function SWEP:DrawWorldModel()
    if CLIENT and !game.SinglePlayer() then
        local hand, offset, rotate

        local ply = self:GetOwner()

        if IsValid(ply) and self.Offset and self.Offset.Pos and self.Offset.Ang then
            local handBone = ply:LookupBone("ValveBiped.Bip01_R_Hand")
            if handBone then
                local pos, ang = ply:GetBonePosition(handBone)
                pos = pos + ang:Forward() * self.Offset.Pos.Forward + ang:Right() * self.Offset.Pos.Right + ang:Up() * self.Offset.Pos.Up
                ang:RotateAroundAxis(ang:Up(), self.Offset.Ang.Up)
                ang:RotateAroundAxis(ang:Right(), self.Offset.Ang.Right)
                ang:RotateAroundAxis(ang:Forward(),  self.Offset.Ang.Forward)
                self:SetRenderOrigin(pos)
                self:SetRenderAngles(ang)
                self:SetModelScale(self.Offset.Scale or 1, 0)
            end
        else
            self:SetRenderOrigin()
            self:SetRenderAngles()
            self:SetModelScale(1, 0)
        end
    end

    self:DrawModel()
end

function SWEP:Initialize()
    -- This function gets called as the resulting weapon.
    -- So the first BaseClass is this file. The second is TTT.
    -- You will see BaseClass.BaseClass a lot because of this!
    self.BaseClass.BaseClass.Initialize(self)
end

function SWEP:SetupDataTables()
    self.BaseClass.BaseClass.SetupDataTables(self)

    self:NetworkVar("String", 3, "CSGOSkin")

    if SERVER then
        self:NetworkVarNotify("CSGOSkin", self.OnCSGOSkinChanged)
    end
end