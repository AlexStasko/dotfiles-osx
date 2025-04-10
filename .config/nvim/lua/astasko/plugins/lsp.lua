-- local function getSnykToken()
--     local handle = assert(io.popen("doppler secrets get SNYK_TOKEN --plain --config-dir ~/.doppler"))
--
--     local result = handle:read("*a")
--     handle:close()
--
--     result = result:match("^%s*(.-)%s*$")
--
--     if result == "" then
--         error("Snyk token is empty")
--     end
--
--     return result
-- end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
      lsp_capabilities = vim.tbl_deep_extend('force', lsp_capabilities, require('cmp_nvim_lsp').default_capabilities())

      local lspconfig = require("lspconfig")
      require("mason").setup()
      require("mason-lspconfig").setup({
        automatic_installation = true,

        ensure_installed = {
          'bashls',
          'cssls',
          'diagnosticls',
          'dockerls',
          'eslint',
          'gopls',
          'html',
          'jinja_lsp',
          'jsonls',
          'jsonnet_ls',
          'lua_ls',
          --'nil_ls',
          'pyright',
          'rust_analyzer',
          'spectral',
          'terraformls',
          'ts_ls',
          'yamlls',
        },


        handlers = {
          function(server_name)
            lspconfig[server_name].setup {
              capabilities = lsp_capabilities,
            }
          end,

          ["diagnosticls"] = function()
            lspconfig.diagnosticls.setup {
              capabilities = lsp_capabilities,
              filetypes = { "python" },
              init_options = {
                filetypes = {
                  python = "black"
                },
                formatFiletypes = {
                  python = { "black" }
                },
                formatters = {
                  black = {
                    command = "black",
                    args = { "--quiet", "-" },
                    rootPatterns = { "pyproject.toml" },
                  },
                },
              }
            }
          end,

          ["gopls"] = function()
            lspconfig.gopls.setup {
              capabilities = lsp_capabilities,
              settings = {
                gopls = {
                  gofumpt = true,
                },
              },
            }
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
              capabilities = lsp_capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { 'vim' }
                  },
                  runtime = {
                    version = 'LuaJIT',
                  },
                  telemetry = {
                    enable = false,
                  },
                  workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                  },
                }
              }
            }
          end,

          -- ["nil_ls"] = function()
          --   lspconfig.nil_ls.setup {
          --     capabilities = lsp_capabilities,
          --     settings = {
          --       ['nil'] = {
          --         formatting = { command = { "alejandra" } },
          --       },
          --     }
          --   }
          -- end,

          ["pyright"] = function()
            lspconfig.pyright.setup {
              capabilities = lsp_capabilities,
              settings = {
                python = {
                  analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true
                  },
                },
              },
            }
          end,
          -- ["snyk_ls"] = function()
          --   lspconfig.snyk_ls.setup({
          --     capabilities = lsp_capabilities,
          --     init_options = {
          --       activateSnykOpenSource = "true",
          --       activateSnykCode = "true",
          --       activateSnykIac = "true",
          --       automaticAuthentication = "true",
          --       token = getSnykToken(),
          --       enableTrustedFoldersFeature = "false",
          --     }
          --   })
          -- end,

          ["yamlls"] = function()
            lspconfig.yamlls.setup({
              capabilities = lsp_capabilities,
              settings = {
                yaml = {
                  customTags = { "!reference sequence" }
                }
              }
            })
          end,
        },
      })

      local cmp = require("cmp")
      local lspkind = require('lspkind')
      cmp.setup({
        view = {
          entries = { name = 'custom', selections_order = 'near_cursor' }
        },
        formatting = {
          format = lspkind.cmp_format(),
        },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
          ["<S-Tab>"] = vim.schedule_wrap(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        }, {
          { name = 'buffer' },
        }),
      })
      -- Set configuration for specific filetype.
      -- cmp.setup.filetype('gitcommit', {
      --   sources = cmp.config.sources({
      --     { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      --     { name = 'buffer' },
      --   })
      -- })

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
          { name = 'cmdline' },
        })
      })
    end
  },
}
