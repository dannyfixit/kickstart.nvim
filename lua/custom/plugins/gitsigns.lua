  -- Adds git releated signs to the gutter, as well as utilities for managing changes
return {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+', guibg='NONE' },
        change = { text = '', guibg='NONE' },
        delete = { text = '', guibg='NONE' },
        topdelete = { text = '‾', guibg='NONE' },
        changedelete = { text = '~', guibg='NONE' },
      },
    },
  }

