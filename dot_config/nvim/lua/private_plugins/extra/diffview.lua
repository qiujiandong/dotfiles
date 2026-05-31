---@type zpack.Spec
return {
  'sindrets/diffview.nvim',
  keys = {
    { '<leader>do', ':DiffviewOpen<CR>', desc = '[D]iff [O]pen', silent = true },
    { '<leader>dc', ':DiffviewClose<CR>', desc = '[D]iff [C]lose', silent = true },
    { '<leader>dh', ':DiffviewFileHistory %<CR>', desc = '[D]iff [H]istory', silent = true },
    { '<leader>dl', ':DiffviewLog<CR>', desc = '[D]iff [L]og', silent = true },
    { '<leader>dr', ':DiffviewRefresh<CR>', desc = '[D]iff [R]efresh', silent = true },
  },
  opts = {
    enhanced_diff_hl = true,
  },
}
