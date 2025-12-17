-- LSP Server Configuration
-- Configure TypeScript/JavaScript server
vim.lsp.config('ts_ls', {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
})

-- Configure CSS server
vim.lsp.config('cssls', {
  cmd = { 'vscode-css-language-server', '--stdio' },
  filetypes = { 'css', 'scss', 'less' },
  root_markers = { 'package.json', '.git' },
})

-- Enable both servers
vim.lsp.enable('ts_ls')
vim.lsp.enable('cssls')

-- LSP Keymaps
-- Diagnostics
vim.keymap.set("n", "K", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Navigation
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "gd", require('telescope.builtin').lsp_definitions, { desc = "Go to definition" })
vim.keymap.set("n", "gr", require('telescope.builtin').lsp_references, { desc = "Go to references" })

require("conform").setup({
  formatters_by_ft = {
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
  },
})

-- Format with conform and LSP lsp fallback
vim.keymap.set("n", "<leader>fm", function()
  require("conform").format({ lsp_fallback = true })
end, { desc = "Format buffer" })
