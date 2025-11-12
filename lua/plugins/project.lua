return {
  'DrKJeff16/project.nvim',
  config = function()
    require('project').setup {
      show_hidden = true,
      ignore_lsp = {
        'easy_dotnet', -- causes issues due to root directory containing trailing '/' (at least on windows)
      },
    }
  end,
}
