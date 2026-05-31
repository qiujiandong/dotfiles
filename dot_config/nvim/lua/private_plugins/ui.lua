---@type zpack.Spec[]
local plugins = {}

table.insert(plugins, {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    signs = {
      add = { text = '+' }, ---@diagnostic disable-line: missing-fields
      change = { text = '~' }, ---@diagnostic disable-line: missing-fields
      delete = { text = '_' }, ---@diagnostic disable-line: missing-fields
      topdelete = { text = '‾' }, ---@diagnostic disable-line: missing-fields
      changedelete = { text = '~' }, ---@diagnostic disable-line: missing-fields
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git [c]hange' })

      -- Actions
      -- visual mode
      map(
        'v',
        '<leader>hs',
        function() gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' } end,
        { desc = 'git [s]tage hunk' }
      )
      map(
        'v',
        '<leader>hr',
        function() gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' } end,
        { desc = 'git [r]eset hunk' }
      )
      -- normal mode
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
      map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'git preview hunk [i]nline' })
      map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end, { desc = 'git [b]lame line' })
      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
      map('n', '<leader>hD', function() gitsigns.diffthis '@' end, { desc = 'git [D]iff against last commit' })
      map(
        'n',
        '<leader>hQ',
        function() gitsigns.setqflist 'all' end,
        { desc = 'git hunk [Q]uickfix list (all files in repo)' }
      )
      map('n', '<leader>hq', gitsigns.setqflist, { desc = 'git hunk [q]uickfix list (all changes in this file)' })
      -- Toggles
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
      map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = '[T]oggle git intra-line [w]ord diff' })

      -- Text object
      map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
    end,
  },
})

table.insert(plugins, { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter',
  ---@module 'which-key'
  ---@type wk.Opts
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    -- delay between pressing a key and opening which-key (milliseconds)
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },

    -- Document existing key chains
    spec = {
      { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
      { '<leader>t', group = '[T]oggle' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } }, -- Enable gitsigns recommended keymaps first
      { 'gr', group = 'LSP Actions', mode = { 'n' } },
      { '<leader>m', group = '[M]ini.nvim', mode = { 'n' } },
      { '<leader>d', group = '[D]iffview', mode = { 'n' } },
      { 'gs', group = '[S]urrounding', mode = { 'n', 'x' } },
      { '<leader>g', group = '[G]it', mode = { 'n' } },
      { 'gb', group = '[B]lock comment', mode = { 'n' } },
    },
  },
})

table.insert(plugins, {
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  lazy = false,
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require('tokyonight').setup {
      styles = {
        comments = { italic = false }, -- Disable italics in comments
      },
    }
    vim.cmd.colorscheme 'tokyonight-night'
  end,
})

table.insert(plugins, {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  ---@module 'todo-comments'
  ---@type TodoOptions
  ---@diagnostic disable-next-line: missing-fields
  opts = { signs = false },
})

return plugins
