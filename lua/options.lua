-- === Indentation ===
local indent_size = 2
vim.opt.smartindent = true
vim.opt.tabstop = indent_size
vim.opt.softtabstop = indent_size
vim.opt.shiftwidth = indent_size
vim.opt.expandtab = true	-- convert tabs to spaces

-- === Search ===
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.smartcase = true

-- === UI/Display ===
vim.cmd('syntax on')          -- syntax highlighting
vim.opt.wrap = false      	  -- wrap lines
vim.opt.number = true    			-- line numbers
vim.opt.relativenumber = true -- relative line numbers
vim.opt.scrolloff = 8		      -- keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8	    -- keep 8 lines to the left/right of cursor
vim.opt.colorcolumn = "80"    -- highlight column 80

-- === Swapping/Backup/Undo ===
vim.opt.swapfile = false 	-- disable swapfile
vim.opt.backup = false 	-- disable backup
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- undo directory
vim.opt.undofile = true 	-- enable persistent undo

-- === Miscellaneous ===
vim.opt.errorbells = false
vim.opt.termguicolors = true
