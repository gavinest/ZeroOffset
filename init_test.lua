-- luacheck: globals TestZeroOffset
local lu = require('luaunit')

-- Mock hammerspoon globally before importing ZeroOffset
hs = {
    menubar = {
        new = function()
            return {
                setClickCallback = function() end
            }
        end
    },
    hotkey = {
        enable = function() end
    }
}

local ZeroOffset = require('init')

TestZeroOffset = {}

function TestZeroOffset.testStartCreatesMenuBarItem()
    -- arrange
    lu.assertIsNil(ZeroOffset.menuBarItem)
    ZeroOffset.toggleShowUtc = function() end

    -- act
    ZeroOffset:start()

    -- assert
    lu.assertNotNil(ZeroOffset.menuBarItem)
end

os.exit(lu.LuaUnit.run())