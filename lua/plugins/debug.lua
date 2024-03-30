local keyset = vim.keymap.set;

keyset("n", "<A-d>",function () require("dapui").toggle() end);

local keyset = vim.keymap.set;
local opts = {noremap = true, silent = true };

-- 继续执行代码
keyset("n", "<leader>dc", "<CMD>lua require(\"dap\").continue()<CR>", opts);
-- 在当前行设置或取消断点
keyset("n", "<leader>dt", "<CMD>lua require(\"dap\").toggle_breakpoint()<CR>", opts);
-- 清除所有断点
keyset("n", "<leader>dT", "<CMD>lua require(\"dap\").clear_breakpoints()<CR>", opts);
-- 逐过程
keyset("n", "<leader>dj", "<CMD>lua require(\"dap\").step_over()<CR>", opts);
-- 跳出当前函数
keyset("n", "<leader>dk", "<CMD>lua require(\"dap\").step_out()<CR>", opts);
-- 逐步进入
keyset("n", "<leader>dl", "<CMD>lua require(\"dap\").step_into()<CR>", opts);
-- 评估表达式
keyset("n", "<leader>dh", "<CMD>lua require(\"dapui\").eval()<CR>", opts);

return {
    { "rcarriga/nvim-dap-ui",
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text"},
        config = function ()
            require("nvim-dap-virtual-text").setup();
            local dap = require("dap")
            local install_root_dir = vim.fn.stdpath("data") .. "/mason";
            local extension_path = install_root_dir .. "/packages/cpptools/extension/";
            local cpptools_path = extension_path .. "debugAdapters/bin/OpenDebugAD7";

            dap.adapters.cppdbg = {
                id = "cppdbg",
                type = "executable",
                command = cpptools_path;
            }

            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "cppdbg",
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtEntry = true,
                },
            }

            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp

            local dapui = require("dapui");
            dapui.setup({
                -- 启用行扩展，即允许在 DAP 窗口中展开多行信息
                expand_lines = true,

                -- 自定义图标，用于展开、折叠和循环依赖
                icons = { expanded = "", collapsed = "", circular = "" },

                -- 定义按键映射，指定在 DAP 窗口中的各种操作
                mappings = {
                    -- 使用一个表来应用多个映射
                    expand = { "<CR>", "<2-LeftMouse>" }, -- 展开节点的操作
                    open = "o",    -- 在编辑器中打开文件的操作
                    remove = "d",  -- 移除节点的操作
                    edit = "e",    -- 编辑节点的操作
                    repl = "r",    -- 打开 REPL 的操作
                    toggle = "t",  -- 切换节点展开状态的操作
                },

                -- 定义布局，指定 DAP 窗口的结构和排列方式
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.33 },     -- 调试作用域信息窗口
                            { id = "breakpoints", size = 0.17 },-- 断点窗口
                            { id = "stacks", size = 0.25 },     -- 调用栈窗口
                            { id = "watches", size = 0.25 },    -- 观察变量窗口
                        },
                        size = 0.33,
                        position = "right", -- 位于右侧
                    },
                    {
                        elements = {
                            { id = "repl", size = 0.45 },     -- REPL 窗口
                            { id = "console", size = 0.55 },  -- 控制台窗口
                        },
                        size = 0.27,
                        position = "bottom", -- 位于底部
                    },
                },

                -- 定义浮动窗口的样式和行为
                floating = {
                    max_height = 0.9,       -- 最大高度占屏幕的百分比
                    max_width = 0.5,        -- 最大宽度占屏幕的百分比
                    border = vim.g.border_chars, -- 边框样式，可以是"single"、"double"或"rounded"
                    mappings = {
                        close = { "q", "<Esc>" },  -- 关闭浮动窗口的操作
                    },
                },
            });
        end,
    },
    { "folke/neodev.nvim", opts =  {
        library = { plugins = { "nvim-dap-ui" }, types = true },
        ...
    }
    },
};
