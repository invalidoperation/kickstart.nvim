return {
  'ahmedkhalf/project.nvim',
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function(_, opts)
    require('project_nvim').setup(opts)
    require('telescope').load_extension 'projects'
  end,
  keys = {
    {
      '<leader>sp',
      function()
        require('telescope').extensions.projects.projects {}
      end,
      desc = '[S]earch Recent [P]rojects',
    },
  },
}
