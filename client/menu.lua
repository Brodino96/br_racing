---------------------- # ---------------------- # ---------------------- # ----------------------

local function openPanel()
    if not RacesList then
        RacesList = lib.callback.await("br_racing:getRaces", false)
    end
    SendNUIMessage({ action = "openPanel", info = RacesList })
end

---------------------- # ---------------------- # ---------------------- # ----------------------

-- Generating a new track
RegisterNUICallback("startRecording", function (body, cb)
    StartTrackRecording()
end)

RegisterNUICallback("pauseRecording", function (body, cb)
    PauseTrackRecording()
end)

RegisterNUICallback("startEditMode", function (body, cb)
    EditTrack()
end)

RegisterNUICallback("stopEditoMode", function (body, cb)
    StopEditMode()
end)

RegisterNUICallback("saveTrack", function (data, cb)
    TriggerServerEvent("br_racing:addNewRace", {
        racename = data.racename, owner = data.owner, public = data.public, track = json.encode(SaveTrack())
    })
end)

-- TODO: Load races

---------------------- # ---------------------- # ---------------------- # ----------------------

RegisterNetEvent("br_races:openPanel")
AddEventHandler("br_races:openPanel", openPanel)

---------------------- # ---------------------- # ---------------------- # ----------------------