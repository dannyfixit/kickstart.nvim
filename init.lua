-- This helps with gf links
vim.opt_local.suffixesadd:prepend('.lua')
vim.opt_local.suffixesadd:prepend('init.lua')
vim.opt_local.path:prepend(vim.fn.stdpath('config')..'/lua')

require("config.fix_go_find")
require("config.globals")
require("config.options")
require('config.highlight_yank') -- Highlight on yank

-- bootstrap lazy plugin manager ----------------------------------
require('config.lazy')

vim.cmd([[highlight WinBar guibg=none]])

-- [[ Config DAP ]]
require('nvim-dap-virtual-text').setup({})



-- [[ Configure Treesitter ]]

-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
vim.defer_fn(function()

  ---@diagnostic disable-next-line missing-fields
  require('nvim-treesitter.configs').setup {
    -- Add languages to be installed here that you want installed for treesitter
    ensure_installed = { 'php', 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash' },
    -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    -- navigation = {
    --    enable = true,
    --    keymaps = {
    --       goto_next_usage = "<leader>nn"
    --    }
    -- },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        node_decremental = '<M-space>',
      },
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
          ['ii'] = '@conditional.inner',
          ['ai'] = '@conditional.outer',
        },
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
  }
end, 0)




-- [[ nvim treesitter ]]

---@diagnostic disable-next-line missing-fields
require('nvim-treesitter.configs').setup {
  rainbow = {
    enable = true,
    -- list of languages you want to disable the plugin for
    disable = { 'jsx', 'cpp' },
    -- Which query to use for finding delimiters
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = require('ts-rainbow').strategy.global,
  }
}




require('treesitter-context').setup {
  enable = true,            -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 4,            -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20,              -- The Z-index of the context window
  on_attach = nil,          -- (fun(buf: integer): boolean) return false to disable attaching
}





-- [[ Configure LSP ]]

--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)

  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end



-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
 require('mason').setup()
 require('mason-lspconfig').setup(
   --   ensure_installed = { "html", "phpactor" }, -- Ensures these language servers are installed
   -- automatic_installation = true,
 )
require('neodev').setup() -- Setup neovim lua configuration


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require('mason-lspconfig') -- Ensure the servers above are installed



-- [[ mason lsp ]]

mason_lspconfig.setup_handlers {

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
      -- on_attach = on_attach,
         autoImportCompletion = true,
         on_attach = function()
            vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, {buffer = 0}) -- think this dosent work
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
            vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer = 0})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer = 0})
            vim.keymap.set('n', '<leader>gf', vim.diagnostic.goto_next, {buffer = 0})
            vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, {buffer = 0})
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer = 0})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0, desc = 'LSP: [C]ode [A]ction' })

            -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
            vim.lsp.buf.format()
         end
      --{ desc = 'Format current buffer with LSP' },

        -- nmap('<leader>wl', function()
        --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, '[W]orkspace [L]ist Folders')

     , capabilities = capabilities,
     -- settings = {}
     }
  end,



  --require'lspconfig'.pyright.setup {
--    capabilities = capabilities,
--    on_attach = function()
--       vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, {buffer = 0}) -- think this dosent work
--       vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer = 0})
--       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = 0})
--       vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer = 0})
--       vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer = 0})
--       vim.keymap.set('n', '<leader>gf', vim.diagnostic.goto_next, {buffer = 0})
--       vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev, {buffer = 0})
--       vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer = 0})
--       vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0, desc = 'LSP: [C]ode [A]ction' })

--       -- vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
--	--    vim.lsp.buf.format()
--	--  end, { desc = 'Format current buffer with LSP' })

--       --  nmap('<leader>wl', function()
--       --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--       --  end, '[W]orkspace [L]ist Folders')
--    end,
--    -- settings = {
--    -- }
--}


  ["intelephense"] = function()
    require('lspconfig')['intelephense'].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        intelephense = {

          diagnostics = {
            undefinedProperties = false,
            -- undefinedTypes = false,
          },
          completionItem = {
            snippetSupport  = true,
            resolveProvider = true,
          },
          intelephense = {
            environment = {
              includePaths = {
                "/home/peachy/Documents/cmd/better2know.net/application/core",
                "/home/peachy/Documents/cmd/better2know.net/application",
                "/home/peachy/Documents/cmd/better2know.net/system",
                "/home/peachy/Documents/cmd/better2know.net/system/core",
                "/home/peachy/.config/nvim/stubs/url_helper.php",
              },
            },
          },
        }
      }
    }
  end,

}




vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

vim.fn.has("persistent_undo")
vim.o.undodir = '/tmp'
vim.o.undolevels = 10000
vim.bo.undofile = true




-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local luasnip = require('luasnip')

local cmp     = require('cmp')
luasnip.config.setup {}

require('luasnip.loaders.from_vscode').lazy_load()






-- Expand or jump to the next snippet position
-- vim.keymap.set({ 'i', 's' }, '<Tab>', function()
--  if luasnip.expand_or_jumpable() then
--    luasnip.expand_or_jump()
--  end
--end, { silent = true })



-- Jump to the previous snippet position
-- vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
--  if luasnip.jumpable(-1) then
--    luasnip.jump(-1)
--  end
-- end, { silent = true })



-- -- @diagnostic disable-next-line missing-fields
 cmp.setup {
   snippet = {
     expand = function(args)
       luasnip.lsp_expand(args.body)
     end,
   },
   mapping = {
     ['<leader>n'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
     ['<CR>'] = cmp.mapping.confirm({ select = true }),
     ['<Left>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
     ['<Right>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
  },
   mapping = cmp.mapping.preset.insert {
    --['<leader>n'] = cmp.mapping.select_next_item(),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
   sources = {
     { name = 'nvim_lsp' },
     { name = 'luasnip' },
   },
 }




local registry = require("mason-registry")

registry.refresh(function()
  registry.get_package("htmlhint")
end)





-- Autoclose solution
vim.api.nvim_create_autocmd("BufEnter", {

  callback = function()
      if #vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == "NvimTree" then
         vim.cmd("quit")
      end
  end

})


-- require('nvim-tmux-navigation')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
