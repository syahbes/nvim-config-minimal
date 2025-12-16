vim.cmd([[highlight Cursor guifg=NONE guibg=#F4CD0D]]) -- yellow
--vim.cmd([[highlight Cursor guifg=NONE guibg=#A5E3A4]]) -- catppuccin green

vim.opt.guicursor = {
  --"n-v-c:block",  -- normal/visual: block
  "n-v-c:block-Cursor",  -- normal/visual: block with Cursor highlight
  "i-ci-ve:block-blinkwait247-blinkon247-blinkoff247", -- 247 theme!
  "r-cr:hor20",
  "o:hor50"
}


vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.g.mapleader = " "

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 0 -- set to 0 to default to tabstop value
