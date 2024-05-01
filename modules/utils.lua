if IsDuplicityVersion() then return end

local backEngineVehicles = require('config.client').backEngineVehicles

---@param vehicle any
---@return boolean
local function isBackEngine(vehicle)
    return backEngineVehicles[GetEntityModel(vehicle)]
end

---@param veh any
local function openDoor(veh)
    SetVehicleDoorOpen(veh, isBackEngine(veh) and 5 or 4, true, true)
end

---@param veh any
local function shutDoor(veh)
    SetVehicleDoorShut(veh, isBackEngine(veh) and 5 or 4, true)
end

---Repairs a vehicle
---@param vehicle any
---@param body boolean
---@param engine number | false
---@param repairfull boolean
---@param tyres boolean
---@param clean boolean
local function repairVehicle(vehicle, body, engine, repairfull, tyres, clean)
    if not vehicle then return end
    if body then
        local engineHealth = GetVehicleEngineHealth(vehicle)
        SetVehicleBodyHealth(vehicle, 1000.0)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleFixed(vehicle)
        SetVehicleEngineHealth(vehicle, engineHealth)
    end
    if engine then
        SetVehicleEngineHealth(vehicle, engine)
        SetVehicleUndriveable(vehicle, false)
    end
    if tyres then
        for i = 0, 5 do
            SetVehicleTyreFixed(vehicle, i)
        end
        SetVehicleTyreFixed(vehicle, 45)
        SetVehicleTyreFixed(vehicle, 47)
    end
    if clean then
        SetVehicleDirtLevel(vehicle, 0)
        WashDecalsFromVehicle(vehicle, 1.0)
    end
    if repairfull then
        SetVehicleFixed(vehicle)
    end
end

return {
    isBackEngine = isBackEngine,
    openDoor = openDoor,
    shutDoor = shutDoor,
    repairVehicle = repairVehicle
}