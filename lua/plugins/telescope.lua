-- telescope
-- 查找文件
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>");
-- 全局搜索
vim.keymap.set("n", "<C-f>", ":Telescope live_grep<CR>");

return {
    { "nvim-telescope/telescope.nvim", tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require("telescope").setup({
                defaults = {
                    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
                    initial_mode = "insert",
                    -- 窗口内快捷键
                    mappings = {
                        i = {
                            -- 上下移动
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                            -- 关闭窗口
                            ["<C-c>"] = "close",
                            -- 预览窗口上下滚动
                            ["<C-u>"] = "preview_scrolling_up",
                            ["<C-d>"] = "preview_scrolling_down",
                        },
                    },
                },
            });
        end,
    },
};
