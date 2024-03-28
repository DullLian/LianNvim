local keyset = vim.keymap.set;
local otps = { noremap = true, silent = true };
keyset("n", "<A-o>", "<CMD>SymbolsOutline<CR>", otps);

return {
    { "simrat39/symbols-outline.nvim", config = function()
        require("symbols-outline").setup({
            highlight_hovered_item = true, -- 高亮鼠标悬停的条目
            show_guides = true, -- 显示引导线
            auto_preview = false, -- 不自动预览
            position = 'right', -- 位置在右侧
            relative_width = true, -- 宽度是相对的
            width = 25, -- 宽度为 25
            auto_close = false, -- 不自动关闭
            show_numbers = false, -- 不显示行号
            show_relative_numbers = false, -- 不显示相对行号
            show_symbol_details = true, -- 显示符号详情
            auto_unfold_hover = true, -- 鼠标悬停时自动展开
            fold_markers = { "", "" }, -- 折叠标记
            wrap = false, -- 不换行
            keymaps = { -- 定义快捷键映射
                close = {"<Esc>", "q"}, -- 关闭窗口的快捷键是 Esc 或 q
                goto_location = "<Cr>", -- 跳转到位置的快捷键是回车
                focus_location = "o", -- 聚焦位置的快捷键是 o
                hover_symbol = "<C-space>", -- 悬停符号的快捷键是 Ctrl+Space
                toggle_preview = "K", -- 切换预览的快捷键是 K
                rename_symbol = "r", -- 重命名符号的快捷键是 r
                code_actions = "a", -- 代码操作的快捷键是 a
                fold = "h", -- 折叠的快捷键是 h
                unfold = "l", -- 展开的快捷键是 l
                fold_all = "W", -- 全部折叠的快捷键是 W
                unfold_all = "E", -- 全部展开的快捷键是 E
                fold_reset = "R", -- 重置折叠的快捷键是 R
            },
            lsp_blacklist = {}, -- LSP 黑名单，为空表示没有禁用的 LSP
            symbol_blacklist = {}, -- 符号黑名单，为空表示没有禁用的符号
            symbols = {
                File = { icon = "", hl = "@text.uri" },
                Module = { icon = "", hl = "@namespace" },
                Namespace = { icon = "", hl = "@namespace" },
                Package = { icon = "", hl = "@namespace" },
                Class = { icon = "", hl = "@type" },
                Method = { icon = "ƒ", hl = "@method" },
                Property = { icon = "", hl = "@method" },
                Field = { icon = "", hl = "@field" },
                Constructor = { icon = "", hl = "@constructor" },
                Enum = { icon = "ℰ", hl = "@type" },
                Interface = { icon = "", hl = "@type" },
                Function = { icon = "", hl = "@function" },
                Variable = { icon = "", hl = "@constant" },
                Constant = { icon = "", hl = "@constant" },
                String = { icon = "𝓐", hl = "@string" },
                Number = { icon = "#", hl = "@number" },
                Boolean = { icon = "⊨", hl = "@boolean" },
                Array = { icon = "", hl = "@constant" },
                Object = { icon = "⦿", hl = "@type" },
                Key = { icon = "󰌆", hl = "@type" },
                Null = { icon = "NULL", hl = "@type" },
                EnumMember = { icon = "", hl = "@field" },
                Struct = { icon = "𝓢", hl = "@type" },
                Event = { icon = "", hl = "@type" },
                Operator = { icon = "+", hl = "@operator" },
                TypeParameter = { icon = "𝙏", hl = "@parameter" },
                Component = { icon = "󰡀", hl = "@function" },
                Fragment = { icon = "", hl = "@constant" },
            },
        });
    end,
    },
};
