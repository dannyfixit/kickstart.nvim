return {
    -- NOTE: Yes, you can install new plugins here!
    'mfussenegger/nvim-dap',
    -- NOTE: And you can specify dependencies as well
    dependencies = {
        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',

        -- Installs the debug adapters for you
        'williamboman/mason.nvim',
        'nvim-treesitter/nvim-treesitter',
        'nvim-telescope/telescope-dap.nvim',
        'theHamsta/nvim-dap-virtual-text',
        -- Add your own debuggers here
        'leoluz/nvim-dap-go',
        'mxsdev/nvim-dap-vscode-js',
    },
    config = function()

        local dap = require('dap')
        local dapui = require('dapui')



        -- -- mason-lspconfig requires that these setup functions are called in this order
        -- -- before setting up the servers.
        -- require('mason').setup()
        -- require('mason-lspconfig').setup()
        -- -- require("nvim-dap-virtual-text").setup({})


        -- dap.adapters.php = {
        --   type = "executable",
        --   command = "node",
        --   args = { os.getenv("HOME") .. "/build/vscode-php-debug/out/phpDebug.js" }
        -- }

        -- Basic debugging keymaps, feel free to change to your liking!
        vim.keymap.set('n', '<F5>', dap.continue)
        vim.keymap.set('n', '<F1>', dap.step_into)
        vim.keymap.set('n', '<F2>', dap.step_over)
        vim.keymap.set('n', '<F3>', dap.step_out)
        -- vim.keymap.set('n', '<leader>1', dap.toggle_breakpoint()

        dap.adapters.php = {
            type = "executable",
            command = "node",
            -- args = { os.getenv("HOME") .. "/build/vscode-php-debug/out/phpDebug.js" }
            args = { "/home/peachy/Documents/cmd/vscode-php-debug/out/phpDebug.js" }
        }

        dap.configurations.php = {
            {
                type = "php",
                request = "launch",
                name = "Listen for Xdebug",
                port = 9003,
                pathMappings = {
                    ["/var/www/html"] = "${workspaceFolder}"
                }
            }
        }

        --vim.keymap.set('n', '<leader><leader>', ":lua print('brake')")
        -- vim.keymap.set('n', '<leader>B', function()
        --   dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        -- end)

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        -- dapui.setup {
        -- Set icons to characters that are more likely to work in every terminal.
        --    Feel free to remove or use ones that you like more! :)
        --    Don't feel like these are good choices.
        -- icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
        -- controls = {
        -- icons = {
        --   pause = '⏸',
        --   play = '▶',
        --   step_into = '⏎',
        --   step_over = '⏭',
        --   step_out = '⏮',
        --   step_back = 'b',
        --   run_last = '▶▶',
        --   terminate = '⏹',
        -- },
        -- },
        -- }

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Install golang specific config
        require('dap-go').setup()
    end,
}
