vim.lsp.config('pyright', {
	cmd = { 'pyright' },
	filtypes = { 'python' }
})
vim.lsp.enable('pyright')

vim.lsp.config('ts_ls', {
	cmd = { 'typescript-language-server', '--stdio' },
	filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
})
vim.lsp.enable('ts_ls')
