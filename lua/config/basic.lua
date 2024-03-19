-- utf8
vim.g.encoding = "UTF-8";
vim.o.fileencoding = "utf-8";
-- jkhl 移动时光标周围保留8行
vim.o.scrolloff = 8;
vim.o.sidescrolloff = 8;
-- 使用相对行号
vim.wo.number = true;
vim.wo.relativenumber = true;
-- 高亮所在行
vim.wo.cursorline = true;
-- 缩进 4 个空格等于一个Tab
vim.o.tabstop = 4;
vim.bo.tabstop = 4;
vim.o.softtabstop = 4;
vim.o.shiftround = true;
-- >> << 时移动长度
vim.o.shiftwidth = 4;
vim.bo.shiftwidth = 4;
-- 空格替代tab
vim.o.expandtab = true;
vim.bo.expandtab = true;
-- 新行对齐当前行
vim.o.autoindent = true;
vim.bo.autoindent = true;
vim.o.smartindent = true;
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true;
vim.o.smartcase = true;
-- 搜索不要高亮
vim.o.hlsearch = false;
-- 边输入边搜索
vim.o.incsearch = true;
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 2;
-- 当文件被外部程序修改时，自动加载
-- vim.o.autoread = true
-- vim.bo.autoread = true
-- 禁止折行
vim.wo.wrap = false;
-- 光标在行首尾时<Left><Right>可以跳到下一行
-- vim.o.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
-- vim.o.hidden = true
-- 鼠标支持
vim.o.mouse = "a";
-- 禁止创建备份文件
vim.o.backup = false;
vim.o.writebackup = false;
vim.o.swapfile = false;
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500;
