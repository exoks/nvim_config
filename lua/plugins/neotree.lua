-- NeoTree: something better than NerdTree --
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
     "nvim-tree/nvim-web-devicons",
     "MunifTanjim/nui.nvim",
  },
 
  -- Neotree config --
  config = function()
    vim.keymap.set('n', '<leader>t', ':Neotree filesystem reveal left<CR>', { noremap = true, silent = true })
    require('neo-tree').setup({
      window = {
        width = 30,  -- Adjust this value for the width of the tree
        -- height = 20, -- Adjust this value for the height of the tree
      }
    })
  end
}
