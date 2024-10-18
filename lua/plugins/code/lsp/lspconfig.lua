return {
  {
    "p00f/clangd_extensions.nvim",
    lazy = true,
    config = function() end,
    opts = {
      inlay_hints = {
        inline = false,
      },
      ast = {
        --These require codicons (https://github.com/microsoft/vscode-codicons)
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },
        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  },
  -- mason.nvim drives installation and management of Language Server
  -- Protocol (LSP) servers. LSP Servers are responsible for providing
  -- errors, warning, and other feedback while coding.  In Neovim, we
  -- are responsible for installing and managing these directly.
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup {
        ensure_installed = { "codelldb" },
      }
    end,
  },
  -- mason-lspconfig.nvim is the bridge between mason.nvim and
  -- nvim-lspconfig, which ensures they work together to provide LSP
  -- support for installed language servers.
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      auto_install = true,
      PATH = "skip",
      ui = {
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
      max_concurrent_installers = 10,
    },
  },
  -- nvim-lspconfig is the driver behind LSP servers and makes communication
  -- between the code and language server.  As you change code, changes are
  -- communicated to/from the language server to provide feedback as you type
  -- and are displayed inside normal mode.
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "p00f/clangd_extensions.nvim",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require "lspconfig"
      -- setup lsp servers of choice here
      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      }
      lspconfig.pylsp.setup { capabilities = capabilities }
      lspconfig.eslint.setup { capabilities = capabilities }
      lspconfig.ts_ls.setup { capabilities = capabilities }
      lspconfig.cmake.setup { capabilities = capabilities }
      lspconfig.asm_lsp.setup {
        capabilities = capabilities,
        filetypes = { "asm", "nasm" },
        cmd = { "asm-lsp" },
      }
      lspconfig.clangd.setup {
        capabilities = capabilities,
        filetypes = { "h", "c", "cpp", "objc", "objcpp" },
        cmd = {
          "clangd",
          "--compile-commands-dir=cmake-build-debug",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
          "--log=verbose",
        },
        root_dir = function()
          if vim.g.root then
            return vim.g.root
          end
          return lspconfig.util.root_pattern("CMakeLists.txt", ".git")
        end,
        init_options = {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
          semanticHighlighting = true,
        },
        flags = { debounce_text_changes = 150 },
        on_attach = function()
          require("clangd_extensions.inlay_hints").setup_autocmd()
          require("clangd_extensions.inlay_hints").set_inlay_hints()
        end,
      }
    end,
    keys = {
      { "<leader>cl", "<cmd>LspInfo<cr>", desc = "Lsp Info" },
      { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
      { "gr", vim.lsp.buf.references, desc = "References", nowait = true },
      { "gI", vim.lsp.buf.implementation, desc = "Goto Implementation" },
      { "gy", vim.lsp.buf.type_definition, desc = "Goto T[y]pe Definition" },
      { "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
      { "K", vim.lsp.buf.hover, desc = "Hover" },
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
      { "<c-k>", vim.lsp.buf.signature_help, mode = "i", desc = "Signature Help" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", mode = { "n", "v" } },
      { "<leader>cc", vim.lsp.codelens.run, desc = "Run Codelens", mode = { "n", "v" } },
      { "<leader>cC", vim.lsp.codelens.refresh, desc = "Refresh & Display Codelens", mode = { "n" } },
      { "<leader>cr", vim.lsp.buf.rename, desc = "Rename" },
    },
  },
}
