local M = {}

M.check = function()
  vim.health.start("find_exe health check:")

  if vim.fn.executable("find") == 0 then
    vim.health.error("find executable not found in path")
    return
  end

  vim.health.ok("find executable found in path")
end

return M
