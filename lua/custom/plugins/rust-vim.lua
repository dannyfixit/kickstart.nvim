-- The official rust plugin

return {
    'rust-lang/rust.vim',
    config = function()
        vim.cmd [[
            syntax enable
            filetype plugin indent on
        ]]
    end
}
