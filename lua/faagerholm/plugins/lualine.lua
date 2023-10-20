local status, lualine = pcall(require, 'lualine')
if not status then
  return
end

lualine.setup({
  options = {
    theme = 'auto',
  },
  sections = {
    lualine_a = {
      {
        'buffers',
        show_filename_only = true,
        hide_filename_extension = false,
        show_midified_status = true,

        mode = 0,
        use_mode_colors = false,

        symbols = {
          modified = '',
          not_modified = '',
          close = '',
          close_modified = '',
          directory = '',
        },
      },
    },
    lualine_b = { 'branch' },
    lualine_c = { 'mode' },
    lualine_x = { 'encoding', 'filetype' },
    lualine_y = { 'diff' },
    lualine_z = { 'location' },
  },
})


