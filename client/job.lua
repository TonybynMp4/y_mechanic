local config = require('config.client')
local repairAreas = {}
local inZone = false

local function createAreaPoints(job)
    for i = 1, #repairAreas do
        repairAreas[i]:remove()
    end
    table.wipe(repairAreas)

    local jobArea = config.locations?[job.name]?.repairAreas
    if not jobArea then return end
    for i = 1, #jobArea do
        local point = lib.repairAreas.new({
            coords = jobArea[i].coords,
            distance = jobArea[i].radius,
        })

        function point:onEnter()
            inZone = true
        end

        function point:onExit()
            inZone = false
        end

        repairAreas[#repairAreas+1] = point
    end
end

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    inZone = false
    if job.type == 'mechanic' then
        createAreaPoints(job)
    end
end)

function GetInZone()
    return inZone
end