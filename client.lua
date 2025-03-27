local function playMechanicAnimation()
    lib.requestAnimDict('mini@repair')
    TaskPlayAnim(PlayerPedId(), 'mini@repair', 'fixing_a_car', 8.0, -8.0, -1, 1, 0, false, false, false)
end

local function faceVehicle(vehicle)
    local playerPed = PlayerPedId()
    local vehicleCoords = GetEntityCoords(vehicle)
    local playerCoords = GetEntityCoords(playerPed)
    local direction = vector3(vehicleCoords.x - playerCoords.x, vehicleCoords.y - playerCoords.y, 0.0)
    local heading = GetHeadingFromVector_2d(direction.x, direction.y)
    SetEntityHeading(playerPed, heading)
end

local function repairVehicle(vehicle)
    local playerPed = PlayerPedId()
    
    -- Open hood
    SetVehicleDoorOpen(vehicle, 4, false, false)
    
    -- Face the vehicle
    faceVehicle(vehicle)
    
    -- Play animation
    playMechanicAnimation()
    
    -- Progress bar
    if lib.progressBar({
        duration = 8000,
        label = 'Repairing Vehicle',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            move = true,
        },
    }) then
        -- Repair vehicle
        SetVehicleFixed(vehicle)
        SetVehicleDeformationFixed(vehicle)
        SetVehicleUndriveable(vehicle, false)
        SetVehicleEngineOn(vehicle, true, true, false)
        
        -- Close hood
        SetVehicleDoorShut(vehicle, 4, false)
        
        -- Stop animation
        ClearPedTasks(playerPed)
        
        -- Notify success
        lib.notify({
            title = 'Success',
            description = 'Vehicle has been repaired',
            type = 'success'
        })
    else
        -- If cancelled
        ClearPedTasks(playerPed)
        SetVehicleDoorShut(vehicle, 4, false)
        
        lib.notify({
            title = 'Cancelled',
            description = 'Repair cancelled',
            type = 'error'
        })
    end
end

-- Create target for vehicle hoods
exports.ox_target:addGlobalVehicle({
    {
        name = 'repair_vehicle',
        icon = 'fa-solid fa-wrench',
        label = 'Repair Vehicle',
        bones = {'bonnet'},
        distance = 2.0,
        onSelect = function(data)
            if not data.entity then return end
            repairVehicle(data.entity)
        end
    }
})