return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header (você pode mudar o texto)
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Botões
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find File", ":Telescope find_files<CR>"),
      dashboard.button("g", "󰊄  Live Grep", ":Telescope live_grep<CR>"),
      dashboard.button("r", "󱋡  Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("p", "  Projects", ":Telescope projects<CR>"), -- se tiver plugin de projects
      dashboard.button("c", "  Config", ":e ~/.config/nvim/<CR>"),
      dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
    }

    -- Rodapé
    dashboard.section.footer.val = "Custom by GsDev$"

    alpha.setup(dashboard.opts)

    -- Desativa o folding na tela inicial
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
