return {
  'gelguy/wilder.nvim',
  config = function()
    -- config goes here
    local wilder = require('wilder')
    wilder.setup({ modes = { ':', '/', '?' } })
    wilder.set_option('renderer', wilder.renderer_mux({
      [':'] = wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
      }),
      ['/'] = wilder.wildmenu_renderer({
        highlighter = wilder.basic_highlighter(),
      }),
    }))
    wilder.set_option('renderer', wilder.popupmenu_renderer(
      { 
        pumblend = 20 -- transparentsy
      },
      wilder.popupmenu_border_theme({
        highlights = {
          border = 'Normal', -- highlight to use for the border
        },
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
        border = 'rounded',
      })
    ))
  end,
}
