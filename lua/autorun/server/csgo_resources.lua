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