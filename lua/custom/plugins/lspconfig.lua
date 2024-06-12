return {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    lazy = false,
    dependencies = {

        { 'williamboman/mason-lspconfig.nvim' },
        { 'williamboman/mason.nvim', config = true }, -- Automatically install LSPs to stdpath for neovim
        { 'hrsh7th/nvim-cmp' },
        { 'folke/neodev.nvim' },

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        -- { 'j-hui/fidget.nvim', branch = 'legacy' },

        config = function()
            --    local capabilities = vim.lsp.protocol.make_client_capabilities()      -- nvim-cmp supports additional completion capabilities, so broadcast that to servers

            --   capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

            -- local mason_lspconfig = require('mason-lspconfig')                     -- Ensure the servers above are installed
        end,

        on_attach = function(_, bufnr)
            -- LSP settings.
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = 'LSP: [G]oto [D]eclaration' })
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr, desc = 'LSP: [G]oto [D]eclaration' })
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder,
                { buffer = bufnr, desc = 'LSP: [W]orkspace [A]dd Folder' })
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder,
                { buffer = bufnr, desc = 'LSP: [W]orkspace [R]emove Folder' })

            vim.keymap.set('n', '<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, { buffer = bufnr, desc = 'LSP: [W]orkspace [L]ist Folders' })

            -- Create a command `:Format` local to the LSP buffer
            -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            --  vim.lsp.buf.format()
            -- end, { desc = 'LSP: Format current buffer with LSP' })
        end


    }

}
