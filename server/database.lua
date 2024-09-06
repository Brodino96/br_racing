---------------------- # ---------------------- # ---------------------- # ----------------------

RegisterNetEvent("onResourceStart")
AddEventHandler("onResourceStart", function (rName)
    if rName == GetCurrentResourceName() then
        return
    end

    local response = MySQL.transaction.await([[
        CREATE TABLE IF NOT EXISTS `br_racing` (
        `raceid` INT NOT NULL AUTO_INCREMENT,
        `owner` VARCHAR(40),
        `sharable` TINYINT(1),
        `track` LONGTEXT NOT NULL,
        PRIMARY KEY (`raceid`))
    ]])
end)

---------------------- # ---------------------- # ---------------------- # ----------------------