return {
    {"sindrets/winshift.nvim", config = function()
        require("winshift").setup({  -- 调用 winshift 插件的 setup 函数来配置插件
            highlight_moving_win = true,  -- 设置为 true 时，移动窗口时高亮显示
            focused_hl_group = "Visual",  -- 设置移动窗口时使用的高亮组为 "Visual"
            moving_win_options = {  -- 移动窗口时应用的局部选项
                wrap = false,  -- 移动窗口时不允许折行
                cursorline = false,  -- 移动窗口时不显示当前行光标
                cursorcolumn = false,  -- 移动窗口时不显示当前列光标
                colorcolumn = "",  -- 移动窗口时不显示颜色列
            },
            keymaps = {  -- 设置键映射
                disable_defaults = false, -- 设置为 false 时，使用默认的键映射
                win_move_mode = {  -- 移动窗口模式下的键映射
                    ["h"] = "left",  -- h 键映射到向左移动
                    ["j"] = "down",  -- j 键映射到向下移动
                    ["k"] = "up",  -- k 键映射到向上移动
                    ["l"] = "right",  -- l 键映射到向右移动
                    -- 更多键映射...
                },
            },
            window_picker = function()  -- 设置一个函数，用于选择窗口
                return require("winshift.lib").pick_window({  -- 调用 pick_window 函数来选择窗口
                    picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",  -- 设置窗口选择器使用的字符
                    filter_rules = {  -- 设置窗口选择器的过滤规则
                        cur_win = true,  -- 过滤掉当前窗口
                        floats = true,  -- 过滤掉浮动窗口
                        filetype = {},  -- 过滤掉指定文件类型的窗口
                        buftype = {},   -- 过滤掉指定缓冲区类型的窗口
                        bufname = {},   -- 过滤掉匹配指定正则表达式的缓冲区名称的窗口
                    },
                    filter_func = nil,  -- 设置一个函数，用于进一步过滤可选择的窗口列表
                });
            end,
        });

    end,
    },
};
