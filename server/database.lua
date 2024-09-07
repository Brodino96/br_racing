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
        `owner` VARCHAR(50),
        `public` TINYINT(1),
        `track` LONGTEXT NOT NULL,
        PRIMARY KEY (`raceid`))
    ]])

    if response then
        return print("[^2SUCCESS^0] Database connection established")
    end
    return print("[^1ERROR^0] Database connection failed")
end)

---------------------- # ---------------------- # ---------------------- # ----------------------