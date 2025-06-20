return {
  {
    'folke/which-key.nvim', -- show help on mappings
    event = 'VeryLazy',
    init = function()
      vim.o.timeout = true
    end,
    opts = {},
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = function()
      require('ibl').setup()
    end,
  },
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = true,
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
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        json = { "jq" },
        terraform = { "terraform_fmt" },
        ["_"] = { "trim_whitespace" },
      },
    },
  },
  'unblevable/quick-scope', -- promote use of f<key>
}
