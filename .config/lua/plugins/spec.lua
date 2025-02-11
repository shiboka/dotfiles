return {
  {
    'Shatur/neovim-ayu',
    lazy = false,
    config = function()
      require('ayu').setup({
        mirage = false,
        terminal = true,
        overrides = {
          Normal = { bg = 'none' },
          NormalFloat = { bg = 'none' },
          ColorColumn = { bg = 'none' },
          SignColumn = { bg = 'none' },
          Folded = { bg = 'none' },
          FoldColumn = { bg = 'none' },
          CursorLine = { bg = 'none' },
          CursorColumn = { bg = 'none' },
          VertSplit = { bg = 'none' },
          LineNr = { fg = '#3c414a' }
        },
      })
    end,
  },
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'jose-elias-alvarez/null-ls.nvim' },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      animate = { enabled = false },
      bigfile = { enabled = false },
      bufdelete = { enabled = false },
      dashboard = { enabled = false },
      debug = { enabled = false },
      dim = { enabled = false },
      explorer = {
        enabled = true,
        replace_netrw = true
      },
      git = { enabled = false },
      gitbrowse = { enabled = false },
      image = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      layout = { enabled = false },
      lazygit = { enabled = false },
      notifier = { enabled = false },
      notify = { enabled = false },
      picker = { enabled = true },
      profiler = { enabled = false },
      quickfile = { enabled = false },
      rename = { enabled = false },
      scope = { enabled = false },
      scratch = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      terminal = { enabled = false },
      toggle = { enabled = false },
      util = { enabled = false },
      win = { enabled = false },
      words = { enabled = false },
      zen = { enabled = false },
    },
  },
}
