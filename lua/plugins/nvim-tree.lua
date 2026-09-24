return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<Tab>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree", mode = "n" },
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree", mode = "n" },
    },
    config = function()
      require("nvim-tree").setup({
        disable_netrw = true,
        hijack_netrw = true,
        respect_buf_cwd = true,
        sync_root_with_cwd = true,

        view = {
          width = 30,
          side = "left",
          preserve_window_proportions = true,
          adaptive_size = false,
        },

        renderer = {
          group_empty = true,
          highlight_git = true,
          full_name = false,
          highlight_opened_files = "none",
          icons = {
            git_placement = "before",
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },

        filters = {
          dotfiles = false,
        },

        git = {
          enable = true,
          ignore = false,
        },

        actions = {
          open_file = {
            quit_on_open = false,
            window_picker = {
              enable = true,
            },
          },
        },
      })
    end,
  },
}
