return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'AndreM222/copilot-lualine' },
  config = function()
    local theme = require 'lualine.themes.auto'
    theme.terminal = {
      a = { fg = '#121715', bg = '#4bc997' },
    }

    local job_indicator = { require('easy-dotnet.ui-modules.jobs').lualine }

    require('lualine').setup {
      options = { theme = theme },
      extensions = { 'neo-tree', 'toggleterm', 'nvim-dap-ui' },
      sections = {
        lualine_a = { 'mode', job_indicator },
        lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' },
      },
    }
  end,
}
