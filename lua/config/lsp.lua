-- LSP Server Configuration
-- Configure TypeScript/JavaScript server
vim.lsp.config("ts_ls", {
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
})

-- Configure CSS server
vim.lsp.config("cssls", {
	cmd = { "vscode-css-language-server", "--stdio" },
	filetypes = { "css", "scss", "less" },
	root_markers = { "package.json", ".git" },
})

-- Configure Tailwind CSS server for NativeWind
vim.lsp.config("tailwindcss", {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css" },
	root_markers = { "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" },
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "className\\s*=\\s*[\"'`]([^\"'`]*)[\"'`]" },
					{ "className\\s*=\\s*{`([^`]*)`}" },
					{ "className\\s*=\\s*{\\s*[\"'`]([^\"'`]*)[\"'`]\\s*}" },
				},
			},
		},
	},
})

-- Enable all servers
vim.lsp.enable("ts_ls")
vim.lsp.enable("cssls")
vim.lsp.enable("tailwindcss")

-- LSP Keymaps
-- Diagnostics
vim.keymap.set("n", "K", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

-- Navigation
vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "Go to definition" })
vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "Go to references" })
