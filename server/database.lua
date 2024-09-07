---------------------- # ---------------------- # ---------------------- # ----------------------

function GetRacesInfo()
    return MySQL.query.await("SELECT * FROM `br_racing` WHERE `public` = ?", { 1 })
end

function AddNewRace(race)
    local query = "INSERT INTO `br_racing` (racename, identifier, owner, public, track) VALUES (?, ?, ?, ?, ?)"
    local response = MySQL.insert.await(query, {
        race.racename, ESX.GetPlayerFromId(id).getIdentifier(), race.owner, race.public, json.encode(race.track)
    })
    if response then
        Debug.success("Race uploaded")
    else
        Debug.error("Race couldn't be uploaded")
    end
end

---------------------- # ---------------------- # ---------------------- # ----------------------

RegisterNetEvent("onResourceStart")
AddEventHandler("onResourceStart", function (rName)
    if rName == GetCurrentResourceName() then
        return
    end

    local response = MySQL.transaction.await([[
        CREATE TABLE IF NOT EXISTS `br_racing` (
        `raceid` INT NOT NULL AUTO_INCREMENT,
        `racename` VARCHAR(50),
        `identifier` VARCHAR(46),
        `owner` VARCHAR(50),
        `public` TINYINT(1),
        `track` LONGTEXT NOT NULL,
        `leaderboard` LONGTEXT,
        PRIMARY KEY (`raceid`))
    ]])

    if response then
        return print("[^2SUCCESS^0] Database connection established")
    end
    return print("[^1ERROR^0] Database connection failed")
end)

---------------------- # ---------------------- # ---------------------- # ----------------------