local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

--- @class Opts
--- @field dir string Directory where to search for executable files.

---@param opts Opts
---@return Opts
local function parse_opts(opts)
  local o = opts or {}
  o.dir = opts.dir or "."
  return o
end

--- Find executable files in a given directory.
---@param opts Opts
local function find_exe(opts)
  opts = parse_opts(opts)
  pickers.new(opts, {
    prompt_title = "Find Executable Files in Current Directory",
    finder = finders.new_oneshot_job({ "find", opts.dir, "-type", "f", "-executable" }, {}),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.fn.setreg("@", selection.value)
      end)
      return true
    end,
  }):find()
end

return require("telescope").register_extension {
  exports = {
    find_exe = find_exe,
  },
}
