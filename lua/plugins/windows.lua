local function cmd(command)
    return table.concat({ "<Cmd>", command, "<CR>" });
end
-- 最大化窗口
vim.keymap.set("n", "<leader>wz", cmd("WindowsMaximize"));
-- 垂直最大化当前窗口的宽度。
vim.keymap.set("n", "<leader>w_", cmd("WindowsMaximizeVertically"));
-- 水平最大化当前窗口的高度。
vim.keymap.set("n", "<leader>w|", cmd("WindowsMaximizeHorizontally"));
-- 使所有窗口的高度和宽度相等。
vim.keymap.set("n", "<leader>w=", cmd("WindowsEqualize"));

return {
    { "anuvyklack/windows.nvim",
        dependencies  = {
            "anuvyklack/middleclass",
            "anuvyklack/animation.nvim",
        },
        config = function()
            vim.o.winwidth = 10;
            vim.o.winminwidth = 10;
            vim.o.equalalways = false;
            require("windows").setup();
        end,
    },
};
