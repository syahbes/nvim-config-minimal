return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		vim.cmd([[colorscheme catppuccin-mocha]])
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" }) -- was #120217
				vim.api.nvim_set_hl(0, "NormalNC", { bg = "#120217" }) -- non-active window
				vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a6e84" })
				-- Highlight current line with a slightly lighter background
				vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a0a2e" })
			end,
		})
		-- Also set immediately
		vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" }) -- was #120217
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "#120217" })
		vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a6e84" })
		vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a0a2e" })

		--vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#FFFF00" }) -- mode indicator
		vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#F2CD32" }) -- mode indicator
		--vim.api.nvim_set_hl(0, "MsgArea", { fg = "#00A57E" }) -- messages
	end,
}
