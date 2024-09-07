---------------------- # ---------------------- # ---------------------- # ----------------------

function GetRacesInfo()
    local response = MySQL.query.await("SELECT `raceid`, `racename`, `owner`, `public` FROM `br_racing`")
    local arr = {}

    for i = 1, #response do
        if response[i].public then
            arr[#arr+1] = response[i]
        end
    end
    return arr
end

function GetRaceTrack(id)
    return MySQL.query.await("SELECT `track` FROM `br_racing` WHERE `raceid` = ?", { id })
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
        `leaderboard` LONGTEXT NOT NULL,
        PRIMARY KEY (`raceid`))
    ]])

    if response then
        return print("[^2SUCCESS^0] Database connection established")
    end
    return print("[^1ERROR^0] Database connection failed")
end)

---------------------- # ---------------------- # ---------------------- # ----------------------