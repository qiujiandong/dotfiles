-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<leader>nh', '<cmd>nohlsearch<CR>', { desc = '[N]o [H]ighlight' })

-- Save buffer
vim.keymap.set('n', '<leader>x', '<cmd>w<CR>', { desc = 'Save buffer' })

-- Quit all
vim.keymap.set('n', '<leader>Q', function()
  vim.ui.input({ prompt = 'Quit all? [y/n](y): ' }, function(input)
    if input == nil or input == '' or input:lower() == 'y' then vim.cmd 'qa' end
  end)
end, { desc = '[Q]uit All with Confirm' })

-- Disable <C-u> in [I]nsert mode
vim.keymap.set('i', '<C-u>', '<Nop>', { noremap = true, silent = true })

-- Change tab
vim.keymap.set('n', '<leader>ts', ':tab split<CR>', { silent = true, desc = '[T]ab [S]plit' })
vim.keymap.set('n', '<M-p>', ':tabprevious<CR>', { desc = '[P]revious tab' })
vim.keymap.set('n', '<M-n>', ':tabnext<CR>', { desc = '[N]ext tab' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
