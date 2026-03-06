return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "vtsls", "html", "cssls", "volar", "jdtls" },
			})

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.volar.setup({
				capabilities = capabilities,
			})

			lspconfig.nil_ls.setup({
				capabilities = capabilities,
			})

			lspconfig.jdtls.setup({
				capabilities = capabilities,
			})

			lspconfig.lua_ls.setup({
				cmd = { "lua-language-server" },
				single_file_support = true,
				filetypes = { "lua" },
				capabilities = capabilities,
			})

			lspconfig.vtsls.setup({
				capabilities = capabilities,
			})

			vim.diagnostic.config({
				update_in_insert = false, -- Activate only in insert mode
				virtual_text = {
					spacing = 4,
				},
				underline = true,
				severity_sort = true,
			})
		end,
	},
}
