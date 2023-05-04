local function set_vim_g()
  vim.g.mapleader = " "
end

local function set_vim_o()
  local settings = {
    clipboard = 'unnamedplus',
    colorcolumn = 80,
    expandtab = true,
    scrolloff = 3,
    shiftwidth = 2,
    shortmess = vim.o.shortmess .. 'c',
    splitright = true,
    softtabstop = 2,
    showmode = false,
    tabstop = 2,
    termguicolors = true,
    updatetime = 300
  }

  -- Generic vim.o
  for k, v in pairs(settings) do
    vim.o[k] = v
  end
end

local function set_vim_wo()
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.wo.wrap = false
end

local function set_keymaps()
  local map = vim.api.nvim_set_keymap

  local options = { noremap = false }

  map('n', '<leader>h', '<CMD>wincmd h<CR>', options)
  map('n', '<leader>j', '<CMD>wincmd j<CR>', options)
  map('n', '<leader>k', '<CMD>wincmd k<CR>', options)
  map('n', '<leader>l', '<CMD>wincmd l<CR>', options)
end


local function init()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
  set_keymaps()
end

return {
  init = init
}
