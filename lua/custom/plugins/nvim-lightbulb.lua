vim.api.nvim_set_hl(0, 'LightBulbVirtualText', {
  fg = 'LightYellow',
})

return {
  'kosayoda/nvim-lightbulb',
  opts = {
    autocmd = {
      enabled = true,
    },
    code_lenses = true,
    action_kinds = { 'quickfix', 'refactor.rewrite' },
    virtual_text = {
      enabled = true,
      text = vim.g.have_nerd_font and '󰌵' or '💡',
      lens_text = vim.g.have_nerd_font and '󰍉' or '🔎',
    },
    sign = { enabled = false },
  },
}
