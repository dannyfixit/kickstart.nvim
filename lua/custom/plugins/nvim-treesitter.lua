-- Highlight, edit, and navigate code
return {
    'nvim-treesitter/nvim-treesitter',
    -- build = ":TSUpdate,TSConfig",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()

        vim.defer_fn(function()

        local treesitter = require("nvim-treesitter.configs")
        ---@diagnostic disable-next-line missing-fields      
        treesitter.setup({

            -- Add languages to be installed here that you want installed for treesitter
            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)

            highlight = { enable = true },
            indent = { enable = true, disable = { 'python' }, enavle = true },
            additional_vim_regex_highlighting = false,
            auto_install = true,
            -- ignore_install = false,
            sync_install = true,
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = {
                -- "bash",
                "css",
                "dockerfile",
                "gitattributes",
                "gitignore",
                "html",
                "javascript",
                "json5",
                "json",
                "latex",
                "lua",
                "markdown",
                "php",
                "python",
                "rust",
                "sql",
                -- "ssh",
                "svelte",
                -- "tree-sitter",
                "typescript",
                "vue",
                -- "wasm",
                "yaml",
                -- 'c',
                'cpp',
                'tsx',
                'vim',

            },
            move = {

                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist

                goto_next_start = {
                    [']m'] = '@function.outer',
                    [']]'] = '@class.outer',
                },
                goto_next_end = {
                    [']M'] = '@function.outer',
                    [']['] = '@class.outer',
                },
                goto_previous_start = {
                    ['[m'] = '@function.outer',
                    ['[['] = '@class.outer',
                },
                goto_previous_end = {
                    ['[M'] = '@function.outer',
                    ['[]'] = '@class.outer',
                },

            },
            incremental_selection = {

                enable = true,
                keymals = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<C-Left>",
                    -- scope_incremental = '<c-s>',
                    -- node_decremental = '<M-space>',
                }

            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['<leader>a'] = '@parameter.inner',
                    },
                    swap_previous = {
                        ['<leader>A'] = '@parameter.inner',
                    },
                },
            },
        })

        end, 0)
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
}
