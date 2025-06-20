return {
  { 'numToStr/Comment.nvim', opts = {} }, -- comments
  {                                       -- git signs
    'lewis6991/gitsigns.nvim',
    opts = {}
  },
  { -- cmd view
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      { -- notifications
        'rcarriga/nvim-notify',
        config = function()
          local notify = require("notify")
          notify.setup({
            render = "compact",
            timeout = 2500,
            stages = "fade",
            background_colour = "#000000",
          })
          vim.notify = notify
        end,
      },
    }
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 10000,
    config = function()
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
          notify = true,
          noice = true,
          lsp_trouble = true,
        },
        term_colors = true,
        transparent_background = true,
      })

      vim.cmd.colorscheme "catppuccin"
    end
  },
}
