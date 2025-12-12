return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'c_sharp',
      'css',
      'diff',
      'graphql',
      'helm',
      'html',
      'javascript',
      'json',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'query',
      'scss',
      'sql',
      'typescript',
      'tsx',
      'vim',
      'vimdoc',
      'vue',
      'xml',
      'yaml',
    },
    auto_install = true,
  },
  config = function(_, opts)
    require('nvim-treesitter').install(opts.ensure_installed)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = '*',
      callback = function(ev)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.uv.fs_stat, vim.fs.normalize(ev.file))
        if ok and stats and stats.size < max_filesize then
          pcall(vim.treesitter.start, ev.buf)
          vim.bo[ev.buf].syntax = 'on' -- Use regex based syntax-highlighting as fallback as some plugins might need it
          vim.wo.foldlevel = 99
          vim.wo.foldmethod = 'expr'
          vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- Use treesitter for folds
          vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Use treesitter for indentation
        end
      end,
    })

    vim.filetype.add { extension = { esproj = 'xml' } }
  end,
}
