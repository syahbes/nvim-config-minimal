return {
  "nvim-mini/mini.pairs",
  event = "VeryLazy",
  opts = {
    modes = { insert = true, command = true, terminal = false },
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    skip_ts = { "string" },
    skip_unbalanced = true,
    markdown = true,
  },
  config = function(_, opts)
    local pairs = require("mini.pairs")
    pairs.setup(opts)
    
    -- Add custom mapping for expanding tags on newline
    vim.keymap.set("i", "<CR>", function()
      -- Get the current line and cursor position
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      
      -- Check if cursor is between opening and closing tags
      local before = line:sub(1, col)
      local after = line:sub(col + 1)
      
      if before:match(">$") and after:match("^</") then
        return "<CR><Esc>O"
      end
      
      return "<CR>"
    end, { expr = true, noremap = true, desc = "Expand tags on newline" })
  end,
}
