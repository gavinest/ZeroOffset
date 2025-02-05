[![ci](https://github.com/gavinest/ZeroOffset/actions/workflows/ci.yml/badge.svg)](https://github.com/gavinest/ZeroOffset/actions/workflows/ci.yml)

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

Once the pull request is merged, make sure you are on the `main` branch an drun `make tag` to tag the commit with your version.

Push the tag to trigger the release workflow. `git push origin "v$(<VERSION)"`.
