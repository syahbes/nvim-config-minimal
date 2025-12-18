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
		lua = { "stylua" },
	},
})

-- Format with conform and LSP lsp fallback
vim.keymap.set("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format buffer" })
