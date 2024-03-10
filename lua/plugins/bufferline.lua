keys = {
  -- 左右循环切换
  prev = "<C-h>",
  next = "<C-l>",
  -- 关闭当前缓冲区
  close = "<C-w>",
 -- 关闭 = "<leader>bc",
  -- 关闭左侧所有标签页
  close_left = "th",
  -- 关闭右侧所有标签页
  close_right = "tl",
  -- 关闭所有其他标签页
  close_others = "to",
  -- 关闭并选择
  close_pick = "tp",
};

vim.keymap.set("n", keys.prev, ":BufferLineCyclePrev<CR>");
vim.keymap.set("n", keys.next, ":BufferLineCycleNext<CR>");
  -- "moll/vim-bbye"
vim.keymap.set("n", keys.close, ":Bdelete!<CR>");
vim.keymap.set("n", keys.close_left, ":BufferLineCloseLeft<CR>");
vim.keymap.set("n", keys.close_right, ":BufferLineCloseRight<CR>");
vim.keymap.set("n", keys.close_others, ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>");
vim.keymap.set("n", keys.close_pick, ":BufferLinePickClose<CR>");

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
