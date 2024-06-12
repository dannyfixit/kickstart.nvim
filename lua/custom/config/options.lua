local opt          = vim.o
local optw         = vim.wo

opt.relativenumber = true

opt.backup         = false -- create backup files
opt.cmdheight      = 1    -- cmd line space

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse          = 'a'                              -- Enable mouse support
-- opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile       = false                            -- Don't use swapfile
opt.dir            = '/tmp'
opt.completeopt    = "menu,noinsert,menuone,noselect" -- Set completeopt to have a better completion experience
opt.scrolloff      = 999                              -- so we dont need to go to the bottom of the page whem scrolling
opt.diffopt        = 'vertical'

-- [[ Setting options ]] -- See `:help vim.o`
-- vim.cmd.colorscheme 'gruvbox'       -- vim.cmd.colorscheme 'onedark'
opt.number         = true
optw.signcolumn    = 'yes'      -- Keep signcolumn on by default
opt.hlsearch       = true       -- Set highlight on search
opt.mouse          = 'a'        -- Enable mouse mode
opt.clipboard      = 'unnamedplus' --  See `:help 'clipboard'`
opt.breakindent    = true       -- Enable break indent
opt.undofile       = true       -- Save undo history

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase     = true
opt.smartcase      = true

-- Decrease update time
opt.updatetime     = 250
opt.timeout        = true
opt.timeoutlen     = 300


opt.showmatch     = true     -- Highlight matching parenthesis
opt.foldmethod    = 'marker' -- Enable folding (default 'foldmarker')
opt.splitright    = true     -- Vertical split to the right
opt.splitbelow    = true     -- Horizontal split to the bottom
opt.smartcase     = true     -- Ignore lowercase for the whole pattern
opt.linebreak     = true     -- Wrap on word boundary
opt.termguicolors = true     -- Enable 24-bit RGB colors
opt.laststatus    = 3        -- Set global statusline



-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab   = true    -- Use spaces instead of tabs
opt.shiftwidth  = 4       -- Shift 4 spaces when tab (for indentation)
opt.tabstop     = 4       -- 1 tab == 4 spaces
opt.smartindent = true    -- Autoindent new lines
opt.softtabstop = 4       --
opt.wrap        = false   --

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden      = true   -- Enable background buffers
opt.history     = 100    -- Remember N lines in history
opt.lazyredraw  = true   -- Faster scrolling
-- opt.synmaxcol     = 600  -- Max column for syntax highlight
opt.updatetime  = 250    -- ms to wait for trigger an event

-- NOTE: You should make sure your terminal supports this
-- vim.o.termguicolors = true

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess   = "sI"




vim.opt_local.suffixesadd:prepend('.lua')
vim.opt_local.suffixesadd:prepend('init.lua')
vim.opt_local.path:prepend(vim.fn.stdpath('config') .. '/lua')
vim.cmd([[highlight WinBar guibg=none]])
vim.fn.has("persistent_undo")
opt.undodir = '/tmp'
opt.undolevels = 10000
vim.bo.undofile = true



-- Autoclose solution
vim.api.nvim_create_autocmd("BufEnter", {

  callback = function()
    if #vim.api.nvim_list_bufs() == 1 and vim.bo.filetype == "NvimTree" then
      vim.cmd("quit")
    end
  end

})
