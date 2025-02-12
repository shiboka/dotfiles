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
  { 'AlexvZyl/nordic.nvim' },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,
    config = function()
      require('kanagawa').setup({
        transparent = true,
        background = {
          dark = 'dragon', -- wave, dragon
          light = 'lotus', -- lotus
        },
        overrides = function(colors)
          return {
            Normal = { bg = 'none' },
            NormalFloat = { bg = 'none' },
            FloatTitle = { bg = 'none' },
            FloatBorder = { bg = 'none' },
            LineNr = { bg = 'none' },
            ColorColumn = { bg = 'none' },
            SignColumn = { bg = 'none' },
            Folded = { bg = 'none' },
            FoldColumn = { bg = 'none' },
            CursorLine = { bg = 'none' },
            CursorColumn = { bg = 'none' },
            VertSplit = { bg = 'none' },
            TabLineSel = { bg = 'none' },
            DiagnosticSignWarn = { bg = 'none' },
            DiagnosticSignInfo = { bg = 'none' },
            DiagnosticSignHint = { bg = 'none' },
            DiagnosticSignError = { bg = 'none' },
            SnacksPickerInputTitle = { bg = 'none' },
            SnacksPickerInputBorder = { bg = 'none' },
          }
        end,
      })
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
      require('tokyonight').setup({
        style = 'night', -- storm, moon, night
        light_style = 'day', -- day
        transparent = true,
        plugins = {
          auto = true,
        },
        on_highlights = function(hl, c)
          hl.Normal = { bg = 'none' }
          hl.NormalFloat = { bg = 'none' }
          hl.FloatTitle = { bg = 'none' }
          hl.FloatBorder = { bg = 'none' }
          hl.SnacksPickerInputTitle = { bg = 'none' }
          hl.SnacksPickerInputBorder = { bg = 'none' }
        end,
      })
    end,
  },
  {
    'rose-pine/neovim',
    lazy = false,
    config = function()
      require('rose-pine').setup({
        variant = 'auto', -- auto, main, moon, dawn
        dark_variant = 'main', -- main, moon, dawn
        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
      })
    end,
  },
  {
    'catppuccin/nvim',
    lazy = false,
    config = function()
      require('catppuccin').setup({
        flavour = 'auto', -- auto, latte, frappe, macchiato, mocha
        background = {
          dark = 'mocha',
          light = 'latte',
        },
        transparent_background = true,
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
      quickfile = { enabled = true },
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
