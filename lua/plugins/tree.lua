keys = {
  -- 快捷键映射集合
  toggle = "<A-m>", -- 打开/关闭文件树 | Alt + m
  refresh = "R", -- 刷新文件树 | R
  -- 打开/关闭文件或文件夹的快捷键映射
  edit = "o", -- 打开文件或文件夹 | o
  close = "<BS>", -- 关闭父文件夹 | 退格键 Backspace
  system_open = "<CR>", -- 使用系统默认应用打开文件 | 回车键 Enter
  vsplit = "sv", -- 垂直分割窗口并打开文件 | Shift + v
  split = "sh", -- 水平分割窗口并打开文件 | Shift + h
  tabnew = "st", -- 在新标签页中打开文件 | Shift + t
  -- 移动到父目录或兄弟目录的快捷键映射
  parent_node = "P", -- 移动到父目录 | P
  first_sibling = "K", -- 移动到第一个兄弟节点 | K
  last_sibling = "J", -- 移动到最后一个兄弟节点 | J
  cd = ">", -- 切换到子目录 | 箭头键右 >
  dir_up = "<", -- 返回上一级目录 | 箭头键左 <
  -- 文件过滤的快捷键映射
  toggle_git_ignored = "i", -- 切换 Git 忽略的文件显示 | i
  toggle_dotfiles = ".", -- 切换点文件显示 | .
  toggle_custom = "u", -- 切换自定义配置的文件显示 | u
  -- 文件操作的快捷键映射
  create = "a", -- 创建新文件 | a
  remove = "d", -- 删除文件 | d
  rename = "r", -- 重命名文件 | r
  cut = "x", -- 剪切文件 | x
  copy = "c", -- 复制文件 | c
  paste = "p", -- 粘贴文件 | p
  copy_name = "y", -- 复制文件名 | y
  copy_path = "Y", -- 复制文件路径 | Y
  copy_absolute_path = "gy", -- 复制绝对路径 | g + y
  toggle_file_info = "gh", -- 显示文件信息 | g + h
};

-- 映射按键控制tree的打开与关闭
vim.keymap.set("n", keys.toggle, "<CMD>NvimTreeToggle<CR>");

local function on_attach(bufnr)
    local api = require("nvim-tree.api");
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true };
    end
    vim.keymap.set("n", keys.refresh, api.tree.reload, opts("Refresh"));
    -- 打开 / 关闭 --
    vim.keymap.set("n", keys.edit, api.node.open.edit, opts("Open"));
    vim.keymap.set("n", keys.close, api.node.navigate.parent_close, opts("Close Directory"));
    vim.keymap.set("n", keys.system_open, api.node.run.system, opts("Run System"));
    vim.keymap.set("n", keys.vsplit, api.node.open.vertical, opts("Open: Vertical Split"));
    vim.keymap.set("n", keys.split, api.node.open.horizontal, opts("Open: Horizontal Split"));
    vim.keymap.set("n", keys.tabnew, api.node.open.tab, opts("Open: New Tab"));
    -- 移动 --
    vim.keymap.set("n", keys.parent_node, api.node.navigate.parent, opts("Parent Directory"));
    vim.keymap.set("n", keys.last_sibling, api.node.navigate.sibling.last, opts("Last Sibling"));
    vim.keymap.set("n", keys.first_sibling, api.node.navigate.sibling.first, opts("First Sibling"));
    vim.keymap.set("n", keys.cd, api.tree.change_root_to_node, opts("CD"));
    vim.keymap.set("n", keys.dir_up, api.tree.change_root_to_parent, opts("Up"));
    -- 文件切换 --
    vim.keymap.set("n", keys.toggle_git_ignored, api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"));
    vim.keymap.set("n", keys.toggle_dotfiles, api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"));
    vim.keymap.set("n", keys.toggle_custom, api.tree.toggle_custom_filter, opts("Toggle Hidden"));
    -- 文件操作 --
    vim.keymap.set("n", keys.create, api.fs.create, opts("Create"));
    vim.keymap.set("n", keys.remove, api.fs.remove, opts("Delete"));
    vim.keymap.set("n", keys.rename, api.fs.rename, opts("Rename"));
    vim.keymap.set("n", keys.copy, api.fs.copy.node, opts("Copy"));
    vim.keymap.set("n", keys.cut, api.fs.cut, opts("Cut"));
    vim.keymap.set("n", keys.paste, api.fs.paste, opts("Paste"));
    vim.keymap.set("n", keys.copy_name, api.fs.copy.filename, opts("Copy Name"));
    vim.keymap.set("n", keys.copy_path, api.fs.copy.relative_path, opts("Copy Relative Path"));
    vim.keymap.set("n", keys.copy_absolute_path, api.fs.copy.absolute_path, opts("Copy Absolute Path"));
    vim.keymap.set("n", keys.toggle_file_info, api.node.show_info_popup, opts("Info"));
  end

return {
    { "nvim-tree/nvim-tree.lua", version = "*", lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            -- 禁用默认的netrw
            vim.g.loaded_netrw = 1;
            -- 禁用netrw 相关的插件不会加载
            vim.g.loaded_netrwPlugin = 1;
            -- 启用24位颜色
            vim.opt.termguicolors = true;
            require("nvim-tree").setup({
                on_attach = on_attach,
                update_focused_file = {
                    enable = true,
                    update_root = true,
                },
                git = {
                    enable = true,
                    ignore = true,
                },
                view = {
                    width = 30,
                    -- 是否在文件树中显示行号
                    number = true,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = true,
                },
            });
            -- 自动关闭
            vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif");
        end,
    },
};
