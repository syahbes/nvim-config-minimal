vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.mapleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- set to 0 to default to tabstop value

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

