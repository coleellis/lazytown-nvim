return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      italic_comments = true,
      hide_fillchars = true,
      borderless_telescope = false,
      terminal_colors = true,
      cache = false,
      theme = {
        variant = "default",
      },
      extensions = {
        telescope = true,
        notify = true,
        lazy = true,
        mini = true,
      },
    },
  },
}
