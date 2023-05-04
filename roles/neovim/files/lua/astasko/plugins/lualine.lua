local function init()
  require('lualine').setup {
    options = {
      extensions = { 'fzf', 'quickfix' },
      theme = 'catppuccin'
    }
  }
end

return {
  init = init
}
