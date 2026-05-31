local hop2word = function() require('hop').hint_words {} end ---@diagnostic disable-line: missing-fields
local hop2line = function() require('hop').hint_lines {} end ---@diagnostic disable-line: missing-fields
local hop2char1 = function() require('hop').hint_char1 {} end ---@diagnostic disable-line: missing-fields
local hop2char2 = function() require('hop').hint_char2 {} end ---@diagnostic disable-line: missing-fields
local hopdown = function() require('hop').hint_vertical { direction = require('hop.hint').HintDirection.AFTER_CURSOR } end
local hopup = function() require('hop').hint_vertical { direction = require('hop.hint').HintDirection.BEFORE_CURSOR } end

---@type zpack.Spec
return {
  'smoka7/hop.nvim',
  branch = 'master', -- optional but strongly recommended
  opts = {
    keys = 'etovxqpdygfblzhckisuran',
    case_insensitive = true,
    quit_key = '<ESC>',
  },
  keys = {
    { '<M-w>', hop2word, desc = 'Hop to word', silent = true },
    { '<M-f>', hop2line, desc = 'Hop to line', silent = true },
    { '<M-s>', hop2char1, desc = 'Hop to single char', silent = true },
    { '<M-d>', hop2char2, desc = 'Hop to double char', silent = true },
    { '<M-j>', hopdown, desc = 'Hop down', silent = true },
    { '<M-k>', hopup, desc = 'Hop up', silent = true },
  },
}
