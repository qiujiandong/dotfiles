-- Auto reload file when the file is modified outside
vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'FocusGained' }, {
  pattern = '*',
  command = "if mode() != 'c' | checktime | endif",
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Auto restore fcitx5 state when exit Insert-mode
if vim.fn.executable 'fcitx5-remote' == 1 then
  vim.g.fcitx5_last_state = 0
  vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function()
      if vim.g.fcitx5_last_state == 2 then os.execute 'fcitx5-remote -o' end
    end,
  })
  vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
      vim.g.fcitx5_last_state = tonumber(vim.fn.system 'fcitx5-remote')
      os.execute 'fcitx5-remote -c'
    end,
  })
end

--  In this section we set up some autocommands to run build
--  steps for certain plugins after they are installed or updated.

local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then output = 'No output from build command.' end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

-- This autocommand runs after a plugin is installed or updated and
--  runs the appropriate build command for that plugin if necessary.
--
-- See `:help vim.pack-events`
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    if name == 'LuaSnip' then
      if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then
        run_build(name, { 'make', 'install_jsregexp' }, ev.data.path)
      end
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
      return
    end
  end,
})
