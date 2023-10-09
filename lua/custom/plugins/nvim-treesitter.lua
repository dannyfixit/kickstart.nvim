-- Highlight, edit, and navigate code
return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
       local treesitter = require("nvim-treesitter.configs")
       treesitter.setup({
            highlight = {
                enable = true
            },
            indent = { enavle = true },
            ensure_installed = {
                "bash",
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
            },
            incremental_selection = {
                enable = true,
                keymals = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<C-Left>",
                }
            },

       })
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
  }
