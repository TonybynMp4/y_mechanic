local config = require('config.client')
local repairAreas = {}
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

function GetInZone()
    return inZone
end

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    inZone = false
    clearAreaPoints()
    if job.type == 'mechanic' then
        createAreaPoints(job)
    end
end)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    if QBX.PlayerData.job.type == 'mechanic' then
        createAreaPoints(QBX.PlayerData.job.name)
    end
end)

AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    inZone = false
    clearAreaPoints()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        if QBX.PlayerData.job.type == 'mechanic' then
            createAreaPoints(QBX.PlayerData.job.name)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        clearAreaPoints()
    end
end)