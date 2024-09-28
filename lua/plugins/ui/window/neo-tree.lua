return {
  -- neo-tree.nvim provides the directory at the left-side of the window.
  -- It can be opened using <leader>e and closed with the same.
  -- Files can be opened by using <Enter>.  Create a file using 'a'.
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        width = 30,
      },
    },
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute { toggle = true, dir = vim.uv.cwd() }
        end,
        desc = "Explore NeoTree (cwd)",
      },
      {
        "<leader>e",
        "<leader>fe",
        desc = "Explore NeoTree (cwd)",
        remap = true,
      },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute { source = "git_status", toggle = true }
        end,
        desc = "Git Explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute { source = "buffers", toggle = true }
        end,
        desc = "Buffer Explorer",
      },
    },
  },
}
