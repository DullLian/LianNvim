return {
    { "ahmedkhalf/project.nvim" },
    { "nvimdev/dashboard-nvim", event = "VimEnter", dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require('dashboard').setup({
                theme = "doom",
                config = { 
                    header = {
                        [[]],
                        [[]],
                        [[██╗     ██╗ █████╗ ███╗   ██╗███╗   ██╗██╗   ██╗██╗███╗   ███╗]],
                        [[██║     ██║██╔══██╗████╗  ██║████╗  ██║██║   ██║██║████╗ ████║]],
                        [[██║     ██║███████║██╔██╗ ██║██╔██╗ ██║██║   ██║██║██╔████╔██║]],
                        [[██║     ██║██╔══██║██║╚██╗██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
                        [[███████╗██║██║  ██║██║ ╚████║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║]],
                        [[╚══════╝╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
                        [[]],
                        [[]],
                    },
                    center = { 
                        {
                            -- 图标，显示在描述旁边。
                            icon = "  ",
                            -- 描述文本，通常用于说明图标或快捷键的功能。
                            desc = "Projects 收藏                   ",
                            -- 快捷键，用于在仪表板缓冲区中触发某个动作，注意这不是普通意义上的键映射。
                            key = "h",
                            -- 当用户触发快捷键时执行
                            action = "Telescope projects",
                        },
                        {
                            icon = "  ",
                            desc = "Recently files 最近打开         ",
                            key = "j",
                            action = "Telescope oldfiles",
                        },
                    },
                },
            });
        end,
    },
};

