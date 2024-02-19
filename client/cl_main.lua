-- [[ QBCore ]]
local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
PlayerJob = {}

-- [[ Resource Metadata ]] --
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    SendNUIMessage({
        action = "HideBodyCam"
    })

    SetCamActive = false
    SetBeepActive = false
end)

-- [[ Variables ]] --
local year, month, day, hour, minute, second = GetLocalTime()
local SetCamActive = false
local SetBeepActive = false

-- [[ Functions ]] --
function UpdateBodyCamTime()
    TriggerServerEvent('LENT-GovEssentials:Server:Time')
end

function isCurrentJobLawEnforcement(job)
    for k, _ in pairs(Config.Settings['AllowedJobs']) do
        if k == job then return true end
    end
    return false
end

-- [[ Net Events ]] --
RegisterNetEvent('LENT-GovEssentials:Client:RadialTrigger', function()
    if SetCamActive then
        SetCamActive = false
        TriggerEvent('LENT-GovEssentials:Client:HideCam')
    else
        TriggerServerEvent('LENT-GovEssentials:Server:SetBool', true)
        TriggerServerEvent('LENT-GovEssentials:Server:GetOSDate')
        SetCamActive = true
    end
end)

RegisterNetEvent("LENT-GovEssentials:Client:Time", function(h, m, s)
    local Player = QBCore.Functions.GetPlayerData()

    if Player.charinfo.gender == "0" or Player.charinfo.gender == 0 then
        gender = Config.Settings['Gender']['Male']
    else
        gender = Config.Settings['Gender']['Female']
    end

    local DepartmentLabel = Config.Settings['AllowedJobs'][Player.job.name]['Label']
    local Logo = Config.Settings['AllowedJobs'][Player.job.name]['LogoLink']

    SendNUIMessage({
        action = "ShowBodyCam",
        Player = Player.job.grade.name .. " " .. gender .. " " .. Player.charinfo.lastname,
        Callsign = "[" .. Player.metadata['callsign'] .. "]",
        Time = day .. "/" .. month .. "/" .. year .. " " .. " - " .. h .. " : " .. m .. " : " .. s .. " LOCAL",
        Department = DepartmentLabel,
        DeptLogo = Logo
    })
end)

RegisterNetEvent("LENT-GovEssentials:Client:BodyCamStatus", function(h, m, s, ActiveBodycam, gender)
    local Player = QBCore.Functions.GetPlayerData()
    if isCurrentJobLawEnforcement(Player.job.name) then

        if Player.charinfo.gender == "0" or Player.charinfo.gender == 0 then
            gender = Config.Settings['Gender']['Male']
        else
            gender = Config.Settings['Gender']['Female']
        end

        local DepartmentLabel = Config.Settings['AllowedJobs'][Player.job.name]['Label']
        local Logo = Config.Settings['AllowedJobs'][Player.job.name]['LogoLink']

        SendNUIMessage({
            action = "ShowBodyCam",
            Player = Player.job.grade.name .. " " .. gender .. " " .. Player.charinfo.lastname,
            Callsign = "[" .. Player.metadata['callsign'] .. "]",
            Time = day .. "/" .. month .. "/" .. year .. " " .. " - " .. h .. " : " .. m .. " : " .. s .. " LOCAL",
            Department = DepartmentLabel,
            DeptLogo = Logo
        })

        if not SetBeepActive then
            local myPos = GetEntityCoords(PlayerPedId(), true)
            TriggerServerEvent('InteractSound_SV:PlayWithinDistanceOnCoords', 1.0, "Axon", 0.5, myPos)
            SetBeepActive = true
        end
    end
end)

RegisterNetEvent('LENT-GovEssentials:Client:HideCam', function()
    SendNUIMessage({
        action = "HideBodyCam"
    })

    SetCamActive = false
    SetBeepActive = false
end)


-- [[ Threads ]] --
CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local isholdingWeapon = GetCurrentPedWeapon(ped, 1)

        if isholdingWeapon and QBCore.Functions.HasItem('bodycam') then
            if IsControlJustPressed(0, 24) then
                TriggerServerEvent('LENT-GovEssentials:Server:SetBool', true)
                TriggerServerEvent('LENT-GovEssentials:Server:GetOSDate')
                SetCamActive = true
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        if SetCamActive then
            UpdateBodyCamTime()
        end
    end
end)