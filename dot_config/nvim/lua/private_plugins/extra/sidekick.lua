---@type zpack.Spec
return {
  'folke/sidekick.nvim',
  branch = 'main',
  opts = {
    nes = {
      enabled = false,
    },
    cli = {
      mux = {
        backend = 'tmux',
        enabled = true,
      },
    },
  },
  keys = {
    {
      '<c-g>',
      function() require('sidekick').nes_jump_or_apply() end,
      desc = 'Goto/Apply Next Edit Suggestion',
      mode = { 'n' },
    },
    {
      '<leader>aa',
      function() require('sidekick.cli').toggle() end,
      desc = 'Sidekick Toggle CLI',
    },
    {
      '<leader>ad',
      function() require('sidekick.cli').close() end,
      desc = 'Detach a CLI Session',
    },
    {
      '<leader>at',
      function() require('sidekick.cli').send { msg = '{this}' } end,
      mode = { 'x', 'n' },
      desc = 'Send This',
    },
    {
      '<leader>af',
      function() require('sidekick.cli').send { msg = '{file}' } end,
      desc = 'Send File',
    },
    {
      '<leader>ap',
      function() require('sidekick.cli').prompt() end,
      mode = { 'n', 'x' },
      desc = 'Sidekick Select Prompt',
    },
    {
      '<leader>ae',
      function() require('sidekick.nes').enable() end,
      desc = 'Enable NES',
    },
    {
      '<leader>aE',
      function() require('sidekick.nes').disable() end,
      desc = 'Disable NES',
    },
    {
      '<leader>an',
      function() require('sidekick.nes').clear() end,
      desc = 'Clear NES',
    },
    {
      '<leader>au',
      function() require('sidekick.nes').update() end,
      desc = 'Update NES',
    },
  },
}
