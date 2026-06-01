---@type zpack.Spec[]
local plugins = {}

table.insert(plugins, {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree toggle<CR>', desc = '[T]oggle Neotree', silent = true },
  },
  opts = {
    event_handlers = {
      {
        event = 'file_opened',
        handler = function() require('neo-tree.command').execute { action = 'close' } end,
      },
    },
    filesystem = {
      use_libuv_file_watcher = true,
      filtered_items = {
        visiable = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      width = 30,
      position = 'left',
    },
  },
})

return plugins
