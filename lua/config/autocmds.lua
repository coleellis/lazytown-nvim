-- This function groups autocommands by namespace.  For example, TextYankPost
-- is the namespace for vim's on_yank functionality.
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- Highlights text when yanked.
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup "highlight_yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- ColorScheme changes
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  group = vim.api.nvim_create_augroup("Color", {}),
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "LspReferenceRead", { fg = "#FF0000" })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { fg = "#FF0000" })
    vim.api.nvim_set_hl(0, "LspReferenceText", { fg = "#FF0000" })
  end,
})

-- saving with W
vim.api.nvim_create_user_command("W", function()
  vim.cmd "w"
end, {})
