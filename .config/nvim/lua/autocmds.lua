local function augroup(name)
	return vim.api.nvim_create_augroup('milianor_' .. name, { clear = true })
end

vim.api.nvim_create_autocmd('BufWinEnter', {
	group = augroup 'add_markdown_column',
	pattern = { '*.md', '*.norg' },
	callback = function()
		vim.opt.colorcolumn = '80'
		vim.opt.textwidth = 80
	end
})

vim.api.nvim_create_autocmd({ 'BufWinLeave' }, {
	group = augroup 'remove_markdown_column',
	pattern = { '*.md', '*.norg' },
	callback = function()
		vim.opt.colorcolumn = '120'
		vim.opt.textwidth = 120
	end
})

vim.api.nvim_create_autocmd('TextYankPost', {
	group = augroup 'highlight_yank',
	callback = function()
		vim.highlight.on_yank()
	end,
})
