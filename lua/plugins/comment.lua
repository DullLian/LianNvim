return {
    {"numToStr/Comment.nvim", config = function()
        require("Comment").setup({
            -- 在注释符号和文本之间添加空格
            padding = true,
            -- 注释时是否保持光标位置不变
            sticky = true,
            -- 在注释时忽略的行，不进行注释操作
            ignore = nil,
            -- NORMAL模式下的切换注释的快捷键
            toggler = {
                -- 行注释的切换快捷键
                line = "gcc",
                -- 块注释的切换快捷键
                block = "gbc",
            },
            -- NORMAL和VISUAL模式下的操作符等待模式下的快捷键
            opleader = {
                -- 行注释的快捷键
                line = "gc",
                -- 块注释的快捷键
                block = "gb",
            },
            -- 额外的快捷键映射
            extra = {
                -- 在光标上方添加注释
                above = "gcO",
                -- 在光标下方添加注释
                below = "gco",
                -- 在行尾添加注释
                eol = "gcA",
            },
            -- 启用快捷键映射
            -- 注意：如果设置为false，插件不会创建任何映射
            mappings = {
                -- 启用基本操作符等待模式映射，如 'gcc' 'gbc' 'gc[count]{motion}' 'gb[count]{motion}'
                basic = true,
                -- 启用额外映射，如 'gco', 'gcO', 'gcA'
                extra = true,
            },
            -- 注释前调用的函数
            pre_hook = nil,
            -- 注释后调用的函数
            post_hook = nil,
        });
    end,
    },
};
