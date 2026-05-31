---@type zpack.Spec
return {
  'akinsho/bufferline.nvim',
  lazy = false,
  config = function()
    require('bufferline').setup {
      options = {
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'Neo-tree',
            highlight = 'Directory',
            text_align = 'left',
          },
        },
      },
    }
    vim.keymap.set('n', '<M-b>', '<cmd>BufferLinePick<CR>')
    vim.keymap.set('n', '<M-B>', '<cmd>BufferLinePickClose<CR>')
    vim.keymap.set('n', '<M-l>', '<cmd>BufferLineCycleNext<CR>')
    vim.keymap.set('n', '<M-h>', '<cmd>BufferLineCyclePrev<CR>')
    vim.keymap.set('n', 'gD', '<cmd>BufferLineCloseOthers<CR>', { silent = true, desc = '[D]elete other [B]uffer' })
  end,
}
