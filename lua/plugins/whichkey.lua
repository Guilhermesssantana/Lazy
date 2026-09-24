return {
  {
    "folke/which-key.nvim",
    priority = 1000,
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 400
    end,
    config = function()
      local wk = require("which-key")

      wk.setup({
        win = { border = "rounded" },
      })
      wk.add({
        { "<leader>f", group = "Find / Files" },
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Grep text" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Open buffers" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help docs" },
        { "<leader>fp", "<cmd>Telescope projects<CR>", desc = "Projects" },

        { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },

        { "<leader>t", group = "Tabs / Terminal" },
        { "<leader>tn", "<cmd>tabnew<CR>", desc = "New tab" },
        { "<leader>tx", "<cmd>tabclose<CR>", desc = "Close tab" },
        { "<leader>tl", "<cmd>tabnext<CR>", desc = "Next tab" },
        { "<leader>th", "<cmd>tabprevious<CR>", desc = "Previous tab" },
        { "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", desc = "Float terminal" },
        { "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", desc = "Vertical terminal" },
        { "<leader>ts", "<cmd>ToggleTerm direction=horizontal<CR>", desc = "Horizontal terminal" },

        { "<leader>l", group = "Lazy / Plugins" },
        { "<leader>lo", "<cmd>Lazy<CR>", desc = "Open Lazy UI" },
        { "<leader>lu", "<cmd>Lazy update<CR>", desc = "Update plugins" },
        { "<leader>ls", "<cmd>Lazy sync<CR>", desc = "Sync plugins" },
        { "<leader>lc", "<cmd>Lazy clean<CR>", desc = "Clean plugins" },
        { "<leader>lq", "<cmd>q<CR>", desc = "Close Lazy window" },

        { "<leader>1", "<cmd>tabnext 1<CR>", desc = "Tab 1" },
        { "<leader>2", "<cmd>tabnext 2<CR>", desc = "Tab 2" },
        { "<leader>3", "<cmd>tabnext 3<CR>", desc = "Tab 3" },
        { "<leader>4", "<cmd>tabnext 4<CR>", desc = "Tab 4" },
        { "<leader>5", "<cmd>tabnext 5<CR>", desc = "Tab 5" },
        { "<leader>6", "<cmd>tabnext 6<CR>", desc = "Tab 6" },
        { "<leader>7", "<cmd>tabnext 7<CR>", desc = "Tab 7" },
        { "<leader>8", "<cmd>tabnext 8<CR>", desc = "Tab 8" },
        { "<leader>9", "<cmd>tabnext 9<CR>", desc = "Tab 9" },

        { "<leader>r", group = "Run / Java" },
        { "<leader>rr", "<cmd>lua require('jdtls').run()<CR>", desc = "Run main class" },
        { "<leader>rt", "<cmd>lua require('jdtls').test_class()<CR>", desc = "Run test class" },
        { "<leader>rm", "<cmd>lua require('jdtls').test_nearest_method()<CR>", desc = "Run test method" },

        { "<leader>d", group = "Debug" },
        { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle breakpoint" },
        { "<leader>dB", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint: '))<CR>", desc = "Conditional break" },
        { "<leader>dc", "<cmd>DapContinue<CR>", desc = "Continue" },
        { "<leader>di", "<cmd>DapStepInto<CR>", desc = "Step into" },
        { "<leader>do", "<cmd>DapStepOver<CR>", desc = "Step over" },
        { "<leader>dO", "<cmd>DapStepOut<CR>", desc = "Step out" },
        { "<leader>dr", "<cmd>DapRestartFrame<CR>", desc = "Restart frame" },
        { "<leader>dq", "<cmd>DapTerminate<CR>", desc = "Stop debug" },
        { "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle UI" },
        { "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", desc = "Run last config" },

        { "<leader>c", group = "Code" },
        { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action" },
        { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename symbol" },
        { "<leader>cf", "<cmd>lua vim.lsp.buf.format()<CR>", desc = "Format file" },

        { "<leader>g", group = "Git" },
        { "<leader>gs", "<cmd>Git<CR>", desc = "Git status" },
        { "<leader>gc", "<cmd>Git commit<CR>", desc = "Commit" },

        { "<leader>q", group = "Quick actions" },
        { "<leader>qq", "<cmd>q<CR>", desc = "Quit" },
        { "<leader>qw", "<cmd>w<CR>", desc = "Save" },
        { "<leader>qa", "<cmd>qa<CR>", desc = "Quit all" },
      })
    end,
  },
}
