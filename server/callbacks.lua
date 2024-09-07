---------------------- # ---------------------- # ---------------------- # ----------------------

lib.callback.register("br_racing:getRaces", function (source)
    table.insert(HasRacesList, source)
    return GetRacesInfo()
end)

---------------------- # ---------------------- # ---------------------- # ----------------------