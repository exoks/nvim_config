return {
  'folke/noice.nvim',
  dependecies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require("noice").setup({
      lsp = {
        progress = {
          enabled = true,
        },
      signature = {
         enabled = true,
          auto_open = { enabled = true },
        },
      },
      messages = {
        enabled = true,
      },
  -- Add other configurations as needed
    })
  end
}
