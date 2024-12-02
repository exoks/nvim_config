return {
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup({
        check_ts = true,              -- Use Treesitter for context-aware scrolling
        -- hide_cursor = true,           -- Hides the cursor during scrolling to achieve the desired effect
        stop_eof = true,              -- Stops scrolling at the end of the file
        cursor_scrolls_alone = false, -- Prevents the cursor from moving independently
        easing_function = "sine",     -- Smooth sine-wave animation for constant movement
      })
      -- Enable cursor line highlight
      vim.opt.cursorline = true
    end,
  },
  {
    -- autpairs
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        -- enable treesitter if installed
        check_ts = true,
      })
    end,
  },
  {
    -- surround phrases
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- High-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
}
