DEFINE_BASECLASS("weapon_tttbase")

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