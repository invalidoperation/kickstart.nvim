return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    lazy = false,
    opts = {
      open_mapping = [[<leader>tt]],
      direction = 'float',
      float_opts = {
        border = 'single',
      },
    },
    config = function(_, opts)
      if vim.fn.has 'win32' then
        local powershell_options = {
          shell = vim.fn.executable 'pwsh' == 1 and 'pwsh' or 'powershell',
          shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;',
          shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait',
          shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode',
          shellquote = '',
          shellxquote = '',
        }

        for option, value in pairs(powershell_options) do
          vim.opt[option] = value
        end
      end

      require('toggleterm').setup(opts)

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new {
        cmd = 'lazygit',
        dir = 'git_dir',
        direction = 'float',
        float_opts = {
          border = 'double',
        },
        -- function to run on opening the terminal
        on_open = function(term)
          vim.cmd 'startinsert!'
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
        end,
        -- function to run on closing the terminal
        on_close = function(term)
          vim.cmd 'startinsert!'
        end,
      }

      function _lazygit_toggle()
        lazygit:toggle()
      end
    end,
    keys = {
      {
        '<leader>tg',
        '<cmd>lua _lazygit_toggle()<CR>',
        desc = 'Toggle LazyGit',
        noremap = true,
        silent = true,
      },
    },
  },
}
