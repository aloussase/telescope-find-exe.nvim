local M = {}

--- @class Opts
--- @field dir string Directory where to search for executable files.
--- @field execute boolean Whether to execute the selected file or not.

local valid_opts = { "dir", "execute" }

---@param opts Opts
---@return Opts
M.parse_opts = function(opts)
  local o = opts or {}

  for k, _ in pairs(o) do
    if not vim.tbl_contains(valid_opts, k) then
      error(string.format("Unexpected field '%s' in options table", k))
    end
  end

  o.dir = opts.dir or "."
  o.execute = opts.execute or false
  return o
end

return M
