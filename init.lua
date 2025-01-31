--- === ZeroOffset ===
---
--- Display UTC time in the menu bar
---
--- Download: [https://github.com/gavinest/ZeroOffset/blob/main/Spoons/ZeroOffset.spoon.zip](https://github.com/gavinest/ZeroOffset/blob/main/Spoons/ZeroOffset.spoon.zip)

local obj={}
obj.__index = obj

-- Metadata
obj.name = "ZeroOffset"
obj.version = "0.0.1"
obj.author = "Gavin Estenssoro"
obj.homepage = "https://github.com/gavinest/ZeroOffset"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.menuBarItem = nil
obj.showUtc = false

function obj:start()
    if self.menuBarItem then self:stop() end
    self.menuBarItem = hs.menubar.new()
    self.menuBarItem:setClickCallback(function() self:menuItemClicked() end)
    self:toggleShowUtc()
    return self
end

function obj:stop()
    if self.menuBarItem then self.menuBarItem:delete() end
    self.menuBarItem = nil
    return self
end

function obj:toggleShowUtc()
    if self.showUtc then
        local utc_time = os.date("!%Y-%m-%d %H:%M:%S")
        self.menuBarItem:setTitle(utc_time .. ' UTC')
    else
        self.menuBarItem:setTitle("UTC")
    end 
    self.showUtc = not self.showUtc
end

function obj:menuItemClicked()
    self:toggleShowUtc()
end

return obj