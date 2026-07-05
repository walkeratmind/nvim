vim.g.mapleader = " "

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

vim.loader.enable()

local lazy_config = require "config.lazy"

require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" },
}, lazy_config)

require "config.autocmds"
require "config.commands"
require "config.diagnostic"
require "config.options"

vim.schedule(function()
  require "config.keymaps"
end)