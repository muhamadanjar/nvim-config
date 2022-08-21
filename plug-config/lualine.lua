local status, lualine = pcall(require, 'lualine')
if (not status) then

  return

end

lualine.setup {

  options = {
    icon_enabled = true,
    theme = "gruvbox",
    section_separators = { left = '', right = ''},
    component_separators = { left = '', right = ''},
    disabled_filetypes = {}

  },
  sections = {

    lualine_a = { 'mode' },
    lualine_a = { 'branch' },
    lualine_a = { {

      'filename', 
      file_status = true,
      path = 0 ,
    } },
    lualine_x = {

      { 
        'diagnostics', 
        sources = {"nvim_diagnostic"},  
        symbols = { error = ' ', warn = ' ', info = ' ',}
      },
      'encoding', 'filetype'
    },
    lualine_y = {'progress'}, 
    lualine_z = {'location'}
  },
  winbar = {},
  inactive_winbar = {},
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {"fugitive"}
}
