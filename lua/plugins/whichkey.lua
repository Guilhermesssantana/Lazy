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
  -- Run
 
        { "<leader>r", group = "Run" },
  
        { "<leader>rr", "<cmd>lua require('jdtls').run()<CR>", desc = "Run Main Class" },
  
        { "<leader>rt", "<cmd>lua require('jdtls').test_class()<CR>", desc = "Run Test Class" },
 
        { "<leader>rm", "<cmd>lua require('jdtls').test_nearest_method()<CR>", desc = "Run Test Method" },

  -- Debug
  
        { "<leader>d", group = "Debug" },

        { "<leader>db", "<cmd>DapToggleBreakpoint<CR>", desc = "Toggle Breakpoint" },
  
        { "<leader>dB", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint: '))<CR>", desc = "Conditional Breakpoint" },
  
        { "<leader>dc", "<cmd>DapContinue<CR>", desc = "Continue" },
  
        { "<leader>dr", "<cmd>DapRestartFrame<CR>", desc = "Restart Frame" },
  
        { "<leader>dq", "<cmd>DapTerminate<CR>", desc = "Terminate" },
  
        { "<leader>di", "<cmd>DapStepInto<CR>", desc = "Step Into" },
  
        { "<leader>do", "<cmd>DapStepOver<CR>", desc = "Step Over" },
  
        { "<leader>dO", "<cmd>DapStepOut<CR>", desc = "Step Out" },
  
        { "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", desc = "Toggle UI" },
  
        { "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", desc = "Run Last" },

      })
    end,
  },
}
