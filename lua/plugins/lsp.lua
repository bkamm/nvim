return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local keymaps = require("keymaps")

			-- Lua (using lua-language-server)
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Remove 'undefined global vim' warning
						},
					},
				},
			})

			-- Python (using pyright)
			lspconfig.pyright.setup({})

			-- C/C++ (using clangd)
			lspconfig.clangd.setup({})

			-- Markdown (using marksman)
			lspconfig.marksman.setup({})

			-- Generic LSP keybindings
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local bufnr = args.buf
					keymaps.lsp_keymaps(bufnr)
				end,
			})
		end,
	},
}
