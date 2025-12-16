return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        local actions = require('telescope.actions')
        local action_state = require('telescope.actions.state')

        vim.keymap.set('n', '<leader> ', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
        vim.keymap.set('n', '<C-P>', builtin.git_files, { desc = 'Git files' })
        
        -- Helper function to open marks with delete capability
        local function open_marks_picker()
            builtin.marks({
                attach_mappings = function(prompt_bufnr, map)
                    local delete_mark = function()
                        local selection = action_state.get_selected_entry()
                        if selection then
                            -- Extract just the mark character
                            local mark = selection.mark or selection.ordinal:match("^%s*(%S)")
                            
                            if mark and mark:match("^[a-zA-Z0-9'`\"]$") then
                                local bufnr = selection.bufnr
                                
                                actions.close(prompt_bufnr)
                                
                                vim.schedule(function()
                                    -- Delete the mark
                                    if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
                                        vim.api.nvim_buf_call(bufnr, function()
                                            pcall(vim.cmd, 'delmarks ' .. mark)
                                        end)
                                    else
                                        pcall(vim.cmd, 'delmarks ' .. mark)
                                    end
                                    
                                    print("Deleted mark: " .. mark)
                                    
                                    -- Reopen the picker
                                    open_marks_picker()
                                end)
                            else
                                print("Could not extract mark from selection")
                            end
                        end
                    end
                    
                    -- Delete in insert mode with <C-d>
                    map('i', '<C-d>', delete_mark)
                    
                    -- Delete in normal mode with dd
                    map('n', 'dd', delete_mark)
                    
                    return true
                end,
            })
        end
        
        -- Custom marks with delete functionality
        vim.keymap.set('n', "'", open_marks_picker, { desc = 'Telescope marks' })
    end
}
