local map = vim.keymap.set

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- map("n", "<leader>e", ":Ex<CR>", { desc = "Open Ex" })
map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Write (normal mode)" })
map("i", "<C-s>", "<C-c>:w<CR>", { noremap = true, silent = true, desc = "Exit insert and write" })

-- Clipboard operations
map("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("i", "<C-b>", '<C-r>"', { noremap = true, silent = true, desc = "Paste from yank buffer" })

-- Black hole operations
map("v", "x", '"_x', { desc = "Cut selection to black hole" })
map("i", "<C-x>", '<C-o>"_dd', { desc = "Cut whole line to black hole (insert)" })
map("n", "<C-x>", '"_dd', { desc = "Cut whole line to black hole (normal)" })

-- Paste from last yank (unnamed register) without overwriting it
map("x", "<leader>p", '"_dP', { desc = "Paste from yank without losing it" })
-- Paste from system clipboard (+ register) without overwriting it
map("x", "<leader>v", '"_d"+P', { desc = "Paste from clipboard without overwriting" })

-- clear search highlight on escape (but keep default esc behavior)
map({ "i", "n", "s" }, "<esc>", function()
	-- Clear search highlight if there is one
	if vim.v.hlsearch == 1 then
		vim.cmd("noh")
	end

	-- Stop snippet if in snippet mode
	if lazyvim and lazyvim.cmp and lazyvim.cmp.actions then
		lazyvim.cmp.actions.snippet_stop()
	end

	-- Return the escape key to continue normal behavior
	-- This allows telescope, insert mode exit, etc. to work
	return "<esc>"
end, { expr = true, desc = "escape and clear hlsearch" }) -- clear search highlight on escape

-- Comment
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("v", "<C-_>", "gc", { remap = true, desc = "Toggle comment" })
vim.keymap.set("n", "<leader>tc", ":Telescope colorscheme <CR>")
