return {
  -- wilder provides autocomplete functionality for the command line.
  -- It supports autocomplete for commands, searches, and the help
  -- manual.
  {
    "gelguy/wilder.nvim",
    opts = {
      modes = { ":", "/", "?" },
      next_key = "<Tab>",
      previous_key = "<S-Tab>",
      accept_key = "<Down>",
      reject_key = "<Up>",
    },
  },
}
