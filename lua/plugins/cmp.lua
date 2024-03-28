-- 定义图标
local kinds = {
    Text = "  ",
    Method = "  ",
    Function = "  ",
    Constructor = "  ",
    Field = "  ",
    Variable = "  ",
    Class = "  ",
    Interface = "  ",
    Module = "  ",
    Property = "  ",
    Unit = "  ",
    Value = "  ",
    Enum = "  ",
    Keyword = "  ",
    Snippet = "  ",
    Color = "  ",
    File = "  ",
    Reference = "  ",
    Folder = "  ",
    EnumMember = "  ",
    Constant = "  ",
    Struct = "  ",
    Event = "  ",
    Operator = "  ",
    TypeParameter = "  ",
};

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
    { "onsails/lspkind-nvim" },
    { "hrsh7th/cmp-buffer" },   -- 缓冲区源插件
    { "hrsh7th/cmp-path" },     -- 路径源插件
    { "hrsh7th/cmp-cmdline" },  -- 命令行源插
    { "L3MON4D3/LuaSnip" },     -- 代码片段引擎
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/nvim-cmp",  config = function(args)
        local cmp = require("cmp");
        local lspkind = require("lspkind");
        local luasnip = require("luasnip");
        lspkind.init({ symbol_map = kinds });
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body);
                end,
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol', -- 显示图标和文本
                    maxwidth = 100, -- 补全菜单的最大宽度
                    before = function(entry, vim_item)
                        vim_item.menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            path = "[Path]",
                            cmdline = "[Cmdline]",
                            -- 其他补全源的菜单标签...
                        })[entry.source.name] or vim_item.menu
                        return vim_item
                    end,
                })
            },
            window = {
                -- 设置补全窗口的样式为有边框
                completion = cmp.config.window.bordered(),
                -- 设置文档窗口的样式为有边框
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                -- 出现补全
                ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
                -- 取消
                ["<A-,>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close()}),
                -- 上一个
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                -- 下一个
                ["<C-j>"] = cmp.mapping.select_next_item(),
                -- 确认
                ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.None }),
                -- 下一个
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
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
