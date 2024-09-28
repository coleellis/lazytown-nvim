return {
  -- outline.nvim provides an outline of symbols and functions
  -- for a program.  This is mainly used inside edgy.nvim to show
  -- the outline while coding.
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>o", "<cmd>Outline<cr>", desc = "Outline Toggle" },
    },
    config = function()
      require("outline").setup {}
    end,
  },
}
