-- luacheck: globals TestZeroOffset
package.path = package.path .. ';./src/?.lua;./tests/?.lua'
local lu = require('luaunit')
local ZeroOffset = require('init')
local mock_hs = require('mock_hammerspoon')

ZeroOffset.hs = mock_hs

TestZeroOffset = {}

function TestZeroOffset.setUp()
    ZeroOffset:init()
end

function TestZeroOffset.tearDown()
    ZeroOffset:stop()
end

function TestZeroOffset.testStartCreatesMenuBarItem()
    -- arrange
    lu.assertIsNil(ZeroOffset.menuBarItem)

    -- act
    ZeroOffset:start()

    -- assert
    lu.assertNotNil(ZeroOffset.menuBarItem)
end

function TestZeroOffset.testClickedShowsUtc()
    -- arrange
    ZeroOffset:start()

    -- act
    ZeroOffset:clicked()

    -- assert
    lu.assertStrContains(ZeroOffset.menuBarItem.title, 'UTC')
end

os.exit(lu.LuaUnit.run('-v'))