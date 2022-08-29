require('lualine').setup({
  options = {
    theme = "auto",
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {{'filename', path = 1}},
    lualine_b = {'branch', {
      'diff',
      color_added = 'green',
      color_modified = 'yellow',
      color_removed = 'red'
    }},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
})
