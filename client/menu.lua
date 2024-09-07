---------------------- # ---------------------- # ---------------------- # ----------------------

local racesList = nil

---------------------- # ---------------------- # ---------------------- # ----------------------

local function openPanel()
    if not racesList then
        racesList = lib.callback.await("br_racing:getRaces", false)
    end
    SendNUIMessage({ action = "openPanel", info = racesList })
end

---------------------- # ---------------------- # ---------------------- # ----------------------

RegisterNetEvent("br_races:openPanel")
AddEventHandler("br_races:openPanel", openPanel)

RegisterNetEvent("br_racing:updateRaceList")
AddEventHandler("br_racing:updateRaceList", function (newList)
    racesList = newList
end)

---------------------- # ---------------------- # ---------------------- # ----------------------