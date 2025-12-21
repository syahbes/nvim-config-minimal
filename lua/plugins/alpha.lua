return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Function to get current working directory (shortened with ~)
		local function get_cwd()
			local cwd = vim.fn.getcwd()
			local home = vim.fn.expand("~")
			if cwd:find(home, 1, true) == 1 then
				cwd = "~" .. cwd:sub(#home + 1)
			end
			return cwd
		end

		-- Function to get git branch
		local function get_git_branch()
			local handle = io.popen("git branch --show-current 2>/dev/null")
			if handle then
				local branch = handle:read("*a"):gsub("\n", "")
				handle:close()
				if branch and branch ~= "" then
					return branch
				end
			end
			return nil
		end

		-- Function to create terminal-style prompt
		local function get_terminal_prompt()
			local cwd = get_cwd()
			local branch = get_git_branch()

			if branch then
				return cwd .. " (" .. branch .. ")$ "
			else
				return cwd .. "$ "
			end
		end

		-- Create custom footer with inline highlights
		local function create_colored_footer()
			local cwd = get_cwd()
			local branch = get_git_branch()

			if branch then
				-- Create a string with virtual text for coloring
				local prompt_line = cwd .. " (" .. branch .. ")$ "

				-- We'll use the built-in footer but apply custom highlighting via autocmd
				return { prompt_line }
			else
				return { cwd .. "$ " }
			end
		end

		-- Function to get dynamic Neovim version
		local function get_nvim_version()
			local version = vim.version()
			return "NVIM v" .. version.major .. "." .. version.minor .. "." .. version.patch
		end

		-- Set your custom header with dynamic version
		dashboard.section.header.val = {
			get_nvim_version(),
		}

		-- Set left alignment for header
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.header.opts.position = "left"

		-- Set the terminal prompt as footer
		dashboard.section.footer.val = create_colored_footer()
		dashboard.section.footer.opts.hl = "AlphaPath"
		dashboard.section.footer.opts.position = "left"

		-- Your custom buttons with left alignment
		dashboard.section.buttons.val = {
      dashboard.button("t", "  Neo-tree", ":Neotree<CR>"),
			dashboard.button("n", "  Open netrw", ":Explore<CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
			dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
			--	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			--	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
			--	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
		}
		-- Ensure buttons are left-aligned
		dashboard.section.buttons.opts.position = "left"
		dashboard.section.buttons.opts.spacing = 1

		-- Define the highlight groups
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#CBA6F7", force = true })
		vim.api.nvim_set_hl(0, "AlphaPath", { fg = "#87D88E", force = true }) -- Green for path and parentheses
		vim.api.nvim_set_hl(0, "AlphaBranch", { fg = "#70A5F9", force = true }) -- Blue for branch name

		-- Also set it with an autocmd to ensure it persists after colorscheme changes
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#CBA6F7", force = true })
				vim.api.nvim_set_hl(0, "AlphaPath", { fg = "#87D88E", force = true })
				vim.api.nvim_set_hl(0, "AlphaBranch", { fg = "#70A5F9", force = true })
			end,
		})

		-- Function to apply custom syntax highlighting to the footer
		local function apply_footer_highlights()
			if vim.bo.filetype == "alpha" then
				local branch = get_git_branch()
				if branch then
					local cwd = get_cwd()
					local pattern = vim.fn.escape(cwd .. " (" .. branch .. ")$ ", "()[]{}.*+?^$\\")

					-- Clear any existing matches
					vim.fn.clearmatches()

					-- Highlight the branch name specifically
					local branch_pattern = "(" .. vim.fn.escape(branch, "()[]{}.*+?^$\\") .. ")"
					vim.fn.matchadd("AlphaBranch", branch_pattern)
				end
			end
		end

		-- Update the footer when changing directories
		vim.api.nvim_create_autocmd("DirChanged", {
			pattern = "*",
			callback = function()
				dashboard.section.footer.val = create_colored_footer()
				if vim.bo.filetype == "alpha" then
					vim.cmd("AlphaRedraw")
					vim.defer_fn(apply_footer_highlights, 10)
				end
			end,
		})

		-- Apply highlights when alpha loads
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.defer_fn(apply_footer_highlights, 10)
			end,
		})

		-- padding
		dashboard.config.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 2 },
			dashboard.section.footer,
		}

		-- Set global alignment to left for all elements
		dashboard.config.opts = {
			position = "left",
			margin = 5, -- Add some left margin if desired
		}

		-- Alternative method: Set individual button alignment if needed
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts = button.opts or {}
			button.opts.position = "left"
		end

		-- Apply the configuration
		alpha.setup(dashboard.config)
	end,
}-- Set your custom header
-- small ASCII header – back-slashes doubled
--dashboard.section.header.val = {
--    "                                                     ",
--    "##\\   ##\\ ########\\  ######\\  ##\\    ##\\ ######\\ ##\\      ##\\",
--    "###\\  ## |##  _____|##  __##\\ ## |   ## |\\_##  _|###\\    ### |",
--    "####\\ ## |## |      ## /  ## |## |   ## |  ## |  ####\\  #### |",
--    "## ##\\## |#####\\    ## |  ## |\\##\\  ##  |  ## |  ##\\##\\## ## |",
--    "## \\#### |##  __|   ## |  ## | \\##\\##  /   ## |  ## \\###  ## |",
--    "## |\\### |## |      ## |  ## |  \\###  /    ## |  ## |\\#  /## |",
--    "## | \\## |########\\  ######  |   \\#  /   ######\\ ## | \\_/ ## |",
--    "\\__|  \\__|\\________| \\______/     \\_/    \\______|\\__|     \\__|",
--	"                                                     ",
--	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
--	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
--	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
--	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
--	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
--	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
--	"                                                     ",
--    "  _   _                 _           ",
--    " | \\ | | ___  _____   _(_)_ __ ___",
--    " |  \\| |/ _ \\/ _ \\ \\ / / | '_ ` _ \\",
--    " | |\\  |  __/ (_) \\ V /| | | | | | |",
--    " |_| \\_|\\___|\\___/ \\_/ |_|_| |_| |_|",
--    "                                    ",
--    "   ",
--}
