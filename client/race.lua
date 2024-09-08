---------------------- # ---------------------- # ---------------------- # ----------------------

local registred = false
local blips = {}

---------------------- # ---------------------- # ---------------------- # ----------------------

AddTextEntry("registration_prompt", L("prompt:registration"))

---------------------- # ---------------------- # ---------------------- # ----------------------

local function openRegistrations(race)
    CreateThread(function ()
        while not registred do
            Wait(0)

            local coords = GetEntityCoords(PlayerPedId())

            if #(coords - race.track[1]) > Config.registrationRange then
                goto skip
            end

            DisplayHelpTextThisFrame("registration_prompt", false)
            if IsControlJustPressed(0, 38) then

                local alert = lib.alertDialog({
                    header = L("dialog:registration_header"),
                    content = L("dialog:registration_content")..race.price.." "..exports.ox_inventory:Items(Config.currency).label,
                    centered = true,
                    cancel = true,
                    labels = {
                        cancel = L("cancel"),
                        confirm = L("confirm")
                    }
                })

                if alert == "cancel" or alert == nil then
                    return
                end

                TriggerServerEvent("br_racing:joinRace", race)
            end

            ::skip::
        end
    end)
end

local function closeRegistration()
    registred = true
end

local function joinRace(race)
    registred = true

    CreateThread(function ()
        for i = 1, #race.track do
            blips[i] = AddBlipForCoord(table.unpack(race.track[i]))
        end
    end)
end

---------------------- # ---------------------- # ---------------------- # ----------------------

RegisterNetEvent("br_racing:openRegistrations")
AddEventHandler("br_racing:openRegistrations", openRegistrations)

RegisterNetEvent("br_racing:joinRace")
AddEventHandler("br_racing:joinRace", joinRace)

---------------------- # ---------------------- # ---------------------- # ----------------------