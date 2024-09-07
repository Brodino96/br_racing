---------------------- # ---------------------- # ---------------------- # ----------------------

local race = {}

race.settings = {
    time = 5,
    price = 5,
    laps = 1,
}

---------------------- # ---------------------- # ---------------------- # ----------------------

RegisterNetEvent("br_racing:loadRaceTrack")
AddEventHandler("br_racing:loadRaceTrack", function (track)
    race.track = track
end)

RegisterNetEvent("br_racing:loadRaceSettings")
AddEventHandler("br_racing:loadRaceSettings", function (settings)
    race.settings = settings
end)

---------------------- # ---------------------- # ---------------------- # ----------------------