local M = {}

--- @class Opts
--- @field dir string Directory where to search for executable files.
--- @field execute boolean Whether to execute the selected file or not.

---@param opts Opts
---@return Opts
M.parse_opts = function(opts)
  local o = opts or {}
  o.dir = opts.dir or "."
  o.execute = opts.execute or false
  return o
end

return M
