-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'core.settings'
require 'core.keymaps'
require 'core.autocmds'

vim.pack.add { 'https://github.com/zuqini/zpack.nvim' }

require('zpack').setup {
  { import = 'plugins' },
  { import = 'plugins.extra' },
}
