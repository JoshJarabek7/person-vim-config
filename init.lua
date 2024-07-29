-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.g.python3_host_prog = vim.fn.expand("~/.neovim_venv/bin/python3")
vim.g.node_host_prog = vim.fn.expand("~/.nvm/versions/node/v22.5.1/bin/neovim-node-host")
vim.g.perl_host_prog = vim.fn.expand("/opt/homebrew/bin/perl")
vim.g.lua_host_prog = vim.fn.expand("/Users/topaz/.luaver/lua/5.1.5/bin/lua")
vim.g.ruby_host_prog = vim.fn.expand("~/.rbenv/shims/ruby")

vim.opt.clipboard = "unnamedplus"

-- Set default color scheme
vim.cmd.colorscheme("cyberdream")
require("lspconfig").ruff.setup({
  init_options = {
    settings = {
      configurationPreference = "filesystemFirst",
      lineLength = 120,
      fixAll = true,
      organizeImports = true,
      showSyntaxErrors = true,
      logLevel = "info",
      logFile = "~/.ruff.log",
      codeAction = {
        disableRuleComment = {
          enable = true,
        },
        fixViolation = {
          enable = true,
        },
        lint = {
          enable = true,
        },
      },
    },
  },
})

require("lspconfig").pyright.setup({
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = "*",
      },
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == "ruff" then
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = "LSP: Disable hover capability from Ruff",
})
