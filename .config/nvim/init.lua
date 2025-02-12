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
    vim.opt_local.shiftwidth = 4
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c',
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

require('config.lazy')
require('config.lsp')
require('config.cmp')

vim.cmd.colorscheme 'tokyonight'

--vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'FloatTitle', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'SnacksPickerInputTitle', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'SnacksPickerInputBorder', { bg = 'none' })

vim.api.nvim_create_user_command('SearchBG', function()
  for name, hl in pairs(vim.api.nvim_get_hl(0, {})) do
    if hl.bg and string.format("#%06x", hl.bg) == "#282727" then
      print(name)
    end
  end
end, {})

vim.api.nvim_create_user_command('ListColors', function()
--  for _, path in ipairs(vim.api.nvim_get_runtime_file('colors/*.vim', true)) do
--    print(vim.fn.fnamemodify(path, ':t:r'))
--  end
  local my_colors = { 'ayu', 'kanagawa', 'tokyonight', 'rose-pine', 'catppuccin', 'nordic' }
  for _, c in pairs(my_colors) do
    print(c)
  end
end, {})

