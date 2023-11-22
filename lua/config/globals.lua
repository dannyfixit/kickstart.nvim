local g = vim.g


g.mapleader      = ' '
g.maplocalleader = ' '
g.backspace      = 'indent,eol,start'

-- disable netrw at the very start of your init.lua (strongly advised)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.python3_host_prog = '/usr/bin/python3'
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

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


