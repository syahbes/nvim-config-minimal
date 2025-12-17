return {
  "andymass/vim-matchup",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- Enable offscreen match display
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
    
    -- Enable highlighting
    vim.g.matchup_matchparen_enabled = 1
    vim.g.matchup_matchparen_deferred = 1
    vim.g.matchup_matchparen_hi_surround_always = 1
  end,
}
