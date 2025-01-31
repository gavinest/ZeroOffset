--- === ZeroOffset ===
---
--- Display UTC time in the menu bar
---
--- Download:

local obj={}
obj.__index = obj

-- Metadata
obj.name = "ZeroOffset"
obj.version = "0.0.1"
obj.author = "Gavin Estenssoro"
obj.homepage = "https://github.com/gavinest/ZeroOffset"
obj.license = "MIT - https://opensource.org/licenses/MIT"

obj.showUtc = false

function obj:start()
    self.menuBarItem = hs.menubar.new()
    self.menuBarItem:setClickCallback(function() self:menuItemClicked() end)
    self:toggleShowUtc()
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