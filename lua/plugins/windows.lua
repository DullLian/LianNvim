local function cmd(command)
    return table.concat({ "<Cmd>", command, "<CR>" });
end
vim.keymap.set("n", "<C-c>z", cmd "WindowsMaximize");
vim.keymap.set("n", "<C-c>_", cmd "WindowsMaximizeVertically");
vim.keymap.set("n", "<C-c>|", cmd "WindowsMaximizeHorizontally");
vim.keymap.set("n", "<C-c>=", cmd "WindowsEqualize");

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
