local function init()
  -- Make line numbers default
  vim.opt.number = true
  -- Relative line numbers
  vim.opt.relativenumber = true
  -- Don't show the mode, since it's already in status line
  vim.o.showmode = false
  -- Sync clipboard between OS and Neovim.
  vim.o.clipboard = 'unnamedplus'
  -- Case-insensitive searching UNLESS \C or capital in search
  vim.opt.ignorecase = true
  vim.opt.smartcase = true
  -- Keep signcolumn on by default
  vim.opt.signcolumn = 'yes'
  -- Decrease update time
  vim.opt.updatetime = 250
  vim.opt.timeoutlen = 300
  -- Configure how new splits should be opened
  vim.opt.splitright = true
  vim.opt.splitbelow = true
  -- Sets how neovim will display certain whitespace in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  vim.opt.list = true
  vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
  -- Preview substitutions live, as you type!
  vim.opt.inccommand = 'split'
  -- Show which line your cursor is on
  vim.opt.cursorline = true
  -- Minimal number of screen lines to keep above and below the cursor.
  vim.opt.scrolloff = 10
  -- Set highlight on search
  vim.opt.hlsearch = true

  vim.o.colorcolumn = 80
  vim.o.shortmess = vim.o.shortmess .. 'c'
  vim.o.termguicolors = true

  vim.wo.wrap = false

  vim.o.shiftwidth = 2
  vim.o.tabstop = 2
  vim.o.expandtab = true
end

return {
  init = init,
}
