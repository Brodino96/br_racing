---------------------- # ---------------------- # ---------------------- # ----------------------

lib.callback.register("br_racing:getRaces", function (source)
    HasRacesList[tonumber(source)] = true
    return GetRacesInfo()
end)

---------------------- # ---------------------- # ---------------------- # ----------------------