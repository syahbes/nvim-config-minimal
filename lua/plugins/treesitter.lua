return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    -- Step 1: Setup nvim-treesitter (minimal config)
    require("nvim-treesitter").setup({
      -- You can set install directory if you want
      -- install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- Step 2: Install parsers you want
    local parsers = { "javascript",
				"typescript",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline" }
    require("nvim-treesitter").install(parsers)

    -- Step 3: Enable highlighting manually (this is now YOUR job!)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "lua", "vim" },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
