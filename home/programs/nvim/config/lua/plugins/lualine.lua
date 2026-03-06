return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = true,
				},
				winbar = {
					lualine_a = { "filename" },
				},
				inactive_winbar = {
					lualine_a = { "filename" },
				},
			})
		end,
	},
}
