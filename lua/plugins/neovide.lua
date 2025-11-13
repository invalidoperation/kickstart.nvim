if vim.g.neovide then
  vim.o.guifont = 'JetBrainsMono Nerd Font:h10'
  vim.g.neovide_scale_factor = 1.0

  vim.g.neovide_title_background_color = string.format('%x', vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name 'Normal' }).bg)

  vim.g.neovide_opacity = 0.99
  vim.g.neovide_normal_opacity = 0.99
end

return {}
