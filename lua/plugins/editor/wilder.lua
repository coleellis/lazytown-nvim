return {
  -- wilder provides autocomplete functionality for the command line.
  -- It supports autocomplete for commands, searches, and the help
  -- manual.
  {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require "wilder"
      wilder.setup {
        modes = { ":", "/", "?" },
        next_key = "<Tab>",
        previous_key = "<S-Tab>",
        accept_key = "<Down>",
        reject_key = "<Up>",
      }
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer {
          highlighter = wilder.basic_highlighter(),
          left = { " ", wilder.popupmenu_devicons() },
          right = { " ", wilder.popupmenu_scrollbar() },
          pumblend = 20,
        }
      )
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(wilder.popupmenu_border_theme {
          highlights = { border = "Normal" },
          border = "rounded",
        })
      )
    end,
  },
}
