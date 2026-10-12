local opt = vim.opt

-- UI
opt.number = true
opt.relativenumber = false
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.wrap = false
opt.scrolloff = 4
opt.sidescrolloff = 8

-- Statusline / cmdline (kanagawa reads these on setup)
opt.laststatus = 3
opt.cmdheight = 1

-- Editing
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.undofile = true
opt.updatetime = 250
opt.timeoutlen = 400

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Search / misc
opt.incsearch = true
opt.hlsearch = true

-- 按 Esc 清除搜索高亮
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.background = "dark"
