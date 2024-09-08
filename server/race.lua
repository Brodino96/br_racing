---------------------- # ---------------------- # ---------------------- # ----------------------

local function joinRace(race)
    -- Pay
    if exports.ox_inventory:GetItemCount(source, Config.currency) < race.price then
        return TriggerClientEvent("ox_lib:notify", source, { type = "error", title = L("notify:not_enough_money") })
    end
    exports.ox_inventory:RemoveItem(source, Config.currency, race.price)
    TriggerClientEvent("ox_lib:notify", source, { type = "success", title = L("notify:joined_race")})

    TriggerClientEvent("br_racing:joinRace", source, race)
end

---------------------- # ---------------------- # ---------------------- # ----------------------

RegisterNetEvent("br_racing:openRegistrations")
AddEventHandler("br_racing:openRegistrations", function (race)
    TriggerClientEvent("br_racing:openRegistrations", -1, race)
end)

RegisterNetEvent("br_racing:joinRace")
AddEventHandler("br_racing:joinRace", joinRace)

---------------------- # ---------------------- # ---------------------- # ----------------------