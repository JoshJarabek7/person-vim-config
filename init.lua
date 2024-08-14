-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- Detect the operating system
local is_mac = vim.fn.has("macunix") == 1
local is_linux = vim.fn.has("unix") == 1 and not is_mac

if is_mac then
  vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/python3_env/bin/python3")
  vim.g.node_host_prog = vim.fn.expand("~/.nvm/versions/node/v22.5.1/bin/neovim-node-host")
  vim.g.perl_host_prog = vim.fn.expand("/opt/homebrew/bin/perl")
  vim.g.lua_host_prog = vim.fn.expand("/Users/topaz/.luaver/lua/5.1.5/bin/lua")
  vim.g.ruby_host_prog = vim.fn.expand("~/.rbenv/shims/ruby")
elseif is_linux then
  vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/python3_env/bin/python3")
  vim.g.node_host_prog = vim.fn.expand("~/.nvm/versions/node/v22.5.1/bin/neovim-node-host")
  vim.g.perl_host_prog = vim.fn.expand("/usr/bin/perl") -- Adjust path for Linux
  vim.g.lua_host_prog = vim.fn.expand("/usr/bin/lua") -- Adjust path for Linux
  vim.g.ruby_host_prog = vim.fn.expand("~/.rbenv/shims/ruby")
end

vim.opt.clipboard = "unnamedplus"
