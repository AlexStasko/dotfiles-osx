local cmd = vim.api.nvim_command
local fn = vim.fn
local packer = nil

local function packer_verify()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
    cmd 'packadd packer.nvim'
  end
end

local function packer_startup()
  if packer == nil then
    packer = require'packer'
    packer.init()
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use 'wbthomason/packer.nvim'
  

  -- Language Servers
  use 'pantharshit00/vim-prisma'
  use 'hashivim/vim-terraform'
  use 'simrat39/rust-tools.nvim'
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      'neovim/nvim-lspconfig',
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'},
      -- Completion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'ray-x/cmp-treesitter',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'onsails/lspkind-nvim',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip'
    },
    config = function()
      require'astasko.plugins.languages'.init()
    end
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = 'TSUpdate',
    config = function ()
      require'astasko.plugins.treesitter'.init()
    end,
  }


  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    config = function ()
      require'astasko.plugins.telescope'.init()
    end
  }

  -- Themes
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function ()
      require'astasko.plugins.theme'.init()
    end
  }

  -- Git Support
  use {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('gitsigns').setup()
    end
  }

  -- Utilities
  use 'unblevable/quick-scope' -- promote use of f<key>

  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'hoob3rt/lualine.nvim',
    config = function ()
      require'astasko.plugins.lualine'.init()
    end
  }

  use 'preservim/nerdcommenter'

  use 'romgrk/nvim-treesitter-context'

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require"trouble".setup()
      vim.api.nvim_set_keymap("n", "<leader>hh", "<cmd>Trouble<cr>",
        {
          silent = true,
          noremap = true
        }
      )
    end
  }

  use {
    'voldikss/vim-floaterm',
    config = function ()
      require'astasko.plugins.floaterm'.init()
    end
  }

end

local function init()
  packer_verify()
  packer_startup()
end

return {
  init = init
}
