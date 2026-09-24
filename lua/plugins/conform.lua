return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },

    opts = {
      formatters_by_ft = {
        lua = { "stylua" },

        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },

        html = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },

        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },

        php = { "php_cs_fixer" },

        java = { "google-java-format" },

        python = { "black" },

        sh = { "shfmt" },
        bash = { "shfmt" },
      },

      format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      },
    },

    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({
            async = true,
            lsp_fallback = true,
          })
        end,
        desc = "Format Buffer",
      },
    },
  },
}
