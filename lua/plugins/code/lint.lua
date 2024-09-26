return {
  -- nvim-lint supports using linters inside Neovim
  -- and showing locations that require linting changes.
  {
    "mfussenegger/nvim-lint",
    events = { "BufWritePost", "BufReadPost", "InsertLeave" },
    linters_by_ft = {
      python = { "flake8", "pylint" },
    },
    linters = {},
  },
}
