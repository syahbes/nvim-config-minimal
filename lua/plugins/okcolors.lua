return {
  "e-q/okcolors.nvim",
  name = "okcolors",
  lazy = false,
  priority = 900, -- Lower priority, no longer default
  config = function()
    -- Don't set as default anymore - catppuccin is now default
    
    -- Apply custom highlights when okcolors is manually activated
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "okcolors",
      callback = function()
        local set_hl = vim.api.nvim_set_hl
        
        -- Yellow cursor in normal mode
        set_hl(0, "Cursor", { fg = "NONE", bg = "#F4CD0D" })
        
        -- Remove background from matching tags/brackets
        set_hl(0, "MatchParen", { fg = "NONE", bg = "NONE", bold = true, underline = true })
      end,
    })
  end,
}
