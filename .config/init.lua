vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.number = true
vim.o.background = 'dark'

vim.o.termguicolors = true

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'python',
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.tabstop = 4
  end,
})

require('config.lazy')
require('config.lsp')
require('config.cmp')
require('ayu').colorscheme()
