<h1 align="center">🐙 Neovim Config Manager</h1>
<div>
  <h4 align="center">
    <a href="#dependencies">Dependencies</a> ·
    <a href="#usage">Usage</a>
  </h4>
</div>
<div align="center">
  <a href="https://github.com/marco-souza/ncm.nvim/releases/latest"
    ><img
      alt="Latest release"
      src="https://img.shields.io/github/v/release/marco-souza/ncm.nvim?style=for-the-badge&logo=starship&logoColor=D9E0EE&labelColor=302D41&&color=d9b3ff&include_prerelease&sort=semver"
  /></a>
  <a href="https://github.com/marco-souza/ncm.nvim/pulse"
    ><img
      alt="Last commit"
      src="https://img.shields.io/github/last-commit/marco-souza/ncm.nvim?style=for-the-badge&logo=github&logoColor=D9E0EE&labelColor=302D41&color=9fdf9f"
  /></a>
  <a href="https://github.com/neovim/neovim/releases/latest"
    ><img
      alt="Latest Neovim"
      src="https://img.shields.io/github/v/release/neovim/neovim?style=for-the-badge&logo=neovim&logoColor=D9E0EE&label=Neovim&labelColor=302D41&color=99d6ff&sort=semver"
  /></a>
  <a href="http://www.lua.org/"
    ><img
      alt="Made with Lua"
      src="https://img.shields.io/badge/Built%20with%20Lua-grey?style=for-the-badge&logo=lua&logoColor=D9E0EE&label=Lua&labelColor=302D41&color=b3b3ff"
  /></a>
</div>
<hr />

This project is my neovim setup from ncm (`ncm.nvim`).

It setups up a few basic thigs like:

- editor configs
- colorscheme
- plugins
- treesitter

This was baes on:

- [Understanding Neovim](https://www.youtube.com/watch?v=87AXw9Quy9U&list=PLx2ksyallYzW4WNYHD9xOFrPRYGlntAft)
- [Neovim IDE from ncm](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)

## Dependencies

Besides`lazy.nvim` you will also need the following dependencies:

```lua
-- with Lazy
{
  -- other stuff ...
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
},
```

### Development

For development,you will also need:

- `git` to clone
- `stylua` and `luacheck` to lint the project

## Usage

```lua
-- with Lazy
{
  "marco-souza/ncm.nvim",
  event = "VeryLazy",
  opts = {
    -- startup config
    default = "nvchad.nvim",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
},
```

After that you can use `:Config` command in your neovim:

```sh
# select a configuration
:Config

# create a config
:Config scratch marco-souza/scratch.nvim
```
