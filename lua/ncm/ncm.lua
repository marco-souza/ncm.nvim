local M = {}

local split = require("shared.utils").split
local base_path = vim.fn.resolve(vim.fn.getenv("HOME") .. "/.config")
local main_path = vim.fn.resolve(base_path .. "/nvim")

local function remove_config(path)
  if vim.loop.fs_stat(path) then
    vim.fn.system({
      "rm",
      "-rf",
      path,
    })
  end

  local cache_path =
    vim.fn.resolve(vim.fn.getenv("HOME") .. "/.local/shared/nvim")
  if vim.loop.fs_stat(cache_path) then
    vim.fn.system({
      "rm",
      "-rf",
      cache_path,
    })
  end
end

---apply nvim config
---@param config_path string
local function apply_config(config_path)
  vim.notify("applying: " .. config_path)

  if not vim.loop.fs_stat(config_path) then
    vim.notify(config_path .. " not found 🥲")
    return
  end

  remove_config(main_path)

  if not vim.loop.fs_symlink(config_path, main_path) then
    return vim.notify("failed to link new dir 🥲")
  end

  vim.notify("new config applied! 🎉\nPlease reboot vim!")
  -- require("plenary.reload").reload_module(main_path .. "/init.lua", false)
end

---create a new nvim config
--
-- ex: create_config("default", "marco-souza/scratch.nvim")
--
---@param name string
---@param repo string
local function create_config(name, repo)
  -- TODO: make this dynamic
  repo = "https://github.com/" .. repo .. ".git"

  -- install config
  local config_path = base_path .. "/" .. name .. ".nvim"
  if not vim.loop.fs_stat(config_path) then
    vim.fn.system({
      "git",
      "clone",
      repo,
      config_path,
    })
  end

  vim.notify(name .. " config created!")
end

---select config
--
-- if name is pass, no select input will be shown
--
---@param name string | nil
---@param prompt string
---@param on_select_config function(config_path string)
--
---@return unknown
local function select_config(name, prompt, on_select_config)
  if name ~= nil then
    local config_path = base_path .. "/" .. name
    return on_select_config(config_path)
  end

  local options = {}
  local all_files = vim.fn.system({
    "ls",
    base_path,
  })

  for _, val in ipairs(split(all_files)) do
    if string.match(val, ".nvim") then
      table.insert(options, val)
    end
  end

  local function on_select(selected_config)
    if selected_config == nil then
      return
    end

    local config_path = base_path .. "/" .. selected_config
    return on_select_config(config_path)
  end

  return vim.ui.select(options, { prompt = prompt }, on_select)
end

function M.config_command(opts)
  local args = split(opts.args or "", "%S")
  local name, repo = table.unpack(args)

  if name == "del" then
    name = repo -- switch values
    local prompt = "🗑️ Select a config to delete"
    return select_config(name, prompt, remove_config)
  end

  if repo == nil then
    local prompt = "🛫 Select a config to load"
    return select_config(name, prompt, apply_config)
  end

  return create_config(name, repo)
end

return M
