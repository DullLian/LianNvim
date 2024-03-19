servers = { 
    "clangd", -- c/cpp
    "gopls", -- go
    "lua_ls", -- lua
    "vimls", -- vim
    "cssls", -- css
    "html", -- html
    "jsonls", -- json
    "tsserver", -- ts
    "eslint", -- js
    "sqlls", -- sql
    "rust_analyzer", -- rust
    "jdtls", -- java
    "phpactor", -- php
    "volar", -- vue
    "lemminx", -- xml
    "pyright", -- python
    "bashls", -- shell
};

-- 设置键映射以使用 LSP 功能
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true });
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { silent = true });
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true });

return {
    { "neovim/nvim-lspconfig"},
    { "hrsh7th/cmp-nvim-lsp" },
    { "williamboman/mason.nvim", config = function()
            require("mason").setup({
               -- 用户界面相关配置
                ui = {
                    check_outdated_packages_on_open = true, -- 打开 Mason 界面时是否检查过时的包
                    border = "none", -- 界面边框样式
                    width = 0.8, -- 界面宽度（可以是整数或 0-1 之间的浮点数）
                    height = 0.9, -- 界面高度（可以是整数或 0-1 之间的浮点数）
                    icons = {
                        package_installed = "✓", -- 已安装包的图标
                        package_pending = "➜", -- 待安装或正在安装的包的图标
                        package_uninstalled = "✗", -- 未安装包的图标
                    },
                    keymaps = {
                        toggle_package_expand = "<CR>", -- 切换包展开的键映射
                        install_package = "i", -- 安装当前光标下包的键映射
                        update_package = "u", -- 更新当前光标下包的键映射
                        check_package_version = "c", -- 检查当前光标下包的新版本的键映射
                        update_all_packages = "U", -- 更新所有包的键映射
                        check_outdated_packages = "C", -- 检查所有过时包的键映射
                        uninstall_package = "X", -- 卸载当前光标下包的键映射
                        cancel_installation = "<C-c>", -- 取消安装过程的键映射
                        apply_language_filter = "<C-f>", -- 应用语言过滤器的键映射
                        toggle_package_install_log = "<CR>", -- 切换包安装日志的键映射
                        toggle_help = "g?", -- 切换帮助视图的键映射
                    },
                },
            });
    end,
    },
    {"williamboman/mason-lspconfig.nvim", config = function()
        require("mason-lspconfig").setup({
            -- 确保安装的 LSP 服务器列表
            ensure_installed = servers, -- 这里列出你希望确保安装的 LSP 服务器
            -- 自动安装缺失的 LSP 服务器
             automatic_installation = true,
        });
        local capabilities = require("cmp_nvim_lsp").default_capabilities();
        local lspconfig = require("lspconfig");
        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({
                capabilities = capabilities,
            });
        end
    end,
    },
};
