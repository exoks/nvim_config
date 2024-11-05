-- download colorschemes as plugins --
return {
  -- config attr get's executed once the plugin is loaded
  -- activate the colorscheme --
  -- 'morhetz/gruvbox',
  -- "Mofiqul/dracula.nvim",
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function ()
    -- vim.cmd.colorscheme "catppuccin-mocha"
    vim.cmd.colorscheme "catppuccin-mocha"
  end
}

-- [ Note ] --
-- catppuccin does not support the Macos terminal
