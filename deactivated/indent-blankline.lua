-- Add indentation guides even on blank lines
local highlight = {
    "CursorColumn",
    "Whitespace",
}

return {
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = "ibl",
    setup = {
        indent = { highlight = highlight, char = "┊" },
        whitespace = {
            highlight = highlight,
            remove_blankline_trail = false,
        },
        scope = { enabled = false },
    }
    -- opts = {
    -- char = '┊',
    -- show_trailing_blankline_indent = false,
    -- }
}
