return {
    'williamboman/mason.nvim',
    -- config = true
    dependencies = { "https://github.com/jay-babu/mason-nvim-dap.nvim" },
    config = function()
        -- mason-lspconfig requires that these setup functions are called in this order
        -- before setting up the servers.
        require('mason').setup()
        require('mason-lspconfig').setup(
        --   ensure_installed = { "html", "phpactor" }, -- Ensures these language servers are installed
        -- automatic_installation = true,
        )

        require('mason-nvim-dap').setup({
            automatic_setup = true,
            automatic_installation = true,
            handlers = {}, -- You can provide additional configuration to the handlers,
            ensure_installed = {
                --'delve',
                'php' -- Update this to ensure that you have the debuggers for the langs you want
            },
        })

        require('mason-lspconfig').setup()
        -- require("nvim-dap-virtual-text").setup({})





        local registry = require("mason-registry")

        registry.refresh(function()
            registry.get_package("htmlhint")
        end)



        -- [[ mason lsp ]]
        --
        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local mason_lspconfig = require('mason-lspconfig') -- Ensure the servers above are installed


        ----
        -- local on_attach = function(_, bufnr)
        --     -- a function that lets us more easily define mappings specific
        --     -- for LSP related items. It sets the mode, buffer and description for us each time.

        --     local nmap = function(keys, func, desc)
        --         if desc then
        --             desc = 'LSP: ' .. desc
        --         end

        --         vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
        --     end

        --     nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
        --     nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        --     nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
        --     nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
        --     nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
        --     nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
        --     nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
        --     nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        --     -- See `:help K` for why this keymap
        --     nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
        --     nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

        --     -- Lesser used LSP functionality
        --     nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        --     nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
        --     nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
        --     nmap('<leader>wl', function()
        --         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        --     end, '[W]orkspace [L]ist Folders')

        --     -- Create a command `:Format` local to the LSP buffer
        --     vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        --         vim.lsp.buf.format()
        --     end, { desc = 'Format current buffer with LSP' })
        -- end

        ---



        local on_attach = function()
            vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { buffer = 0 }) -- think this dosent work
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
            vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
            vim.keymap.set('n', '<leader>gf', vim.diagnostic.goto_next, { buffer = 0 })
            vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, { buffer = 0 })
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = 0 })
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0, desc = 'LSP: [C]ode [A]ction' })

            -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
        end



        local function custom_on_publish_diagnostics(_, result, ctx, config)
          local diagnostics = result.diagnostics
          local filtered_diagnostics = {}

          for _, diagnostic in ipairs(diagnostics) do
            if not string.match(diagnostic.message, "Undefined variable") then
              table.insert(filtered_diagnostics, diagnostic)
            end
          end

          result.diagnostics = filtered_diagnostics
          vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
        end

        mason_lspconfig.setup_handlers {


            ["gopls"] = function()
                require('lspconfig')['gopls'].setup {

                    on_attach = on_attach,
                }
            end,
            ["rust_analyzer"] = function()
                require('lspconfig')['rust_analyzer'].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                }
            end,

            ["phpactor"] = function()
                require('lspconfig')['phpactor'].setup {

                    on_attach = on_attach,
                      handlers = {
                        ["textDocument/publishDiagnostics"] = custom_on_publish_diagnostics
                      }
                }
            end,
            ["lua_ls"] = function()
                require('lspconfig')['lua_ls'].setup {
                    on_attach = on_attach,
                    capabilities = capabilities,
                    Lua = {
                        on_attach = on_attach,
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                        diagnostics = {
                            undefined_global   = false, -- remove this from diag!
                            missing_parameters = false, -- missing fields :)
                            globals            = {
                                'vim',
                                'require'
                            },
                        },
                    },
                }
            end,

            ["pyright"] = function()
                require('lspconfig')['pyright'].setup {
                    autoImportCompletion = true,
                    on_attach = function()
                        vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, { buffer = 0 }) -- think this dosent work
                        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
                        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
                        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = 0 })
                        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
                        vim.keymap.set('n', '<leader>gf', vim.diagnostic.goto_next, { buffer = 0 })
                        vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, { buffer = 0 })
                        vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { buffer = 0 })
                        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action,
                            { buffer = 0, desc = 'LSP: [C]ode [A]ction' })

                        -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                        vim.lsp.buf.format()
                    end
                }
            end,

        }
    end
}
