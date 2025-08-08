vim.g.mapleader = "\\"
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "<C-space>", "<C-x><C-o>")
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action)
