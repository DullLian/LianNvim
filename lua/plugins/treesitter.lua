-- 开启 Folding 模块
vim.opt.foldmethod = "expr";
vim.opt.foldexpr = "nvim_treesitter#foldexpr()";
-- 默认不要折叠
vim.opt.foldlevel = 99;
return {
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
        config = function () 
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "go",
                    "lua", "vim",
                    "cpp",
                    "css", "html", "json", "javascript", "typescript",
                    "sql",
                    "rust",
                    "diff",
                    "java",
                    "php",
                    "vue",
                    "xml",
                    "python",
                    "bash",
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
                -- 启用增量选择模块
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<CR>",
                        node_incremental = "<CR>",
                        node_decremental = "<BS>",
                        scope_incremental = "<TAB>",
                    },
                },
                -- 启用代码缩进模块 (=)
                indent = {
                    enable = true,
                },
            });
        end,
    },
};
