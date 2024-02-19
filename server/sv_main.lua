-- [[ QBCore ]]
local QBCore = exports['qb-core']:GetCoreObject()

-- [[ Resource Metadata ]] --


-- [[ Variables ]] --
local ActiveBodycam = false

-- [[ Functions ]] --

-- [[ Net Events ]] --
RegisterNetEvent('LENT-GovEssentials:Server:SetBool', function(bool)
    ActiveBodycam = bool
end)

RegisterNetEvent('LENT-GovEssentials:Server:GetOSDate', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return end
    local gender = Player.PlayerData.charinfo.gender
    TriggerClientEvent('LENT-GovEssentials:Client:BodyCamStatus', src, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")), gender)
end)

RegisterNetEvent('LENT-GovEssentials:Server:Time', function()
    local src = source
    TriggerClientEvent("LENT-GovEssentials:Client:Time", source, tonumber(os.date("%H")), tonumber(os.date("%M")), tonumber(os.date("%S")))
end)

-- QBCore Commands
QBCore.Commands.Add('hidebodycam', 'Hides bodycam in case of character switching', {}, false, function(source, args)
    local src = source
    TriggerClientEvent('LENT-GovEssentials:Client:HideCam', src)
end)

-- items
QBCore.Functions.CreateUseableItem('bodycam', function(source, item)
    local src = source
    TriggerClientEvent('LENT-GovEssentials:Client:RadialTrigger', src)
end)
