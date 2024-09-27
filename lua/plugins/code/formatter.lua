return {
  -- conform.nvim drives formatting code using various formatting platforms.
  -- These are viewed using :ConformInfo but also work inside :Mason.
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
      },
    },
  },
  -- none.ls is a reload of null-ls using Neovim as a language server to
  -- inject code actions, diagnostics, and formatting.
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require "null-ls"
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
        },
      }
    end,
    keys = {
      { "<leader>gf", vim.lsp.buf.format, {} },
    },
  },
}
