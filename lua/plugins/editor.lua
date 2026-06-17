return {

{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
},

{
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {},
},

{
  "numToStr/Comment.nvim",
  opts = {},
},

{
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
},

{
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {},
},

{
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {},
},

}
