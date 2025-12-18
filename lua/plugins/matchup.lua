return {
	"andymass/vim-matchup",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		-- Enable offscreen match display
		vim.g.matchup_matchparen_offscreen = { method = "popup" }

		-- Disable highlighting, only bold the tag
		vim.g.matchup_matchparen_enabled = 1
		vim.g.matchup_matchparen_deferred = 1
		vim.g.matchup_matchparen_hi_surround_always = 0

		-- Set highlight to bold only (no background color)
		vim.api.nvim_set_hl(0, "MatchParen", { bold = true })
	end,
}
