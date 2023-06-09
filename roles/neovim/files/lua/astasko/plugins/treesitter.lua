local function init()
  local parser_install_dir = vim.fn.stdpath('data') .. "/site";
  require'nvim-treesitter.configs'.setup{
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = { enable = true },
    rainbow = { enable = true },
    parser_install_dir = parser_install_dir,
  }

  vim.opt.runtimepath:append(parser_install_dir)
end

return {
  init = init,
}
