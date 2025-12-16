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
                { name = "nvim_lsp" }, -- LSP
                { name = "luasnip" },  -- Snippets
                { name = "path" },     -- File paths
            }, {
                { name = "buffer" },   -- Text from current buffer
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
                    -- Show only the kind (Field, Function, etc.)
                    -- Remove the menu to reduce clutter
                    vim_item.menu = nil
                    return vim_item
                end
            },
        })
        -- Set custom highlight for documentation window
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e1e", fg = "#d4d4d4" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#1e1e1e", fg = "#6e6e6e" })
        -- Command line completion
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" }
            }, {
                { name = "cmdline" }
            })
        })
        -- Search completion
        cmp.setup.cmdline("/", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" }
            }
        })
    end,
}
