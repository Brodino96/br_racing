---------------------- # ---------------------- # ---------------------- # ----------------------

local function openPanel()
    if not RacesList then
        RacesList = lib.callback.await("br_racing:getRaces", false)
    end
    SendNUIMessage({ action = "openPanel", info = RacesList })
end

---------------------- # ---------------------- # ---------------------- # ----------------------

RegisterNetEvent("br_races:openPanel")
AddEventHandler("br_races:openPanel", openPanel)

---------------------- # ---------------------- # ---------------------- # ----------------------