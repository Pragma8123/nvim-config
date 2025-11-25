return {
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false, -- Uncomment this if navigation still fails on startup
    config = function()
      require("nvim-tmux-navigation").setup({
        disable_when_zoomed = true,
      })
    end,
    keys = {
      {
        "<C-h>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
        end,
        desc = "Tmux Left",
      },
      {
        "<C-j>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateDown()
        end,
        desc = "Tmux Down",
      },
      {
        "<C-k>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateUp()
        end,
        desc = "Tmux Up",
      },
      {
        "<C-l>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateRight()
        end,
        desc = "Tmux Right",
      },
      {
        "<C-\\>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateLastActive()
        end,
        desc = "Tmux Last Active",
      },
    },
  },
}
