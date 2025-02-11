local mock_timer = {
    start = function() end,
    stop = function() end
}

local mock_menubar = {
    setClickCallback = function() end,
    title = nil,
    setTitle = function(self, newTitle) self.title = newTitle end,
    setIcon = function(_) end,
    delete = function() end
}

local hs = {
    menubar = {
        new = function() return mock_menubar end,
    },
    timer = {
        new = function() return mock_timer end,
    },
    hotkey = {
        enable = function() end
    },
    spoons = {
        resourcePath = function() return 'icon.png' end
    },
    image = {
        imageFromPath = function() return {setSize = function(_) end} end
    }
}

return hs