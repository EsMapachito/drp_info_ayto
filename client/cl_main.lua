local healing = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if not DoesEntityExist(lady_valentine) then
            RequestModel(GetHashKey("U_M_M_ANNOUNCER_01"))

            while not HasModelLoaded(GetHashKey("U_M_M_ANNOUNCER_01")) do
                Wait(100)
            end

            lady_valentine = CreatePed("U_M_M_ANNOUNCER_01", -798.65, -1202.69, 44.39, 184.99, false, true)
            SetPedRandomComponentVariation(lady_valentine, 0)
            SetBlockingOfNonTemporaryEvents(lady_valentine, true)
            SetEntityInvincible(lady_valentine, true)
            SetPedCanBeTargettedByPlayer(lady_valentine, GetPlayerPed(), false)
        end

        if IsPlayerNearCoords(-798.74, -1204.30, 44.39, 1) then
                DisplayNPCText("UJIER", 0.80, 0.40, 0.5, 0.85, 240, 255, 0, 1)
                DisplayNPCText("Bienvenido a BlackWater.\n Recuerda que en esta ciudad no hay lugar para los cuatreros.\n Busca un empleo o vete de la ciudad.\n Puedes contribuir a la sociedad con las siguientes labores:\n Leñador, Minero, Pescador, Agricultor, Cartero, Cazador o Cazarrecompensas", 0.35, 0.35, 0.5, 0.88, 255, 255, 255, 0)

        end
    end
end)

function IsPlayerNearCoords(x, y, z, radius)
    local playerx, playery, playerz = table.unpack(GetEntityCoords(GetPlayerPed(), 0))
    local distance = GetDistanceBetweenCoords(playerx, playery, playerz, x, y, z, true)

    if distance < radius then
        return true
    end
end

function DisplayNPCText(text, s1, s2, x, y, r, g, b, font)
    SetTextScale(s1, s2)
    SetTextColor(r, g, b, 255)--r,g,b,a
    SetTextCentre(true)--true,false
    SetTextDropshadow(1, 0, 0, 0, 200)--distance,r,g,b,a
    SetTextFontForCurrentCommand(font)
    DisplayText(CreateVarString(10, "LITERAL_STRING", text), x, y)
end

function HealPlayer()
    healing = true

    Wait(10000)
    if IsPlayerNearCoords(-312.01, 817.91, 122.17, 1) then
        Citizen.InvokeNative(0x50C803A4CD5932C5, true)
        Citizen.InvokeNative(0xC6258F41D86676E0, GetPlayerPed(), 0, 100)
        Citizen.InvokeNative(0xC6258F41D86676E0, GetPlayerPed(), 1, 100)
        healing = false
    else
        healing = false
    end
end
