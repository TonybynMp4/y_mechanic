local config = require('config.client')
local repairAreas = {}
local dutyZones = {}
local boxZoneIds = {}
local inZone = false

local function clearAreaPoints()
    for i = 1, #repairAreas do
        repairAreas[i]:remove()
    end
    repairAreas = {}
end

local function createAreaPoints(jobName)
    local jobArea = config.locations?[jobName]?.repairAreas
    if not jobArea then return end
    for i = 1, #jobArea do
        local point = lib.points.new({
            coords = jobArea[i].coords,
            distance = jobArea[i].radius,
        })

        function point:onEnter()
            inZone = true
        end

        function point:onExit()
            inZone = false
        end

        repairAreas[#repairAreas + 1] = point
    end
end

local function createDutyZones(job)
    local duties = config.locations?[job.name]?.dutyAreas

    if not duties then return end
    for i = 1, #duties do
        local duty = duties[i]

        if duty.size then
            local id = exports.ox_target:addBoxZone({
                name = 'duty' .. i,
                coords = duty.coords.xyz,
                size = duty.size,
                rotation = duty.coords.w,
                debug = config.debugPoly,
                options = {
                    {
                        icon = 'fa fa-clipboard',
                        label = locale('text.duty'),
                        onSelect = function()
                            TriggerServerEvent('QBCore:ToggleDuty')
                        end,
                        distance = duty.distance,
                        groups = job.name
                    }
                }
            })

            boxZoneIds[#boxZoneIds + 1] = id
        else
            local zone = lib.zone.new({
                coords = duty.coords,
                distance = duty.distance,
            })

            function zone:onEnter()
                local label = QBX.PlayerData.job.onduty and locale('text.onduty_button') or locale('text.offduty_button')
                lib.showTextUI(label)
            end

            function zone:onExit()
                lib.hideTextUI()
            end

            function zone:inside()
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent('QBCore:ToggleDuty')
                    lib.hideTextUI()
                end
            end

            dutyZones[#dutyZones + 1] = zone
        end
    end
end

local function clearDutyZones()
    for i = 1, #boxZoneIds do
        exports.ox_target:removeZone(boxZoneIds[i])
    end
    boxZoneIds = {}

    for i = 1, #dutyZones do
        dutyZones[i]:remove()
    end
    dutyZones = {}
end

function GetInZone()
    return inZone
end

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    inZone = false
    clearAreaPoints()
    clearDutyZones()
    if job.type == 'mechanic' then
        createAreaPoints(job)
        createDutyZones(job)
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    if QBX.PlayerData.job.type == 'mechanic' then
        createAreaPoints(QBX.PlayerData.job.name)
        createDutyZones(QBX.PlayerData.job)
    end
end)

AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    inZone = false
    clearAreaPoints()
    clearDutyZones()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        if QBX.PlayerData.job.type == 'mechanic' then
            createAreaPoints(QBX.PlayerData.job.name)
            createDutyZones(QBX.PlayerData.job)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        clearAreaPoints()
        clearDutyZones()
    end
end)