return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'AndreM222/copilot-lualine' },
  config = function()
    local theme = require 'lualine.themes.auto'
    theme.terminal = {
      a = { fg = '#121715', bg = '#4bc997' },
    }

    local easy_dotnet = {
      sections = {
        lualine_a = {
          'mode',
          function()
            return require('easy-dotnet.ui-modules.jobs').lualine()
          end,
        },
        lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' },
      },
      filetypes = { 'cs', 'csproj', 'sln', 'slnx' },
    }

    require('lualine').setup {
      options = { theme = theme },
      extensions = { 'neo-tree', 'toggleterm', 'nvim-dap-ui', easy_dotnet },
      sections = {
        lualine_a = { 'mode' },
        lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' },
      },
    }
  end,
}
