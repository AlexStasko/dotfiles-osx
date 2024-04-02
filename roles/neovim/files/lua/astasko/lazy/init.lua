return {
  'tpope/vim-sleuth', -- automatically adjusts `shiftwidth` and `expandtab`
  { 'numToStr/Comment.nvim', opts = {} }, -- comments
  'lewis6991/gitsigns.nvim',
  {
    'folke/which-key.nvim', -- show help on mappings
    event = 'VeryLazy',
    init = function ()
      vim.o.timeout = true
    end,
    opts = {},
  },
  'unblevable/quick-scope', -- promote use of f<key>
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = function()
      require('ibl').setup()
    end,
  },
  'romgrk/nvim-treesitter-context',
  {
    'rcarriga/nvim-notify',
    config = function()
      local notify = require("notify")
      notify.setup({
        render = "compact",
        stages = "fade",
        background_colour = "#000000",
      })
      vim.notify = notify
    end,
  },
  'glench/vim-jinja2-syntax',
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        javascript = { { "prettierd", "prettier" } },
        json = { "jq" },
        terraform = { "terraform_fmt" },
        ["_"] = { "trim_whitespace" },
      },
    },
  },
}
