local config = require 'config.client'
local Utils = require 'modules.utils'

lib.callback.register('qbx_mechanic:client:repairEngine', function(isAdvanced, isItem)
    if cache.vehicle then
        exports.qbx_core:Notify(locale('notify.error.vehicle_inside'), 'error')
        return
    end

    if config.restrictToZone and not isItem and not GetInZone() then
        exports.qbx_core:Notify(locale('notify.error.not_in_zone'), 'error')
        return false
    end

    local veh, vehpos = lib.GetClosestVehicle(GetEntityCoords(cache.ped), 4.0, false)
    local pos = GetEntityCoords(cache.ped)
    if not veh or #(pos - vehpos) > 5.0 then
        exports.qbx_core:Notify(locale('notify.error.too_far'), 'error')
        return false
    end

    if isItem and not isAdvanced and GetVehicleEngineHealth(veh) >= 500 then
        exports.qbx_core:Notify(locale('notify.error.not_advanced'), 'error')
        return false
    end

    local dimensionMin, dimensionMax = GetModelDimensions(GetEntityModel(veh))
    local drawpos = GetOffsetFromEntityInWorldCoords(veh, 0.0, (dimensionMax.y), 0.0)
    if Utils.isBackEngine(veh) then
        drawpos = GetOffsetFromEntityInWorldCoords(veh, 0.0, (dimensionMin.y), 0.0)
    end

    if #(pos - drawpos) >= 1.5 then
        exports.qbx_core:Notify(locale('notify.error.too_far_engine'), 'error')
        return
    end
    Utils.openDoor(veh)

    if lib.progressBar({
        duration = math.random(15000, 30000),
        label = locale('progress.repair_engine'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
        },
        anim = {
            dict = 'mini@repair',
            clip = 'fixing_a_player',
        },
    }) then -- if completed
        Utils.repairVehicle(veh, false, (not isItem and 1000) or ((Full and 1000) or 500), Full, not isItem, false)
        Utils.shutDoor(veh)
        return true
    else -- if canceled
        exports.qbx_core:Notify(locale('notify.error.canceled'), 'error')
        Utils.shutDoor(veh)
        return false
    end
end)

lib.callback.register('qbx_mechanic:client:repairBody', function(isItem)
    if cache.vehicle then
        exports.qbx_core:Notify(locale('notify.error.inside_vehicle'), 'error')
        return
    end

    if config.restrictToZone and not isItem and not GetInZone() then
        exports.qbx_core:Notify(locale('notify.error.not_in_zone'), 'error')
        return false
    end

    local veh, vehpos = lib.GetClosestVehicle(GetEntityCoords(cache.ped), 4.0, false)
    local pos = GetEntityCoords(cache.ped)
    if not veh or #(pos - vehpos) > 5.0 then
        exports.qbx_core:Notify(locale('notify.error.too_far'), 'error')
        return
    end

    SetEntityHeading(cache.ped, GetEntityHeading(cache.ped) - 180)
    if lib.progressBar({
        duration = math.random(15000, 30000),
        label = locale('progress.repair_body'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
        },
        anim = {
            dict = 'amb@world_human_vehicle_mechanic@male@base',
            clip = 'base',
            flag = 1,
        },
    }) then
        Utils.repairVehicle(veh, true, false, false, false, false)
        return true
    else
        exports.qbx_core:Notify(locale('notify.error.canceled'), 'error')
        return false
    end
end)

lib.callback.register('qbx_mechanic:client:cleanVehicle', function(isItem)
    if cache.vehicle then
        exports.qbx_core:Notify(locale('error.inside_vehicle'), 'error')
        return
    end

    if config.restrictToZone and not isItem and not GetInZone() then
        exports.qbx_core:Notify(locale('notify.error.not_in_zone'), 'error')
        return false
    end

    local veh, vehpos = lib.GetClosestVehicle(GetEntityCoords(cache.ped), 4.0, false)
    local pos = GetEntityCoords(cache.ped)
    if not veh or #(pos - vehpos) > 5.0 then
        exports.qbx_core:Notify(locale('error.too_far'), 'error')
        return
    end

    if lib.progressBar({
        duration = math.random(10000, 20000),
        label = locale('progress.cleaning_vehicle'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
        },
        anim = {
            scenario = 'WORLD_HUMAN_MAID_CLEAN',
        },
    }) then
        Utils.repairVehicle(veh, false, false, false, false, true)
        return true
    else
        exports.qbx_core:Notify(locale('notify.error.canceled'), 'error')
        return false
    end
end)

lib.callback.register('qbx_mechanic:client:useWheelKit', function()
    if cache.vehicle then
        exports.qbx_core:Notify(locale('notify.error.inside_vehicle'), 'error')
        return
    end

    local veh, vehpos = lib.GetClosestVehicle(GetEntityCoords(cache.ped), 4.0, false)
    local pos = GetEntityCoords(cache.ped)
    if not veh or #(pos - vehpos) > 5.0 then
        exports.qbx_core:Notify(locale('notify.error.too_far'), 'error')
        return
    end

    if lib.progressBar({
        duration = math.random(15000, 30000),
        label = locale('progress.changing_tyres'),
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            car = true,
            combat = true,
        },
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer',
            flag = 1,
        },
    }) then
        Utils.repairVehicle(veh, false, false, false, true, false)
        return true
    else
        exports.qbx_core:Notify(locale('notify.error.canceled'), 'error')
        return false
    end
end)