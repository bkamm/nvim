-- This file contains all my keymaps

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "jj", "<Esc>", { noremap = true })
vim.keymap.set("i", "JJ", "<Esc>", { noremap = true })

local M = {}

function M.lsp_keymaps(bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
end

return M
