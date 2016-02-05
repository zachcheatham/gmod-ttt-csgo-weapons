-- Helper Function
local function addContentFolder(path)
    local files, folders = file.Find(path .. "/*", "GAME")
    for k, v in pairs(files) do
        resource.AddSingleFile(path .. "/" .. v)
    end

    for k, v in pairs(folders) do
        addContentFolder(path .. "/" .. v)
    end
end

--[[addContentFolder("models/weapons/tfa_csgo")
addContentFolder("sound/weapons/tfa_csgo")
addContentFolder("materials/models/tfa_csgo/ak47")
addContentFolder("materials/models/tfa_csgo/deagle")
addContentFolder("materials/models/tfa_csgo/fiveseven")
addContentFolder("materials/models/tfa_csgo/flash")
addContentFolder("materials/models/tfa_csgo/frag")
addContentFolder("materials/models/tfa_csgo/galil")
addContentFolder("materials/models/tfa_csgo/glock18")
addContentFolder("materials/models/tfa_csgo/m249")
addContentFolder("materials/models/tfa_csgo/m4a1")
addContentFolder("materials/models/tfa_csgo/m4a4")
addContentFolder("materials/models/tfa_csgo/mac10")
addContentFolder("materials/models/tfa_csgo/nova")
addContentFolder("materials/models/tfa_csgo/p90")
addContentFolder("materials/models/tfa_csgo/shared")
addContentFolder("materials/models/tfa_csgo/ssg08")
addContentFolder("materials/models/tfa_csgo/ump45")
addContentFolder("materials/models/tfa_csgo/usp")
addContentFolder("materials/models/tfa_csgo/famas")
addContentFolder("materials/models/tfa_csgo/revolver")

resource.AddFile("materials/vgui/ttt/icon_csgo_ak47.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_flash.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_frag.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_galil.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_nova.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_p90.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_famas.vmt")]]--