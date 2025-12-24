return {
  "e-q/okcolors.nvim",
  name = "okcolors",
  lazy = false,
  priority = 1000, -- Highest priority to load as default
  config = function()
    -- Set okcolors as the default colorscheme
    vim.cmd([[colorscheme okcolors]])
    
    -- Apply custom highlights after colorscheme loads
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "okcolors",
      callback = function()
        local set_hl = vim.api.nvim_set_hl
        
        -- Yellow cursor in normal mode (same as quiet theme)
        set_hl(0, "Cursor", { fg = "NONE", bg = "#F4CD0D" })
        
        -- Remove background from matching tags/brackets
        set_hl(0, "MatchParen", { fg = "NONE", bg = "NONE", bold = true, underline = true })
      end,
    })
    
    -- Apply highlights immediately as well
    local set_hl = vim.api.nvim_set_hl
    set_hl(0, "Cursor", { fg = "NONE", bg = "#F4CD0D" })
    set_hl(0, "MatchParen", { fg = "NONE", bg = "NONE", bold = true, underline = true })
  end,
}
