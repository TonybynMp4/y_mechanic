local function useRepairKit(source, isAdvanced)
    local player = exports.qbx_core:GetPlayer(source)
    if not player then return end
    local used = lib.callback.await('y_mechanic:client:repairEngine', source, isAdvanced, true)
    if not used then return false end

    exports.qbx_core:Notify(source, locale('notify.success.engine_repaired'), "success")
    return true
end

exports('repairkit', function(event, _, inventory, _, _)
    if event == 'usingItem' then
        local used = useRepairKit(inventory.id, false)
        return used
    end
end)

exports('advancedrepairkit', function(event, _, inventory, _, _)
    if event == 'usingItem' then
        local used = useRepairKit(inventory.id, true)
        return used
    end
end)

exports("bodykit", function(event, _, inventory, _, _)
    local source = inventory.id
    if event == 'usingItem' then
        local used = lib.callback.await('y_mechanic:client:repairBody', source, true)
        return used
    end

    if event == 'usedItem' then
        return exports.qbx_core:Notify(source, locale('notify.success.body_repaired'), "success")
    end
end)

exports("cleaningkit", function(event, _, inventory, _, _)
    local source = inventory.id
    if event == 'usingItem' then
        local used = lib.callback.await('y_mechanic:client:cleanVehicle', source, true)
        return used
    end

    if event == 'usedItem' then
        return exports.qbx_core:Notify(source, locale('notify.success.cleaned'), "success")
    end
end)

exports("wheelkit", function(event, _, inventory, _, _)
    local source = inventory.id
    if event == 'usingItem' then
        local used = lib.callback.await('y_mechanic:client:useWheelKit', source)
        return used
    end

    if event == 'usedItem' then
        exports.qbx_core:Notify(source, locale('notify.success.tyres_changed'), "success")
    end
end)