return {
  {
    'akinsho/toggleterm.nvim',
    config = function ()
      require("toggleterm").setup{
        size = 20,  -- Set the size of the terminal
        open_mapping = [[<C-l>]],  -- Key mapping to toggle terminal
        direction = 'float',  -- Set direction to floating
        float_opts = {
        border = 'curved',  -- Options for border (curved, rounded, etc.)
        winblend = 7,  -- Transparency level
        width = 90,
        height = 30,
        },
      }
--      vim.keymap.set('n', '<C-l>', ':lua open_floating_term()', {})
    end
  },
}
