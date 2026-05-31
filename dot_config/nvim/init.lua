-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require 'core.settings'
require 'core.keymaps'
require 'core.autocmds'

local gh = require('core.utils').gh
vim.pack.add { gh 'zuqini/zpack.nvim' }

require('zpack').setup {
  { import = 'plugins' },
  { import = 'plugins.extra' },
}
