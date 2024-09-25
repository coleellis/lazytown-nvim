return {
  -- mason.nvim drives installation and management of Language Server
  -- Protocol (LSP) servers. LSP Servers are responsible for providing
  -- errors, warning, and other feedback while coding.  In Neovim, we
  -- are responsible for installing and managing these directly.
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
      },
    },
  },
  -- mason-lspconfig.nvim is the bridge between mason.nvim and
  -- nvim-lspconfig, which ensures they work together to provide LSP
  -- support for installed language servers.
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "clangd",
        "lua_ls",
        "rust_analyzer",
      },
    },
  },
  -- nvim-lspconfig is the driver behind LSP servers and makes communication
  -- between the code and language server.  As you change code, changes are
  -- communicated to/from the language server to provide feedback as you type
  -- and are displayed inside normal mode.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = function()
      local ret = {
        diagnostics = {
          underline = true,
          update_in_insert = false,
          virtual_text = {
            spacing = 4,
            source = "if_many",
            prefix = "●",
          },
          severity_sort = true,
          inlay_hints = {
            enabled = true,
            exclude = {},
          },
          codelens = {
            enabled = true,
          },
          document_highlight = {
            enabled = true,
          },
        },
      }
      return ret
    end,
    config = function()
      local lspconfig = require "lspconfig"
      lspconfig.clangd.setup {}
      lspconfig.lua_ls.setup {}
      lspconfig.rust_analyzer.setup {}
    end,
    keys = {
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
      { "gd", vim.lsp.buf.definition, desc = "Goto Definition", has = "definition" },
      { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
      { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
      { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
      { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help", has = "signatureHelp" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" }, has = "codeAction" },
      { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" }, has = "codeLens" },
      { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" }, has = "codeLens" },
      { "<leader>cr", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
    },
  },
}
