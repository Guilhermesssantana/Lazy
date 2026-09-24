return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
        ui = { border = "rounded" },
      })
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      local servers = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "intelephense",
        "tailwindcss",
        "emmet_ls",
      }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = {
        "lua_ls",
        "ts_ls",
        "html",
        "cssls",
        "intelephense",
        "tailwindcss",
        "emmet_ls",
      }

      for _, server in ipairs(servers) do
        local config = {
          capabilities = capabilities,
          on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, silent = true }

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          end,
        }

        if server == "emmet_ls" then
          config.filetypes = {
            "html",
            "css",
            "scss",
            "sass",
            "javascriptreact",
            "typescriptreact",
            "javascript",
            "typescript",
            "vue",
            "svelte",
            "markdown",
          }
        end

        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
}
