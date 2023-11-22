


require("config.fix_go_find")
require("config.globals")
require("config.options")

-- bootstrap lazy plugin manager ----------------------------------

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

local lazyopts = {
  install = {
    colorscheme = { "gruvbox" },     -- try to load colorschemes when starting an installation during startup
  },
}

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

-- ----------------------------------------------------------------

require('lazy').setup({
  -- require 'kickstart.plugins.autoformat',
  { 'nvim-lua/plenary.nvim' }, -- lua lib of useful funciton
  { 'kickstart.plugins.debug' },
  -- { import = 'kickstart.plugins.lsp' },
  -- { import = 'custom.plugins' },

  'tpope/vim-fugitive', -- git plugin
  'tpope/vim-rhubarb',
  'tpope/vim-sleuth',   -- Detect tabstop and shiftwidth automatically


  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  -- { import = 'custom.plugins.mason' },
  { import = 'custom.plugins.gruvebox' },
  --  { import = 'custom.plugins.nvim-cmp' },
  { import = 'custom.plugins.nvim-tree' },
  { import = 'custom.plugins.nvim-tree' },
  { import = 'custom.plugins.telescope' },
  { import = 'custom.plugins.telescope-fzf-native' },
  { import = 'custom.plugins.commentary' },
  { import = 'custom.plugins.fidget' },
  { import = 'custom.plugins.gitsigns' },
  { import = 'custom.plugins.harpoon' },
  -- { import = 'custom.plugins.lspconfig' },
  { import = 'custom.plugins.lualine' },
  { import = 'custom.plugins.vim-cool' },
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  { 'HiPhish/nvim-ts-rainbow2' }, -- lua lib of useful funciton
  -- { import = 'custom.plugins.dressing' },
  -- { import = 'custom.plugins.live_grep' },
  -- { import = 'custom.plugins.indent-blankline' },

  -- Useful plugin to show you pending keybinds.
  -- { 'folke/which-key.nvim',             opts = {} },

  -- { import = 'custom.plugins.lsp' },
}, lazyopts)

-- ----------------------------------------------------------------


vim.cmd([[highlight WinBar guibg=none]])




-- [[ Highlight on yank ]] ----------------------------------------- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


















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
require('mason-lspconfig').setup()

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require('mason-lspconfig') -- Ensure the servers above are installed


-- mason_lspconfig.setup {
--   ensure_installed = vim.tbl_keys(servers),
-- }



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
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {}
    }
   end,


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
              },
            },
          },
        }
      }
    }
  end,
}




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









        local ui   = require("harpoon.ui")

        vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, {silent = true, noremap = true})
        vim.keymap.set("n", "<a-Right>", ui.nav_next, {silent = true, noremap = true})

        vim.keymap.set("n", "<a-1>", function()
          ui.nav_file(1)
        end, {silent = true, noremap = true})

        vim.keymap.set("n", "<a-2>", function()
          ui.nav_file(2)
        end, {silent = true, noremap = true})

        vim.keymap.set("n", "<a-3>", function()
          ui.nav_file(3)
        end, {silent = true, noremap = true})

        vim.keymap.set("n", "<a-4>", function()
          ui.nav_file(4)
        end, {silent = true, noremap = true})

        vim.keymap.set("n", "<a-5>", function()
          ui.nav_file(5)
        end, {silent = true, noremap = true})


        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {silent = true, noremap = true})




-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

---@diagnostic disable-next-line missing-fields
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<leader>n'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
   -- ['<Left>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
   -- ['<Right>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
  },
  --mapping = cmp.mapping.preset.insert {
  --  --['<leader>n'] = cmp.mapping.select_next_item(),
  --  ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
  --  ['<C-p>'] = cmp.mapping.select_prev_item(),
  --  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  --  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --  ['<C-Space>'] = cmp.mapping.complete {},
  --  ['<CR>'] = cmp.mapping.confirm {
  --    behavior = cmp.ConfirmBehavior.Replace,
  --    select = true,
  --  },
  --  ['<Tab>'] = cmp.mapping(function(fallback)
  --    if cmp.visible() then
  --      cmp.select_next_item()
  --    elseif luasnip.expand_or_locally_jumpable() then
  --      luasnip.expand_or_jump()
  --    else
  --      fallback()
  --    end
  --  end, { 'i', 's' }),
  --  ['<S-Tab>'] = cmp.mapping(function(fallback)
  --    if cmp.visible() then
  --      cmp.select_prev_item()
  --    elseif luasnip.locally_jumpable(-1) then
  --      luasnip.jump(-1)
  --    else
  --      fallback()
  --    end
  --  end, { 'i', 's' }),
  --},
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}




-- require('nvim-tmux-navigation')

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
