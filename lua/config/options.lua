-- The leader key.  This key provides access to the rest of nvim's functionality.
-- The most common key used here is <space>.
vim.g.mapleader = " "

vim.g.autoformat = true -- Vim autoformat

vim.g.lazyvim_picker = "auto" -- Which picker to use (telescope, fzf)
vim.g.lazygit_config = true -- Automatic configuration for lazygit (enables NF icons, theme, etc)

vim.g.trouble_lualine = true -- oShows document symbols from Trouble in lualine

-- Making it faster to change the vim options
local opt = vim.opt

opt.autowrite = true -- Enable autowrite
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Use global clipboard (+) or ssh clipboard
opt.conceallevel = 2 -- Hide * on markdown for bold/italic, but not markers with substitutions
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = false -- Adds highlighting on current cursor line (disabled for better transparent feel)
opt.expandtab = true -- Use spaces instead of tabs
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.laststatus = 3 -- Global statusline
opt.mouse = "a" -- Enable mouse
opt.number = true -- Show current line number
opt.pumblend = 10 -- Popup blending with background
opt.pumheight = 10 -- Maximum entries per popup
opt.relativenumber = true -- Relative line numbering (better for jk keys)
opt.scrolloff = 8 -- Must show 8 lines when scrolling vertically
opt.showmode = false -- Don't show mode (we have a status line)
opt.shiftwidth = 4 -- Indents are size 4
opt.sidescrolloff = 8 -- Must show 8 lines when scrolling horizontally
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Smart indenting
opt.splitbelow = true -- New window below current
opt.splitright = true -- New window right of current
opt.tabstop = 4 -- Tabs are 4 spaces
opt.termguicolors = true -- True colors for terminal
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file faster
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.wrap = false -- Disable line wrap

vim.g.markdown_recommended_style = 0 -- Fix terminal size

-- Change line number colors (overriden by :TransparentEnable)
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#D3D3D3" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#D3D3D3" })
vim.api.nvim_set_hl(0, "LineNr", { fg = "white" })

-- Change cursorline color if you want cursorline on
vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = "none", bg = "none" })
