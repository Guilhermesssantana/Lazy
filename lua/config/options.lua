vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    vim.cmd("tabnext " .. i)
  end, { desc = "Go to tab " .. i, silent = true })
end

vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "New tab", silent = true })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab", silent = true })
vim.keymap.set("n", "<leader>tl", "<cmd>tabnext<CR>", { desc = "Next tab", silent = true })
vim.keymap.set("n", "<leader>th", "<cmd>tabprevious<CR>", { desc = "Previous tab", silent = true })

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
