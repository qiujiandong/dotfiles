---@type zpack.Spec
return {
  'matze/vim-move',
  init = function()
    -- disable automatic key maps
    vim.g.move_map_keys = 0
  end,
  keys = {
    { '<S-j>', '<Plug>MoveBlockDown', mode = { 'v' }, silent = true },
    { '<S-k>', '<Plug>MoveBlockUp', mode = { 'v' }, silent = true },
  },
  opts = {},
}
