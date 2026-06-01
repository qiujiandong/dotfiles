---@type zpack.Spec
return {
  'Exafunction/windsurf.vim',
  event = 'BufEnter',
  init = function() vim.g.codeium_no_map_tab = true end,
  keys = {
    { '<C-g>', function() return vim.fn['codeium#Accept']() end, mode = { 'i' }, desc = 'Accept', expr = true },
    { '<C-x>', function() return vim.fn['codeium#Clear']() end, mode = { 'i' }, desc = 'Clear', expr = true },
  },
}
