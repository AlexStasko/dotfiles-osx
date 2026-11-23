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
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "catppuccin/nvim",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('lualine').setup {
        options = {
          extensions = { 'fzf', 'quickfix', 'trouble', 'mason', 'lazy' },
          theme = 'catppuccin-nvim',
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
