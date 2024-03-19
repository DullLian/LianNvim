return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000,
        config = function()
            -- 设置该主题的配置
            require("catppuccin").setup({
                flavour = "mocha", -- 可选值：latte、frappe、macchiato、mocha
                background = { -- :h background
                    light = "latte", -- 亮色模式的背景色
                    dark = "mocha",  -- 暗色模式的背景色
                },
                transparent_background = true, -- 禁用设置背景颜色
                show_end_of_buffer = false, -- 在缓冲区末尾显示 '~' 字符
                term_colors = false, -- 设置终端颜色（例如 `g:terminal_color_0`）
                dim_inactive = {
                    enabled = false, -- 使非活动窗口的背景色变暗
                    shade = "dark",  -- 要应用于非活动窗口的阴影颜色
                    percentage = 0.15, -- 应用于非活动窗口的阴影百分比
                },
                no_italic = false, -- 强制不使用斜体
                no_bold = false,    -- 强制不使用粗体
                no_underline = false, -- 强制不使用下划线
                styles = { -- 处理一般 hi 组的样式（参见`:h highlight-args`）：
                    comments = { "italic" }, -- 改变注释的样式
                    conditionals = { "italic" }, -- 改变条件语句的样式
                    loops = {}, -- 循环语句的样式
                    functions = {}, -- 函数的样式
                    keywords = {},  -- 关键字的样式
                    strings = {},   -- 字符串的样式
                    variables = {}, -- 变量的样式
                    numbers = {},   -- 数字的样式
                    booleans = {},  -- 布尔值的样式
                    properties = {},-- 属性的样式
                    types = {},     -- 类型的样式
                    operators = {}, -- 操作符的样式
                    -- miscs = {},  -- 取消注释以关闭硬编码的样式
                },
                color_overrides = {},
                custom_highlights = {},
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true, -- 启用 Mini 窗口
                        indentscope_color = "", -- 缩进范围的颜色
                    },
                },
            });
            -- 在加载之前必须调用 setup
            vim.cmd.colorscheme "catppuccin";
        end
    },
};
