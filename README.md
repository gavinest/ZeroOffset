# ZeroOffset

A [Hammerspoon](https://www.hammerspoon.org/) to display a UTC timestamp in the menubar.

## Installation

1. Install [Hammerspoon](https://www.hammerspoon.org/).

2. [Recommended] If using [SpoonInstall](https://www.hammerspoon.org/Spoons/SpoonInstall.html#repos) to manage Spoons,
then add the following to your `~/.hammerspoon/init.lua`:

```lua
-- ~/.hammerspoon/init.lua

-- ...

hs.loadSpoon("SpoonInstall")  -- should already be set if using SpoonInstall

-- ...

spoon.SpoonInstall.repos.ZeroOffset = {
    url = "https://github.com/gavinest/ZeroOffset",
    desc = "ZeroOffset spoon repository",
    branch = "master",
}
spoon.SpoonInstall:andUse(
    "ZeroOffset",
    {
        repo = "ZeroOffset",
        start = true,
    }
)
```

3. [Alternative] If not using SpoonInstall, first make sure Hammerspoon is started. Then download and unzip `ZeroOffset.spoon.zip`.
Open the `ZeroOffset.spoon` directory and Hammerspoon should prompt that the newly installed spoon is now available.
