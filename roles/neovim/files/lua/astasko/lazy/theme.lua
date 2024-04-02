return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    config = function ()
      require("catppuccin").setup({
        flavour = "macchiato",
        integrations = {
          cmp = true,
          gitsigns = true,
          native_lsp = {
            enabled = true,
          },
          telescope = true,
          treesitter = true,
        },
        term_colors = true,
        transparent_background = true,
      })

      vim.cmd.colorscheme "catppuccin"
    end
  },
}
