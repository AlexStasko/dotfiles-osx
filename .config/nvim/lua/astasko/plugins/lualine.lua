local function FileName()
  return {
    {
      'filename',
      file_status = true,
      newfile_status = true,
      path = 1,
      shorting_target = 40,
      symbols = {
        modified = ' ',
        readonly = ' ',
        unnamed = ' ',
        newfile = ' ',
      },
    },
  }
end

return {
  {
    "hoob3rt/lualine.nvim",
    config = function()
      require('lualine').setup {
        options = {
          extensions = { 'fzf', 'quickfix', 'trouble', 'mason', 'lazy' },
          theme = 'catppuccin',
          globalstatus = true,
        },
        sections = {
          lualine_c = FileName(),
        },
        inactive_sections = {
          lualine_c = FileName(),
        },
      }
    end
  }
}
