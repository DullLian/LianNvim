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
            });
        end,
    },
};
