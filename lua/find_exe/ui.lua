local M = {}

--- Open a floating window
--- @return number The ID of the opened window
M.open_float = function()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_option_value("bufhidden", "wipe", { buf = buf })
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })

  local height = math.ceil(vim.o.lines * 0.8)
  local width = math.ceil(vim.o.columns * 0.8)

  local win = vim.api.nvim_open_win(buf, true, {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    row = math.ceil((vim.o.lines - height) / 2),
    col = math.ceil((vim.o.columns - width) / 2),
    border = "single",
  })

  vim.api.nvim_set_current_win(win)

  return win
end

return M
