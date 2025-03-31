return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					theme = vim.g.colors_name or "auto", -- or "gruvbox", "nord", etc.
					section_separators = "", -- disable separators for a cleaner look
					component_separators = "",
					icons_enabled = true,
				},
			})

			-- Auto-update lualine theme when colorscheme changes
			vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				require("lualine").setup({
					options = {
						theme = vim.g.colors_name or "auto",
						section_separators = "",
						component_separators = "",
						icons_enabled = true,
					},
				})
			end,
		})

		end,
	},
}
