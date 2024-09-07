Locale = {}

function L(hash)
    return Locale[Config.locale][hash]
end

Debug = {
    success = function (text)
        if Config.debug then
            print("[^2SUCCESS^0] "..text)
        end
    end,
    info = function (text)
        if Config.debug then
            print("[^3INFO^0] "..text)
        end
    end,
    error = function (text)
        if Config.debug then
            print("[^1ERROR^0] "..text)
        end
    end
}