return {
  {
    "folke/trouble.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("trouble").setup()
      vim.api.nvim_set_keymap("n", "<leader>hh", "<cmd>Trouble<cr>",
        {
          silent = true,
          noremap = true
        }
      )
    end
  },
}
