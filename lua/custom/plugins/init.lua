--
-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information


-- vim.o.clipboard = { 'unnamed', 'unnamedplus' } -- set up clipboard
-- vim.opt.clipboard = "unnamed, unnamedplus"

--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamed'
-- vim.o.clipboard = 'unnamedplus'
-- set up clipboard
vim.o.relativenumber = true



-- return {}


----------------------------------------------------------
-- General Neovim settings and configuration
-----------------------------------------------------------

-- Default options are not included
-- See: https://neovim.io/doc/user/vim_diff.html
-- [2] Defaults - *nvim-defaults*

local g           = vim.g   -- Global variables
local opt         = vim.opt -- Set options (global/buffer/windows-scoped)

opt.backup        = false   -- create backup files
opt.cmdheight     = 1       -- cmd line space

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse         = 'a'                         -- Enable mouse support
-- opt.clipboard = 'unnamedplus'         -- Copy/paste to system clipboard
opt.swapfile      = false                       -- Don't use swapfile
opt.dir           = '/tmp'
opt.completeopt = { "menu", "noinsert", "menuone", "noselect" } -- Set completeopt to have a better completion experience



-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
-- opt.number        = true     -- Show line number
-- opt.showmatch     = true     -- Highlight matching parenthesis
-- opt.foldmethod    = 'marker' -- Enable folding (default 'foldmarker')
-- opt.splitright    = true     -- Vertical split to the right
-- opt.splitbelow    = true     -- Horizontal split to the bottom
-- opt.ignorecase    = true     -- Ignore case letters when search
-- opt.smartcase     = true     -- Ignore lowercase for the whole pattern
-- opt.linebreak     = true     -- Wrap on word boundary
-- opt.termguicolors = true     -- Enable 24-bit RGB colors
-- opt.laststatus    = 3        -- Set global statusline

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab     = true -- Use spaces instead of tabs
opt.shiftwidth    = 4    -- Shift 4 spaces when tab (for indentation)
opt.tabstop       = 4    -- 1 tab == 4 spaces
opt.smartindent   = true -- Autoindent new lines
opt.softtabstop   = 4    -- 
opt.wrap          = false -- 

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden        = true -- Enable background buffers
opt.history       = 100  -- Remember N lines in history
opt.lazyredraw    = true -- Faster scrolling
-- opt.synmaxcol     = 600  -- Max column for syntax highlight
opt.updatetime    = 250  -- ms to wait for trigger an event

-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
-- Disable nvim intro
opt.shortmess:append "sI"

-- -- Disable builtin plugins
local disabled_built_ins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
    "tutor",
    "rplugin",
    "synmenu",
    "optwin",
    "compiler",
    "bugreport",
    "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end

--
return {}
