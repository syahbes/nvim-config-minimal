return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 900, -- Lower priority than okcolors
  config = function()
    -- Set up catppuccin but don't activate it yet
    require("catppuccin").setup({
      -- Your catppuccin config here if needed
    })
    
    -- Create autocmd for when catppuccin is manually activated
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "catppuccin*",
      callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "#120217" })
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#6a6e84" })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a0a2e" })
        vim.api.nvim_set_hl(0, "ModeMsg", { fg = "#F2CD32" })
      end,
    })
  end,
}
