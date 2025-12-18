return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- Snippet engine (required by nvim-cmp)
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		-- LSP completion source
		"hrsh7th/cmp-nvim-lsp",

		-- Buffer completion source
		"hrsh7th/cmp-buffer",

		-- Path completion source
		"hrsh7th/cmp-path",

		-- Command line completion
		"hrsh7th/cmp-cmdline",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- Load custom snippets
		require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/lua/snippets" })

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				-- Navigate completion menu
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),

				-- Scroll documentation window
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),

				-- Complete
				["<C-Space>"] = cmp.mapping.complete(),

				-- Close completion menu
				["<Esc>"] = cmp.mapping.abort(),

				-- Confirm selection
				["<CR>"] = cmp.mapping.confirm({ select = true }),

				-- Tab completion
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 1000 }, -- LSP
				{ name = "luasnip", priority = 750 }, -- Snippets
				{ name = "path", priority = 500 }, -- File paths
			}, {
				{ name = "buffer", priority = 250 }, -- Text from current buffer
			}),
			window = {
				completion = {
					border = "none",
					winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
				},
				documentation = {
					border = "rounded",
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
					max_width = 80,
					max_height = 20,
				},
			},
			formatting = {
				format = function(entry, vim_item)
					-- Truncate documentation if it contains base64 or is too long
					if entry.completion_item and entry.completion_item.documentation then
						local doc = entry.completion_item.documentation
						if type(doc) == "string" then
							-- Remove markdown image syntax
							doc = doc:gsub("!%[.-%]%(.-%)", "")
							-- Truncate at first base64 pattern or after 500 chars
							local base64_start = doc:find("data:image") or doc:find("base64")
							if base64_start then
								entry.completion_item.documentation = doc:sub(1, base64_start - 1)
							elseif #doc > 500 then
								entry.completion_item.documentation = doc:sub(1, 500) .. "..."
							else
								entry.completion_item.documentation = doc
							end
						elseif type(doc) == "table" and doc.value then
							-- Remove markdown image syntax
							doc.value = doc.value:gsub("!%[.-%]%(.-%)", "")
							local base64_start = doc.value:find("data:image") or doc.value:find("base64")
							if base64_start then
								doc.value = doc.value:sub(1, base64_start - 1)
							elseif #doc.value > 500 then
								doc.value = doc.value:sub(1, 500) .. "..."
							end
						end
					end

					-- Add source name to show where completion comes from
					local source_names = {
						nvim_lsp = "[LSP]",
						luasnip = "[Snip]",
						buffer = "[Buf]",
						path = "[Path]",
					}
					vim_item.menu = source_names[entry.source.name]
					return vim_item
				end,
			},
		})
		-- Set custom highlight for documentation window
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e1e", fg = "#d4d4d4" })
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e1e", fg = "#6e6e6e" })
		-- Command line completion
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
		-- Search completion
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})
	end,
}
