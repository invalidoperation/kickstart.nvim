return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    lazy = false,
    opts = {
      open_mapping = [[<c-\>]],
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
      direction = 'horizontal',
      float_opts = {
        border = 'single',
      },
    },
    config = function(_, opts)
      if vim.fn.has 'win32' == 1 then
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
      elseif vim.fn.has 'unix' == 1 then
        vim.opt.shell = '/bin/zsh'
      end

      require('toggleterm').setup(opts)
    end,
  },
}
