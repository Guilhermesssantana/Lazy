return {
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",

    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()
      local jdtls = require("jdtls")

      local function attach_jdtls()
        local root_markers = {
          ".git",
          "mvnw",
          "gradlew",
          "pom.xml",
          "build.gradle",
        }

        local root_dir = require("jdtls.setup").find_root(root_markers)
        if not root_dir then
          return
        end

        local workspace_dir = vim.fn.stdpath("data")
          .. "/jdtls-workspace/"
          .. vim.fn.fnamemodify(root_dir, ":p:h:t")

        local bundles = {}

        vim.list_extend(
          bundles,
          vim.split(
            vim.fn.glob(
              vim.fn.stdpath("data")
                .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
              true
            ),
            "\n"
          )
        )

        vim.list_extend(
          bundles,
          vim.split(
            vim.fn.glob(
              vim.fn.stdpath("data")
                .. "/mason/packages/java-test/extension/server/*.jar",
              true
            ),
            "\n"
          )
        )

        jdtls.start_or_attach({
          cmd = {
            "jdtls",
            "-data",
            workspace_dir,
          },

          root_dir = root_dir,

          capabilities = require("cmp_nvim_lsp").default_capabilities(),

          init_options = {
            bundles = bundles,
          },

          settings = {
            java = {
              configuration = {
                runtimes = {
                  {
                    name = "JavaSE-21",
                    path = "/usr/lib/jvm/java-21-openjdk",
                    default = true,
                  },
                },
              },
            },
          },

          on_attach = function(client, bufnr)
            vim.notify("JDTLS iniciado!", vim.log.levels.INFO)

            jdtls.setup_dap({ hotcodereplace = "auto" })
            jdtls.setup.add_commands()

            local opts = { buffer = bufnr, silent = true }

            -- LSP
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

            -- Java
            vim.keymap.set("n", "<leader>rj", jdtls.run, {
              buffer = bufnr,
              desc = "Run Java Main",
            })

            vim.keymap.set("n", "<leader>tc", jdtls.test_class, {
              buffer = bufnr,
              desc = "Test Class",
            })

            vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, {
              buffer = bufnr,
              desc = "Test Method",
            })
          end,
        })
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = attach_jdtls,
      })
    end,
  },
}



























-- return {
--   "mfussenegger/nvim-jdtls",
--   dependencies = {
--     "williamboman/mason.nvim",
--     "mfussenegger/nvim-dap",           -- Debug
--     "rcarriga/nvim-dap-ui",            -- Interface do debug
--     "nvim-neotest/nvim-nio",
--   },
--   ft = "java",
--
--   config = function()
--     local jdtls = require("jdtls")
--     local dap = require("dap")
--
--     local function attach_jdtls()
--       local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
--       local root_dir = require("jdtls.setup").find_root(root_markers)
--
--       jdtls.start_or_attach({
--         cmd = { "jdtls" },
--         root_dir = root_dir,
--
--         capabilities = require("cmp_nvim_lsp").default_capabilities(),
--
--         settings = {
--           java = {
--             configuration = {
--               runtimes = {
--                 {
--                   name = "JavaSE-17",
--                   path = "/usr/lib/jvm/java-17-openjdk",
--                   default = true,
--                 },
--               },
--             },
--           },
--         },
--
--         on_attach = function(client, bufnr)
--           vim.notify("JDTLS + Debug carregado", vim.log.levels.INFO)
--         end,
--       })
--     end
--
--     vim.api.nvim_create_autocmd("FileType", {
--       pattern = "java",
--       callback = attach_jdtls,
--     })
--   end,
-- }
