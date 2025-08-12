return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', 'AndreM222/copilot-lualine' },
  opts = {
    sections = {
      lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' },
    },
  },
}
