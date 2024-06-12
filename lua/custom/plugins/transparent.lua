-- transparent
return {
    'xiyaowong/transparent.nvim',
    config = function()
        require("transparent").setup({
            -- enable = true, -- Enable transparency
            groups = { -- table: default groups
                'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
                'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
                'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
                --             'SignColumn', 'CursorLineNr', 'EndOfBuffer',
            },
            extra_groups = {
                --   "NormalFloat",   -- plugins which have float panel such as Lazy, Mason, LspInfo
                "NvimTreeNormal" -- NvimTree
            },                   -- table: additional groups that should be cleared
            exclude_groups = {}, -- table: groups you don't want to clear
        })

        -- call :TransparentEnable()
        -- Adjust transparency for help pages
        vim.api.nvim_exec2([[
              augroup TransparentHelp
                autocmd!
                autocmd FileType help highlight Normal guibg=#1e1e2e

              augroup END
        ]], {})

    end
}

-- require("transparent").setup({ -- Optional, you don't have to run setup.
--   groups = { -- table: default groups
--     'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
--     'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
--     'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
--     'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
--     'EndOfBuffer',
--   },
--   extra_groups = {}, -- table: additional groups that should be cleared
--   exclude_groups = {}, -- table: groups you don't want to clear
-- })

