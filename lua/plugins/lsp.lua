-- lua/plugins/lsp.lua
return {
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "clangd", "marksman" },
				automatic_installation = false,
			})

			local lspconfig = require("lspconfig")
			local keymaps = require("keymaps")

			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
            capabilities = capabilities,
						on_attach = function(_, bufnr)
							print("LSP server (" .. server_name .. ") attached to buffer " .. bufnr);
							keymaps.lsp_keymaps(bufnr)
						end,
					})
				end,

				-- Disable "undefined global 'vim'" warning in Lua LSP
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
            capabilities = capabilities,
						on_attach = function(_, bufnr)
							print("LSP server (lua_ls) attached to buffer " .. bufnr .. " with custom config")
							keymaps.lsp_keymaps(bufnr)
						end,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					})
				end,

			})

			-- sourcekit not offered by Mason, so install manually
			lspconfig.sourcekit.setup({
				filetypes = { "swift" },
        capabilities = capabilities,
				on_attach = function(_, bufnr)
					print("LSP server (sourcekit) attached to buffer " .. bufnr)
					keymaps.lsp_keymaps(bufnr)
				end,
			})

		end,
	},
}

