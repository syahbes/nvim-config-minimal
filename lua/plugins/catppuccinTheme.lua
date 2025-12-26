return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000, -- Highest priority to load as default
  config = function()
    -- Set up catppuccin
    require("catppuccin").setup({
      flavour = "mocha", -- Set mocha as default flavour
      transparent_background = false, -- Set to true for transparent background
      -- Your other catppuccin config here if needed
    })
    
    -- Set catppuccin-mocha as the default colorscheme
    vim.cmd([[colorscheme catppuccin-mocha]])
    
    -- Apply custom highlights
    local set_hl = vim.api.nvim_set_hl
    
    -- Yellow cursor in normal mode
    set_hl(0, "Cursor", { fg = "NONE", bg = "#F4CD0D" })
    
    -- Matching pairs: underline without background modification
    set_hl(0, "MatchParen", { fg = "NONE", bg = "NONE", bold = true, underline = true })
    
    -- TSX/React Native tags color (pink)
    set_hl(0, "tsxTagName", { fg = "#f5c2e7" })
    set_hl(0, "tsxTag", { fg = "#8fd9ce" })  -- Angle brackets < >
    set_hl(0, "htmlTag", { fg = "#8fd9ce" })  -- Angle brackets < >
    
    -- Optional: Darker background (uncomment to enable)
    set_hl(0, "Normal", { bg = "#1e1e1e" })
    -- set_hl(0, "NormalNC", { bg = "#0a0a0a" })
    
    -- Create autocmd to reapply highlights when colorscheme is activated
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "catppuccin*",
      callback = function()
        set_hl(0, "Cursor", { fg = "NONE", bg = "#F4CD0D" })
        set_hl(0, "MatchParen", { fg = "NONE", bg = "NONE", bold = true, underline = true })
        
        -- TSX/React Native tags
        set_hl(0, "tsxTagName", { fg = "#f5c2e7" })
        set_hl(0, "tsxTag", { fg = "#8fd9ce" })  -- Angle brackets < >
        set_hl(0, "htmlTag", { fg = "#8fd9ce" })  -- Angle brackets < >
        
        -- Optional: Darker background (uncomment to enable)
        set_hl(0, "Normal", { bg = "#1e1e1e" })
        -- set_hl(0, "NormalNC", { bg = "#0a0a0a" })
      end,
    })
  end,
}