local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

local lazyopts = {
  install = {
    colorscheme = { "gruvbox" }, -- try to load colorschemes when starting an installation during startup
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






require('lazy').setup({
  -- { url='github/copilot.vim' },
  -- { import='kickstart.plugins.lsp' },
  -- { import='custom.plugins' },
  -- { import='custom.plugins.nvim-cmp' },
  -- { import='custom.plugins.mason' },
  -- { import='custom.plugins.lspconfig' },
  -- { import='custom.plugins.dressing' },
  -- { import='custom.plugins.live_grep' },
  -- { import='custom.plugins.indent-blankline' },
  -- { import='custom.plugins.lsp' },

  { import='kickstart.plugins.debug' },
  { import='custom.plugins.gruvebox' },
  { import='custom.plugins.transparent' },
  { import='custom.plugins.nvim-tree' },
  { import='custom.plugins.telescope' },
  { import='custom.plugins.telescope-fzf-native' },
  { import='custom.plugins.commentary' },
  { import='custom.plugins.fidget' },
  { import='custom.plugins.gitsigns' },
  { import='custom.plugins.harpoon' },
  { import='custom.plugins.lualine' },
  { import='custom.plugins.vim-cool' },                        -- fixed search highlighing
  { url="git@github.com:folke/neodev.nvim", opts = {} },
  { url="git@github.com:williamboman/mason-lspconfig.nvim" },
  { url="git@github.com:puremourning/vimspector" },
  { url="git@github.com:mattn/emmet-vim",
    ft = {
      "html", "css", "javascript", "typescript", "jsx", "tsx", "php"  -- Add more file types as needed
    },
    config = function()
        vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true, noremap = true})
        vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', {expr = true, noremap = true})
        vim.api.nvim_set_keymap('i', '<Tab>', '<Plug>(emmet-expand-abbr)', {silent = true})
    end
  }, 
  { url='HiPhish/nvim-ts-rainbow2' }, -- lua lib of useful funciton
  {
    name='plenary',  -- lua lib of useful funciton
    url='git@github.com:nvim-lua/plenary.nvim'
  },
  -- {
  --   url='git@github.com:rcarriga/nvim-dap-ui',
  --   name='dap-ui',
  --   dependencies={'mfussenegger/nvim-dap'}
  -- },
  {
    url='git@github.com:theHamsta/nvim-dap-virtual-text',
    name='dap-virtual-text',
    config = function()
        require('nvim-dap-virtual-text').setup({})
    end
  },
  {
    url="jay-babu/mason-nvim-dap.nvim",
    config = function()

      require('mason-nvim-dap').setup({
	automatic_setup = true,
	automatic_installation = true,
	handlers = {},	                    -- You can provide additional configuration to the handlers,
	ensure_installed = {
	  --'delve',
	  'php'	                            -- Update this to ensure that you have the debuggers for the langs you want
	},
      })
    end
  },
  { url='jbyuki/one-small-step-for-vimkind' },
--  { url='nvim-telescope/telescope-dap.nvim' },
  { url='simrat39/symbols-outline.nvim',
    config = function()
        require("symbols-outline").setup()
    end
  },
  {
    url='alexghergh/nvim-tmux-navigation',
    config = function()

      local nvim_tmux_nav = require('nvim-tmux-navigation')

      nvim_tmux_nav.setup { disable_when_zoomed = true } -- defaults to false

      vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)

    end
  },
  { url='tpope/vim-fugitive' },                                 -- git plugin
  { url='tpope/vim-rhubarb' },
  { url='tpope/vim-sleuth' },                                   -- Detect tabstop and shiftwidth automatically
  { url='mbbill/undotree' },                                    -- power undo
  { url='nvim-treesitter/nvim-treesitter-context' },            -- sticky funcitons and classes
  -- {
  --   url='neovim/nvim-lspconfig',                                -- LSP Configuration & Plugins
  --   dependencies = {
  --     'williamboman/mason-lspconfig.nvim',
  --     'williamboman/mason.nvim',                                -- Automatically install LSPs to stdpath for neovim
  --     'folke/neodev.nvim',                                      -- Additional lua configuration, makes nvim stuff amazing!
  --    -- { url='j-hui/fidget.nvim', tag = 'legacy', opts = {} },   -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  --   },
  -- },
  {
    url="pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  -- {
  --   url='neovim/nvim-lspconfig',                               -- LSP Configuration & Plugins
  --   dependencies = {
  --     'williamboman/mason-lspconfig.nvim',
  --     'williamboman/mason.nvim',                               -- Automatically install LSPs to stdpath for neovim
  --     'folke/neodev.nvim',                                     -- Additional lua configuration, makes nvim stuff amazing!
  --     { url='j-hui/fidget.nvim', tag = 'legacy', opts = {} },  -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
  --   },
  -- },
  {
    url='hrsh7th/nvim-cmp',                                     -- Autocompletion
    dependencies = {
      'L3MON4D3/LuaSnip',                                       -- Snippet Engine & its associated nvim-cmp source
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',                                   -- Adds LSP completion capabilities
      'rafamadriz/friendly-snippets',                           -- Adds a number of user-friendly snippets
    },
  },
  {
   url='L3MON4D3/LuaSnip',
   dependencies = {
    'rafamadriz/friendly-snippets'
    }
  },
  -- {
  --   url='nvim-treesitter/nvim-treesitter',                       -- Highlight, edit, and navigate code
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter-textobjects',
  --   },
  --   build = ':TSUpdate',
  -- },

}, lazyopts)

