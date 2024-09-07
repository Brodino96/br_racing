---------------------- # ---------------------- # ---------------------- # ----------------------

ESX = exports["es_extended"]:getSharedObject()

---------------------- # ---------------------- # ---------------------- # ----------------------
-- Functions

local function getJobs(playerId)
    if Config.jobSystem == "esx" then
        return { [1] = ESX.GetPlayerFromId(playerId).getJob().name }
    elseif Config.jobSystem == "br_multiJob" then
        return exports["br_multiJob"]:getJobs(playerId)
    end
end

function CanAccess(playerId)
    local jobs = getJobs(playerId)
    for i = 1, #jobs do
        for k = 1, #Config.jobs do
            if jobs[i] == Config.jobs[k] then
                return true
            end
        end
    end
    return false
end

---------------------- # ---------------------- # ---------------------- # ----------------------

RegisterCommand("racemanager", function (source, args)
    if not CanAccess(source) then
        return TriggerClientEvent("ox_lib:notify", source, { type = "error", title = L("command:cannot_access")})
    end

    TriggerClientEvent("br_races:openPanel", source)
end, false)

---------------------- # ---------------------- # ---------------------- # ----------------------