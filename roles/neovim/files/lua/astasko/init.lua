require("astasko.vim")
require("astasko.remap")
require("astasko.lazy_init")

local augroup = vim.api.nvim_create_augroup
local AStaskoGroup = augroup('AStasko', {})

local autocmd = vim.api.nvim_create_autocmd

local telescope = require('telescope.builtin')

autocmd('LspAttach', {
	group = AStaskoGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set('n', 'gd', telescope.lsp_definitions, opts)
		vim.keymap.set('n', 'gr', telescope.lsp_references, opts)
		vim.keymap.set('n', 'gi', telescope.lsp_implementations, opts)
		vim.keymap.set('n', '<space>D', telescope.lsp_type_definitions, opts)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<space>f', function() require('conform').format() end, opts)
		vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
	end
})
