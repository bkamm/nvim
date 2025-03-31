-- BOOTSTRAP lazy.nvim (auto-installs if not found)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- === Plugins ===
require("lazy").setup({
  { "morhetz/gruvbox" },
  { "nordtheme/vim" },
  {
		"github/copilot.vim",
		event = "InsertEnter",
	},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
	},
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
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require'nvim-treesitter.configs'.setup({
				-- A list of parser names, or "all" (the listed parsers MUST always be installed)
				ensure_installed = { "c", "cpp","python", "lua", "markdown" },

				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				highlight = {
					enable = true,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
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
})
