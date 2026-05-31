---@type zpack.Spec
return {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()

    local ft = require 'Comment.ft'
    ft.set('c', { '// %s', '/* %s */' })
    ft.set('cpp', { '// %s', '/* %s */' })
  end,
}
