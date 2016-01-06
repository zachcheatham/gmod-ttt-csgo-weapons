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

addContentFolder("models/weapons/tfa_csgo")
addContentFolder("sound/weapons/tfa_csgo")
addContentFolder("materials/models/tfa_csgo")
addContentFolder("materials/models/weapons/v_models/arby26/mp5")

resource.AddFile("materials/vgui/ttt/icon_csgo_ak47.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_flash.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_frag.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_galil.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_mp5.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_nova.vmt")
resource.AddFile("materials/vgui/ttt/icon_csgo_p90.vmt")