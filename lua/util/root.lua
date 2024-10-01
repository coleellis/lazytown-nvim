local M = {}

-- gets the root on open for telescope/neo-tree
function M.store_directory()
  local arg = vim.fn.argv(0)
  if arg and vim.fn.isdirectory(arg) == 1 then
    vim.g.root = arg
  else
    vim.g.root = vim.fn.getcwd()
  end
end

M.store_directory()

return M
