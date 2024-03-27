local keyset = vim.keymap.set;

local keys = {
    -- 左右循环切换
    prev = "<leader>bh",
    next = "<leader>bl",
    -- 关闭当前缓冲区
    close = "<leader>bc",
    -- 关闭左侧所有标签页
    close_left = "<leader>bch",
    -- 关闭右侧所有标签页
    close_right = "<leader>bal",
    -- 关闭所有其他标签页
    close_others = "<leader>bco",
};

keyset("n", keys.prev, ":BufferLineCyclePrev<CR>");
keyset("n", keys.next, ":BufferLineCycleNext<CR>");
-- "moll/vim-bbye"
keyset("n", keys.close, ":Bdelete!<CR>");
keyset("n", keys.close_left, ":BufferLineCloseLeft<CR>");
keyset("n", keys.close_right, ":BufferLineCloseRight<CR>");
keyset("n", keys.close_others, ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>");

return {
    { "akinsho/bufferline.nvim", version = "*", dependencies = { "nvim-tree/nvim-web-devicons",
        "moll/vim-bbye" },
        config = function()
            vim.opt.termguicolors = true;
            require("bufferline").setup({
                options = {
                    -- 关闭 Tab 的命令，这里使用 moll/vim-bbye 的 :Bdelete 命令
                    close_command = "Bdelete! %d",
                    right_mouse_command = "Bdelete! %d",
                    -- 侧边栏配置
                    -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
                    offsets = {
                        {
                            filetype = "NvimTree",
                            text = "NvimTree .. 📁",
                            highlight = "Directory",
                            text_align = "center",
                        },
                    },
                    -- 使用 nvim 内置 LSP
                    diagnostics = "nvim_lsp",
                    -- 可选，显示 LSP 报错图标
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                        local s = " ";
                        for e, n in pairs(diagnostics_dict) do
                            local sym = e == "error" and " " or (e == "warning" and " " or "");
                            s = s .. n .. sym;
                        end
                        return s;
                    end,
                },
            });
        end,
    },
};
