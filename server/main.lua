lib.addCommand("fix", {
    help =  locale('command.fix.help'),
    params = {},
    restricted = 'god'
}, function(source, args, raw)
    local repaired = lib.callback.await('qbx_mechanic:client:adminRepair', source, true, false)
    if not repaired then return end

    exports.qbx_core:Notify(source, locale('notify.success.vehicle_repaired'), "success")
end)

RegisterNetEvent('qbx_mechanic:server:repairEngine', function()
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end

    if player.PlayerData.job.type ~= "mechanic" then
        exports.qbx_core:Notify(source, locale('notify.error.not_mechanic'), "error")
        return
    end

    local repaired = lib.callback.await('qbx_mechanic:client:repairEngine', source, true, false)
    if not repaired then return end

    exports.qbx_core:Notify(source, locale('notify.success.engine_repaired'), "success")
end)

RegisterNetEvent('qbx_mechanic:server:repairBody', function()
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end

    if player.PlayerData.job.type ~= "mechanic" then
        exports.qbx_core:Notify(source, locale('notify.error.not_mechanic'), "error")
        return
    end

    local repaired = lib.callback.await('qbx_mechanic:client:repairBody', source, false)
    if not repaired then return end

    exports.qbx_core:Notify(source, locale('notify.success.body_repaired'), "success")
end)

RegisterNetEvent('qbx_mechanic:server:cleanVehicle', function()
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end

    if player.PlayerData.job.type ~= "mechanic" then
        exports.qbx_core:Notify(source, locale('notify.error.not_mechanic'), "error")
        return
    end

    local cleaned = lib.callback.await('qbx_mechanic:client:cleanVehicle', source, false)
    if not cleaned then return end

    exports.qbx_core:Notify(source, locale('notify.success.cleaned'), "success")
end)