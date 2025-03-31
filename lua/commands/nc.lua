-- Clear current window, paste clipboard content, and shift all lines to the left
-- (used to quickly paste code from neetcode.io).
vim.api.nvim_create_user_command('NC', function()
  -- Delete all lines
  vim.cmd('%d')
  -- Paste clipboard content
  vim.cmd('normal! "+gP')
  -- Shift all lines to the left
  vim.cmd('normal! ggVG<<')
	-- turn on c++ syntax highlighting
	vim.cmd('set filetype=cpp')
	-- turn off Copilot
	vim.cmd('Copilot disable')
end, {})
