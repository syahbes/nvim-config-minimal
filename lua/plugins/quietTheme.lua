return {
  "nvim-lua/plenary.nvim",
  lazy = false,
  priority = 1000, -- Higher priority to load quiet as default
  config = function()
    -- Set quiet as the default colorscheme
    vim.cmd([[colorscheme quiet]])
    
    -- Apply custom highlights after colorscheme loads
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "quiet",
      callback = function()
        local set_hl = vim.api.nvim_set_hl

        -- Statusline / Winbar
        set_hl(0, "StatusLine", { bg = "#1a1a1a", fg = "#cfcfcf" })
        set_hl(0, "StatusLineNC", { bg = "#141414", fg = "#7a7a7a" })
        set_hl(0, "WinBar", { bg = "#1a1a1a", fg = "#cfcfcf" })
        set_hl(0, "WinBarNC", { bg = "#141414", fg = "#7a7a7a" })

        -- Completion / suggestion menu
        set_hl(0, "Pmenu", { bg = "#1c1c1c", fg = "#d0d0d0" })
        set_hl(0, "PmenuSel", { bg = "#2a2a2a", fg = "#ffffff", bold = true })
        set_hl(0, "PmenuBorder", { bg = "#1c1c1c", fg = "#3a3a3a" })
        set_hl(0, "PmenuThumb", { bg = "#3a3a3a" })
        set_hl(0, "PmenuSbar", { bg = "#1c1c1c" })
        
        -- Cursor
        set_hl(0, "Cursor", { fg = "NONE", bg = "#F4CD0D" })
      end,
    })
    
    -- Apply highlights immediately as well
    local set_hl = vim.api.nvim_set_hl
    set_hl(0, "StatusLine", { bg = "#1a1a1a", fg = "#cfcfcf" })
    set_hl(0, "StatusLineNC", { bg = "#141414", fg = "#7a7a7a" })
    set_hl(0, "WinBar", { bg = "#1a1a1a", fg = "#cfcfcf" })
    set_hl(0, "WinBarNC", { bg = "#141414", fg = "#7a7a7a" })
    set_hl(0, "Pmenu", { bg = "#1c1c1c", fg = "#d0d0d0" })
    set_hl(0, "PmenuSel", { bg = "#2a2a2a", fg = "#ffffff", bold = true })
    set_hl(0, "PmenuBorder", { bg = "#1c1c1c", fg = "#3a3a3a" })
    set_hl(0, "PmenuThumb", { bg = "#3a3a3a" })
    set_hl(0, "PmenuSbar", { bg = "#1c1c1c" })
    set_hl(0, "Cursor", { fg = "NONE", bg = "#F4CD0D" })
  end,
}
