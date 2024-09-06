---------------------- # ---------------------- # ---------------------- # ----------------------

local recordInProgress = false
local editingInProgress = false
local track = {}
local blips = {}

--[[
Devi poter:
- Far partire la registrazione
- Metterla in pausa vedendo ancora i blips
- Farla ripartire
- Entrare in modalità modifica (per spostare i blips)
- Salvare la registrazione (stoppare e resettare tutti i valori)
]]

---------------------- # ---------------------- # ---------------------- # ----------------------

local function addToTrack(coords)
    track[#track+1] = coords
    blips[#blips+1] = AddBlipForCoord(coords.x, coords.y, coords.z)
end

local function resetTrackBlips()
    for i = 1, #blips do
        RemoveBlip(blips[i])
    end
    blips = {}
end

function StartTrackRecording()
    CreateThread(function ()
        recordInProgress = true
        while recordInProgress do
            Wait(0)

            local position = #track + 1

            -- Press [ENTER]
            if IsControlJustPressed(0, 18) then
                addToTrack(GetEntityCoords(PlayerPedId()))
            end

            -- Place a marker on the map

            if IsPauseMenuActive() then
                local waypoint = GetFirstBlipInfoId(8)
                if DoesBlipExist(waypoint) then
                    addToTrack(GetBlipInfoIdCoord(waypoint))
                    RemoveBlip(waypoint)
                end
            end
        end
    end)
end

function PauseTrackRecording()
    recordInProgress = false
end

local this = false
local function moveTrackPoint(position)
    this = true
    CreateThread(function ()
        while this do
            Wait(0)

            local waypoint = GetFirstBlipInfoId(8)
            if not DoesBlipExist(waypoint) then
                goto skip
            end

            blips[position] = GetBlipInfoIdCoord(waypoint)
            EditTrack()
            this = false

            ::skip::
        end
    end)
end

function EditTrack()
    CreateThread(function ()
        recordInProgress = false
        editingInProgress = true
        while editingInProgress do
            Wait(0)

            if not IsPauseMenuActive() then
                goto skip
            end

            local waypoint = GetFirstBlipInfoId(8)
            if not DoesBlipExist(waypoint) then
                goto skip
            end

            local wCoords = GetBlipInfoIdCoord(waypoint)
            for i = 1, #blips do
                if wCoords == GetBlipInfoIdCoord(blips[i]) then
                    moveTrackPoint(i)
                end
            end

            ::skip::

        end
    end)
end

function StopEditMode()
    editingInProgress = false
    this = false
    StartTrackRecording()
end

function SaveTrack()
    resetTrackBlips()
    local arr = track
    track = {}
    return arr
end

---------------------- # ---------------------- # ---------------------- # ----------------------