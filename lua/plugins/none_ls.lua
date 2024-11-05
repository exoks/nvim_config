--[[ great pluging for linting & formatting ]]
return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      -- [[ Put the var into a local var ]]--
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- [[ adding the list of linter & formatter, use Mason to install them ]]--
          --[ lua ]--
          null_ls.builtins.formatting.stylua,

          -- [[ python ]]--
          null_ls.builtins.diagnostics.pylint, -- or use pylint it's also a linter
          null_ls.builtins.formatting.black,

          --[[ html/css ]]
          -- dak l mouchkil l austori: sbabo l error li taywqa3 fi loading dyal cpplint ^
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.markuplint,
          -- these linter doesnot work for me
          -- null_ls.builtins.diagnostics.htmlhint,
          -- null_ls.builtins.diagnostics.stylelint,

          -- [[ C/C++ ]]--
          -- for c/c++ i'm using the built-in linter & formater of clangd  
          -- null_ls.builtins.formatting.clang_format,
          -- null_ls.builtins.diagnostics.cpplint,
          --
          -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
        },
      })
      vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
    end,
  },
}

--[[ Questions ]]
-- the lsp has it's builting formater & linter but none-ls allows use to use external ones
--what is the diff between linter & formater ?
--linter : is tool that detect the errors in logic of code & suggest code fixes (katchod l machakil li endk fi l code o katqadhom)
--formatter: is a tool to check & reformat the code without changing the runtime behavior of the code (khedmatha sysntax language kat9ado)
