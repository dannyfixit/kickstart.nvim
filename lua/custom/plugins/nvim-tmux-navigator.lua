return {
     "alexghergh/nvim-tmux-navigation",
  config = function ()

    require('nvim-tmux-navigation')
    vim.g.tmux_navigator_no_mappings = 1

        vim.keymap.set({'n','v'},  "<a-h>", "NvimTmuxNavigateLeft<CR>")
        vim.keymap.set({'n','v' }, "<a-j>", "NvimTmuxNavigateDown<CR>")
        vim.keymap.set({'n','v' }, "<a-k>", "NvimTmuxNavigateUp<CR>")
        vim.keymap.set({'n','v' }, "<A-l>", "NvimTmuxNavigateRight<CR>")
        vim.keymap.set({'n','v' }, "<A-\\>", "NvimTmuxNavigateLastActive<CR>")
        vim.keymap.set({'n','v' }, "<A-Space>", "NvimTmuxNavigateNext<CR>")

  end
}
