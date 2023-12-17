RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

if not table.unpack then
  ---@diagnostic disable-next-line: deprecated
  table.unpack = unpack
end

---Split a string into a table
---@param str string
---@param separator string | nil
---@return table
string.split = function(str, separator)
  local lines = {}
  local sep = separator or "^\r\n" -- line break

  for s in str:gmatch("[" .. sep .. "]+") do
    table.insert(lines, s)
  end

  return lines
end

