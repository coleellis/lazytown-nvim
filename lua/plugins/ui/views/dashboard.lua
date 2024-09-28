return {
  -- dashboard.nvim is the dashboard you see when you first
  -- open nvim. There are two modes: hyper and doom. These
  -- are better explained on the dashboard-nvim repo.
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local logo = [[
 ▄█          ▄████████  ▄███████▄  ▄██   ▄       ███      ▄██████▄   ▄█     █▄  ███▄▄▄▄
███         ███    ███ ██▀     ▄██ ███   ██▄ ▀█████████▄ ███    ███ ███     ███ ███▀▀▀██▄
███         ███    ███       ▄███▀ ███▄▄▄███    ▀███▀▀██ ███    ███ ███     ███ ███   ███
███         ███    ███  ▀█▀▄███▀▄▄ ▀▀▀▀▀▀███     ███   ▀ ███    ███ ███     ███ ███   ███
███       ▀███████████   ▄███▀   ▀ ▄██   ███     ███     ███    ███ ███     ███ ███   ███
███         ███    ███ ▄███▀       ███   ███     ███     ███    ███ ███     ███ ███   ███
███▌    ▄   ███    ███ ███▄     ▄█ ███   ███     ███     ███    ███ ███ ▄█▄ ███ ███   ███
█████▄▄██   ███    █▀   ▀████████▀  ▀█████▀     ▄████▀    ▀██████▀   ▀███▀███▀   ▀█   █▀
▀
            ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "hyper",
        hide = { statusline = false },
        config = {
          header = vim.split(logo, "\n"),
        },
        shortcut = {
          { desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
          {
            icon = " ",
            icon_hl = "@variable",
            desc = "Files",
            group = "Label",
            action = "Telescope find_files",
            key = "f",
          },
          {
            desc = " Apps",
            group = "DiagnosticHint",
            action = "Telescope app",
            key = "a",
          },
          {
            desc = " dotfiles",
            group = "Number",
            action = "Telescope dotfiles",
            key = "d",
          },
        },
      }
      return opts
    end,
  },
}
