return {
  -- Plugin to find files ---
  {
  'nvim-telescope/telescope.nvim', tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim'
    },
    config = function()
      -- Telescope config --
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>f', builtin.find_files, {})
    end
  },
  {
    -- To add a simple 'UI' for our code_actions --
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      -- This is your opts table
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
}
