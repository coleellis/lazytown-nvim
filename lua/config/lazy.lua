-- This ensures lazy.nvim (the nvim package manager) is installed.
-- It can be accessed using :Lazy to show installed packages,
-- packages requiring updates, unused packages, etc.
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- This abstracts the autocommands, keymaps, and options into separate
-- files so they're easier to find and edit.
-- Autocmds: Changes to different events
-- Keymaps: New key bindins
-- Options: Standard .vimrc changes.
require "config.autocmds"
require "config.keymaps"
require "config.options"

-- Get utility functions
require "util.root"

-- Initiates lazy and tells it to look inside config.plugins for the plugins
-- list. It also checks for plugin updates each time nvim is started.
require("lazy").setup {
  spec = { { import = "plugins" } },
  checker = { enabled = true },
}

-- Using the cyberdream colorscheme.  Change the name in here to change the
-- colorscheme (requires reload). Ensure it's installed.
-- Catppuccin, Cyberdream, and Tokyonight are already installed and can be
-- found inside config.plugins.colorscheme.
vim.cmd.colorscheme "catppuccin-mocha"
