-- plugin to generate AST used for highlights --
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- treesitter config --
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
    
    -- ensure_installed = {"lua", "python", "javascript"},
    -- auto_install made the process auto instread of ensure installting each time 
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    })
  end
}
