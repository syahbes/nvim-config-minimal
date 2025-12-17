return {
  "nvim-mini/mini.pairs",
  event = "VeryLazy",
  opts = {
    modes = { insert = true, command = true, terminal = false },
    -- Don't skip '>' so tags can auto-close
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    skip_ts = { "string" },
    skip_unbalanced = true,
    markdown = true,
  },
  config = function(_, opts)
    local pairs = require("mini.pairs")
    pairs.setup(opts)
    
    -- Custom mapping to expand tags with newline between them
    vim.keymap.set("i", "<CR>", function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local before = line:sub(1, col)
      local after = line:sub(col + 1)
      
      if before:match(">$") and after:match("^</") then
        return "<CR><Esc>O"
      end
      
      return "<CR>"
    end, { expr = true, noremap = true, desc = "Expand tags on newline" })
  end,
}
