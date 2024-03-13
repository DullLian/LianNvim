return {
    { "hrsh7th/cmp-buffer" },   -- 缓冲区源插件
    { "hrsh7th/cmp-path" },     -- 路径源插件
    { "hrsh7th/cmp-cmdline" },  -- 命令行源插件
    { "hrsh7th/nvim-cmp",  config = function()
        local cmp = require("cmp");
        cmp.setup({
            snippet = {
                -- 设置代码片段的扩展函数
                expand = function(args)
                    -- 如果您使用vsnip，使用vsnip#anonymous函数来扩展代码片段
                    -- vim.fn["vsnip#anonymous"](args.body);
                    -- 如果您使用luasnip，取消注释以下行
                    -- require('luasnip').lsp_expand(args.body)
                    -- 如果您使用snippy，取消注释以下行
                    -- require('snippy').expand_snippet(args.body)
                    -- 如果您使用ultisnips，取消注释以下行
                    -- vim.fn["UltiSnips#Anon"](args.body)
                end,
            },
            window = {
                -- 设置补全窗口的样式为有边框
                completion = cmp.config.window.bordered(),
                -- 设置文档窗口的样式为有边框
                -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                -- 设置向下滚动文档的按键映射
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                -- 设置向上滚动文档的按键映射
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                -- 设置触发补全的按键映射
                ['<C-Space>'] = cmp.mapping.complete(),
                -- 设置取消补全的按键映射
                ['<C-e>'] = cmp.mapping.abort(),
                -- 设置确认选择的补全项的按键映射
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                -- 添加LSP源
                { name = "nvim_lsp" },
                { name = "cmdline" },
                { name = "path" },
                -- 添加缓冲区源
                { name = "buffer" },
            }),
        });
    end,
    },
};
