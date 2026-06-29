return {
  'iamcco/markdown-preview.nvim',
  event = 'VeryLazy',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  ft = { 'markdown' },
  init = function()
    vim.cmd [[
    function! OpenBrowserWSL(url)
      execute 'silent !wslview ' . shellescape(a:url)
    endfunction
    ]]
    vim.g.mkdp_browserfunc = 'OpenBrowserWSL'
  end,
  -- build = function() vim.fn['mkdp#util#install']() end,
}
