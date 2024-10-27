local Utils = require('modules.utils')

lib.callback.register('y_mechanic:client:adminRepair', function()
    if cache.seat == -1 then
        Utils.repairVehicle(cache.vehicle, true, 1000, true, true, true)
        return true
    end

    local pos = GetEntityCoords(cache.ped)
    local vehicle, vehpos = lib.getClosestVehicle(pos, 5.0, false)
    if not vehicle or #(pos - vehpos) > 2.5 then
        exports.qbx_core:Notify(locale("notify.error.closest_vehicle"), "error")
        return false
    end

    Utils.openDoor(vehicle)
    if lib.progressBar({
        duration = math.random(10000, 20000),
        label = locale("progress.repair_vehicle"),
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
            flag = 1
        },
    }) then
        Utils.repairVehicle(vehicle, true, 1000, true, true, true)
        Utils.shutDoor(vehicle)
        return true
    else
        exports.qbx_core:Notify(locale("notify.error.canceled"), "error")
        Utils.shutDoor(vehicle)
        return false
    end
end)
