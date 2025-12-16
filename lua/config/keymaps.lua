vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Open Ex" } )
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true }) -- write (already in normal mode)
vim.keymap.set("i", "<C-s>", "<C-c>:w<CR>", { noremap = true, silent = true }) --exit insert mode and write

---- Move lines ----
-- Normal mode line movement
vim.keymap.set("n", "<A-j>", ":m +1<CR>==") -- Move current line down one position
vim.keymap.set("n", "<A-k>", ":m -2<CR>==") -- Move current line up one position

-- Visual mode line movement (works on selected blocks and current line)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- Move down one position
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- Move up one position
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
---- End of move lines ----

vim.keymap.set("v", "<leader>y", '"+y') -- yank to clipboard
vim.keymap.set("i", "<C-b>", "<C-r>\"", { noremap = true, silent = true }) -- Paste from yank buffer in insert mode

-- Black hole
vim.keymap.set("v", "x", '"_x', { desc = "Cut selection to black hole" })
vim.keymap.set("i", "<C-x>", '<C-o>"_dd', { desc = "Cut whole line to black hole (insert)" })
vim.keymap.set("n", "<C-x>", '"_dd', { desc = "Cut whole line to black hole (normal)" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste over selection without losing yank" }) -- greatest remap ever (paste over and throw the selected to void)
