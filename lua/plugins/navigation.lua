return {

{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
},

{
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
},

{
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
},

}
