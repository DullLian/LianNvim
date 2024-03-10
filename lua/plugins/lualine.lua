return {
    { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require('lualine').setup({
                -- 配置选项
                options = {
                    -- 是否启用图标
                    icons_enabled = true,
                    -- 主题，'auto' 表示自动检测
                    theme = "catppuccin",
                    -- 组件分隔符，左侧和右侧的字符
                    component_separators = "",
                    -- 区域分隔符，左侧和右侧的字符
                    section_separators = { left = "", right = "" },
                    -- 对于状态栏，哪些文件类型不显示
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    -- 忽略哪些窗口的焦点变化
                    ignore_fous = {},
                    -- 是否始终在中间部分分割
                    always_divide_middle = true,
                    -- 是否全局状态栏
                    globalstatus = true,
                    -- 刷新时间设置
                    refresh = {
                        statusline = 1000, -- 状态栏每1000毫秒刷新一次
                        tabline = 1000,    -- 标签栏每1000毫秒刷新一次
                        winbar = 1000,     -- 窗口栏每1000毫秒刷新一次
                    }
                },
                -- 状态栏的各个部分
                sections = {
                    -- 左侧部分
                    lualine_a = { { 'mode', separator = { left = "" }, right_padding = 2 } },
                    -- 中间部
                    lualine_b = {"branch", "diff", "diagnostics"}, -- 显示分支、差异和诊断信息
                    lualine_c = {"filename"}, -- 显示文件名
                    -- 右侧部分
                    lualine_x = {"encoding", "fileformat", "filetype"}, -- 显示编码、文件格式和文件类型
                    lualine_y = {"progress"}, -- 显示进度（例如异步任务进度）
                    lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } } -- 显示位置信息（行号、列号）
                },
                -- 非活动窗口的状态栏部分
                inactive_sections = {
                    lualine_a = {}, -- 非活动窗口不显示
                    lualine_b = {}, -- 非活动窗口不显示
                    lualine_c = {"filename"}, -- 非活动窗口只显示文件名
                    lualine_x = {"location"}, -- 非活动窗口显示位置信息
                    lualine_y = {}, -- 非活动窗口不显示
                    lualine_z = {} -- 非活动窗口不显示
                },
                -- 标签页的配置
                tabline = {},
                -- 窗口栏的配置
                winbar = {},
                -- 非活动窗口栏的配置
                inactive_winbar = {},
                -- 扩展配置
                extensions = { "nvim-tree", "toggleterm" },
        });
    end,
    }
};
