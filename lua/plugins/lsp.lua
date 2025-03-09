--  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              --
--  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀                 𓐓  lsp.lua 𓐔           --
--  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              --
--  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀   Student: oezzaou <oezzaou@student.1337.ma> --
--  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              --
--  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              --
--  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2024/11/06 14:38:35 by oezzaou--
--  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2025/02/03 08:26:44 by oezzaou--
--  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              --
--  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              --
--  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      --
--  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  --
--  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              --

return {
  {
    "williamboman/mason.nvim",
    -- NOTE: IT GIVES an UI for lsps/ we can use mason dashboard to add lsps --
    config = function()
      local mason = require("mason")
      mason.setup({
        debug = true,
        ui = {
          border = "rounded",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Ensure these language servers are exist --
        ensure_installed = {
          "clangd",
          "pylsp",
          "lua_ls",
          "eslint",
          "ltex",
          "html",
        },
      })
    end,
  },
  {
    -- Set up the communication between Neovim and these lisps --
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.pylsp.setup({
        capabilities = capabilities,
        settings = {
          pylsp = {
            -- this part can config anything about pylsp(plugins)
            plugins = {
              -- adding pylsp_django plugin for pylsp/plugin in python for django --
              djlint = { enabled = true },
              pylsp_django = { enabled = true },
              jedi_completion = { fuzzy = true },
              jedi_definition = { follow_builtin_imports = true },
              -- [[ this part is managed by none-ls plugin, use it with linters & formatter ]]---
              -- I can also manage linter & formater from here, but it's good too
              -- manage them via Mason
              -- pylint = { enabled = true },
              flake8 = { enabled = true },
            },
          },
        },
      })
      lspconfig.html.setup({
        capabilities = capabilities,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
      })
      lspconfig.ltex.setup({
        capabilities = capabilities,
      })
     -- We have a set of function to communicate with 'lsps', h: vim.lsp.buff -> displays all functions --
      vim.keymap.set("n", "D", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}

-- [[ lsp: language server protocol ]]--
-- it allows communication between text editors and language server runing on my machine
-- , that gives language intelligence features
-- 1 - install language server on owr system
-- 2 - config neo vim to talk to this language we have just installed
-- mason-lspconfig bridges mason.nvim with the lspconfig plugin - making it easier to use both plugins together.
-- after setting up mason (ui interface) and mason-lspconfig to ensure some lsps are exist, we need to communicate
-- between lsps and neovim "neovim/nvim-lspconfig",

--[[ everything to know about lsp >
Language Server Protocol (LSP) support in Neovim enables it to act as a full-featured development environment by providing IDE-like features such as autocompletion, go-to-definition, find references, linting, and code formatting. Here’s an overview of how LSP works with Neovim:
1. What is LSP?

The Language Server Protocol (LSP) is a standardized protocol created by Microsoft to allow code editors to communicate with language servers. Language servers provide programming language features such as autocompletion, hover information, and diagnostics.
2. How Neovim Integrates with LSP

Neovim has built-in LSP support since version 0.5, meaning you don’t need to install a separate plugin for LSP functionality itself. However, you may want to install additional plugins for a better LSP experience (e.g., for UI improvements).

Here’s a general workflow of how LSP works in Neovim:

    Step 1: You open a file in Neovim.
    Step 2: Neovim communicates with a language server for the file’s programming language (e.g., pyright for Python, tsserver for TypeScript).
    Step 3: The language server provides information such as errors, autocomplete suggestions, and function definitions.
    Step 4: Neovim displays this information as code diagnostics, popups, or autocomplete suggestions.]]
--

-- [[ Note : ]] --
-- lsps hava built-ing linters & formatters but we can still use external ones throw mason
