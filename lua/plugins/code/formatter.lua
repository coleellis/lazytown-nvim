return {
  -- conform.nvim drives formatting code using various formatting platforms.
  -- These are viewed using :ConformInfo but also work inside :Mason.
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim" },
    lazy = true,
    cmd = "ConformInfo",
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format { formatters = { "injected" }, timeout_ms = 3000 }
        end,
        mode = { "n", "v" },
        desc = "Format Injected Langs",
      },
    },
    opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        javascript = { "prettier" },
        lua = { "stylua" },
        python = { "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        sh = { "shfmt" },
      },
    },
  },
}
