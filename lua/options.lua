vim.cmd("colorscheme tokyonight-night")

vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 15

vim.opt.wrap = false

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.opt.signcolumn = "yes"

vim.keymap.set('n', "H", "<cmd>bprev<CR>", { desc = "Move to the prev buffer" })
vim.keymap.set('n', "L", "<cmd>bnext<CR>", { desc = "Move to the next buffer" })


-- If you want icons for diagnostic errors, you'll need to define them somewhere:
vim.fn.sign_define("DiagnosticSignError", {text = " ", texthl = "DiagnosticSignError"})
vim.fn.sign_define("DiagnosticSignWarn", {text = " ", texthl = "DiagnosticSignWarn"})
vim.fn.sign_define("DiagnosticSignInfo", {text = " ", texthl = "DiagnosticSignInfo"})
vim.fn.sign_define("DiagnosticSignHint", {text = "󰌵", texthl = "DiagnosticSignHint"})

