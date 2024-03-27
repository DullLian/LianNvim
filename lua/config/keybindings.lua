-- 这里只存放不是插件的映射
-- 设置 leader 键为空格
vim.g.mapleader = " ";
local otps = { noremap = true, silent = true };
local keyset = vim.keymap.set;
keyset("n", "<Space>", "<Nop>", { noremap = true });
-- 复制到系统剪切板
keyset("v", "<C-y>", "\"+y", otps);
