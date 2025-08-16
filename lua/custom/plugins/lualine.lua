return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'AndreM222/copilot-lualine' },
  config = function()
    local theme = require 'lualine.themes.auto'
    theme.terminal = {
      a = { fg = '#121715', bg = '#4bc997' },
    }

    require('lualine').setup {
      options = { theme = theme },
      extensions = { 'neo-tree', 'toggleterm', 'nvim-dap-ui' },
      sections = {
        lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' },
      },
    }
  end,
}
