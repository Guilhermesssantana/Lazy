return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "master", -- usa a API estável
    build = ":TSUpdate",
    lazy = false,

    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "html",
        "css",
        "javascript",
        "php",
        "python",
        "json",
        "markdown",
      },

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
