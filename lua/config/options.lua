vim.cmd([[highlight Cursor guifg=NONE guibg=#F4CD0D]]) -- yellow
--vim.cmd([[highlight Cursor guifg=NONE guibg=#A5E3A4]]) -- catppuccin green

vim.opt.guicursor = {
  --"n-v-c:block",  -- normal/visual: block
  "n-v-c:block-Cursor",  -- normal/visual: block with Cursor highlight
  "i-ci-ve:block-blinkwait247-blinkon247-blinkoff247", -- 247 theme!
  "r-cr:hor20",
  "o:hor50"
}

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Undo
vim.opt.undofile = true

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Leader key
vim.g.mapleader = " "

-- Tabs and Indentation
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 2           -- Number of spaces a tab counts for
vim.opt.shiftwidth = 0        -- Set to 0 to default to tabstop value
vim.opt.softtabstop = 2       -- Number of spaces for tab in insert mode
vim.opt.smartindent = true    -- Smart autoindenting on new lines
vim.opt.autoindent = true     -- Copy indent from current line

-- Search
vim.opt.ignorecase = true     -- Ignore case in search
vim.opt.smartcase = true      -- Override ignorecase if search has uppercase

-- Display
vim.opt.wrap = false          -- Don't wrap lines
vim.opt.scrolloff = 8         -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor
vim.opt.signcolumn = "yes"    -- Always show sign column

-- Performance
vim.opt.updatetime = 250      -- Faster completion
vim.opt.timeoutlen = 300      -- Time to wait for mapped sequence

-- Clipboard
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard
