return {
  'folke/snacks.nvim',
  ---@type snacks.Config
  opts = {
    lazygit = {},
  },
  keys = {
    {
      '<leader>gg',
      function()
        Snacks.lazygit()
      end,
      desc = 'Lazygit',
    },
    {
      '<leader>gl',
      function()
        Snacks.lazygit.log_file()
      end,
      desc = 'Lazygit current file [l]og',
    },
  },
}
