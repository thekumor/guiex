--[[
                    _           
         __ _ _  _(_)  _____ __
        / _` | || | | / -_) \ /
        \__, |\_,_|_| \___/_\_\
        |___/        
        
    ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
    ● gui ex
    ● lua/autorun/client/guiex.lua
    ● Library that implements screen scaling and color caching.
    ▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬▬
]]


guiex = { }

-- From 1920x1080 x to client's
--
guiex.X = function(val)
    return val * ScrW() / 1920
end

-- From 1920x1080 y to client's
--
guiex.Y = function(val)
    return val * ScrH() / 1080
end

-- From 1920x1080 to client's, x and y at a time.
--
guiex.XY = function(x, y)
    return guiex.X(x), guiex.Y(y)
end

-- Color caching.
--
guiex.colors = { }
guiex.Color = function(r, g, b, a)
    a = a or 255

    local hash = r .. " " .. g .. " " .. b .. " " .. a

    local colors = guiex.colors
    if colors[hash] then
        return colors[hash]
    end

    colors[hash] = Color(r, g, b, a)

    return colors[hash]
end


-- The Kumor @ 2023