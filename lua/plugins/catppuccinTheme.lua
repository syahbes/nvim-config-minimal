return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      transparent_background = false,
    })
    
    vim.cmd([[colorscheme catppuccin-mocha]])
    
    local set_hl = vim.api.nvim_set_hl
    
    -- Yellow cursor in normal mode
    set_hl(0, "Cursor", { fg = "NONE", bg = "#F4CD0D" })
    
    -- Matching pairs: underline without background modification
    set_hl(0, "MatchParen", { fg = "NONE", bg = "NONE", bold = true, underline = true })
    
    -- TSX/React tags color (pink)
    set_hl(0, "tsxTagName", { fg = "#f5c2e7" })
    set_hl(0, "tsxIntrinsicTagName", { fg = "#f5c2e7" })  -- Add this for <div>, <span>, etc.
    set_hl(0, "htmlTagName", { fg = "#f5c2e7" })          -- Add this as fallback
    set_hl(0, "tsxTag", { fg = "#8fd9ce" })  -- Angle brackets < >
    set_hl(0, "htmlTag", { fg = "#8fd9ce" })  -- Angle brackets < >
    
    -- Optional: Darker background
    set_hl(0, "Normal", { bg = "#1e1e1e" })
    -- set_hl(0, "NormalNC", { bg = "#0a0a0a" })
    
    -- Create autocmd to reapply highlights
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "catppuccin*",
      callback = function()
        set_hl(0, "Cursor", { fg = "NONE", bg = "#F4CD0D" })
        set_hl(0, "MatchParen", { fg = "NONE", bg = "NONE", bold = true, underline = true })
        
        -- TSX/React tags
        set_hl(0, "tsxTagName", { fg = "#f5c2e7" })
        set_hl(0, "tsxIntrinsicTagName", { fg = "#f5c2e7" })  -- Add this here too
        set_hl(0, "htmlTagName", { fg = "#f5c2e7" })          -- Add this here too
        set_hl(0, "tsxTag", { fg = "#8fd9ce" })
        set_hl(0, "htmlTag", { fg = "#8fd9ce" })
        
        set_hl(0, "Normal", { bg = "#1e1e1e" })
        -- set_hl(0, "NormalNC", { bg = "#0a0a0a" })
      end,
    })
  end,
}