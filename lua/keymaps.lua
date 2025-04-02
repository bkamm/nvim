-- This file contains all my keymaps

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>Ex", vim.cmd.Ex)

vim.keymap.set("i", "jj", "<Esc>", { noremap = true })
vim.keymap.set("i", "JJ", "<Esc>", { noremap = true })

-- use J and K in visual mode to move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "<C-d>zz")
vim.keymap.set("n", "K", "<C-u>zz")

-- the primeagean used x instead of v for these (note for future debugging?)
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

-- delete to void register
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

local M = {}

-- Kaymaps for LSP
function M.lsp_keymaps(bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>fo", function()
    vim.lsp.buf.format()
  end)
end

-- Keymaps for Telescope
function M.telescope_keymaps()
  local telescope = require("telescope.builtin")

  vim.keymap.set("n", "<leader>ff", telescope.find_files)

  -- Search for config files no matter what directory I'm in
  vim.keymap.set("n", "<leader>con", function()
    telescope.find_files({
      cwd = vim.fn.stdpath("config"),
    })
  end)

  -- Search for files with lazy grep
  -- After the initial regex, you can use two spaces plus a filetype (a '*.'
  -- will automaticall prepend the filetype) to further narrow down the search
  vim.keymap.set("n", "<leader>fg", function()
    require("commands.live_multigrep").live_multigrep()
  end)

end

return M
