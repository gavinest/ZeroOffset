[![ci](https://github.com/gavinest/ZeroOffset/actions/workflows/ci.yml/badge.svg)](https://github.com/gavinest/ZeroOffset/actions/workflows/ci.yml)

# ZeroOffset

\[Update\]: ZeroOffset is now part of the official Hammerspoon Spoon repository! View it on the Spoons page here.

A [Hammerspoon](https://www.hammerspoon.org/) to display a UTC timestamp in the menubar. Toggle on and off with a click or hotkeys.

https://github.com/user-attachments/assets/1095736c-464c-4bd3-b4a2-79f2c3e80ec0


## Table of Contents
`
- [Installation](#installation)
- [Contributing](#contributing)

## Installation

[Hammerspoon](https://www.hammerspoon.org/) must be installed and running.

### With SpoonInstall

We recommend using [SpoonInstall](https://www.hammerspoon.org/Spoons/SpoonInstall.html#repos) to manage Spoons.

If using SpoonInstall then add the ZeroOffset repo and config to your `~/.hammerspoon/init.lua` file.

```lua
-- ~/.hammerspoon/init.lua

-- ...

hs.loadSpoon("SpoonInstall")  -- should already be set if using SpoonInstall

-- ...

shortcut_keys = { "ctrl", "alt" }

spoon.SpoonInstall.repos.ZeroOffset = {
    url = "https://github.com/gavinest/ZeroOffset",
    desc = "ZeroOffset spoon repository",
    branch = "main",
}
spoon.SpoonInstall:andUse(
    "ZeroOffset",
    {
        repo = "ZeroOffset",
        start = true,
        hotkeys = {
            toggle = {shortcut_keys, "z"}
        },
    }
)

```

### Manual Installation

If not using SpoonInstall.

1. [download](https://github.com/gavinest/ZeroOffset/blob/main/Spoons/ZeroOffset.spoon.zip) and unzip `ZeroOffset.spoon.zip`.

2. Open the `ZeroOffset.spoon` directory and Hammerspoon should prompt that the newly installed spoon is now available.

3. Add the following to your `~/.hammerspoon/init.lua` file.

```lua
-- ~/.hammerspoon/init.lua
hs.loadSpoon("ZeroOffset")
spoon.ZeroOffset:bindHotkeys({toggle = {{"ctrl", "alt"}, "z"}})  -- or any other hotkey you prefer
spoon.ZeroOffset:start()
```

## Contributing

1. Make sure you have access to `hs.ipc` in your shell or the `makefile` won't work on certain commands.

```lua
-- ~/.hammerspoon/init.lua

require("hs.ipc")
```

2. Create a feature branch and make your changes and commit.

4. If your changes do _not_ require a release, open a pull request with your changes.

5. If your changes require a release, bump the version in the `VERSION` file. Run `make version`.

Commit files changed by the `make version` command to your feature branch. Open a pull requeest.

Once the pull request is merged, make sure you are on the `main` branch and run `make tag` to tag the commit with your version.

Push the tag to trigger the release workflow. `git push origin "v$(<VERSION)"`.
