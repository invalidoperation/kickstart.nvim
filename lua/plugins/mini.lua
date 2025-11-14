return { -- Collection of various small independent plugins/modules
  'echasnovski/mini.nvim',
  config = function()
    -- Better Around/Inside textobjects
    --
    -- Examples:
    --  - va)  - [V]isually select [A]round [)]paren
    --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
    --  - ci'  - [C]hange [I]nside [']quote
    require('mini.ai').setup { n_lines = 500 }

    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - gsaiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - gsd'   - [S]urround [D]elete [']quotes
    -- - gsr)'  - [S]urround [R]eplace [)] [']
    require('mini.surround').setup {
      mappings = {
        add = 'gsa',
        delete = 'gsd',
        find = 'gsf',
        find_left = 'gsF',
        highlight = 'gsh',
        replace = 'gsr',
      },
    }

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  end,
}
