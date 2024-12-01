return {
  'akinsho/bufferline.nvim',
  requires = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      options = {
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = false,
      },
    }
  end,
}
