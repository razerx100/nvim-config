vim.wo.number = true

vim.opt.autoindent    = true
vim.opt.autoread      = true
vim.opt.clipboard     = "unnamedplus"
vim.opt.confirm       = true
vim.opt.cursorline    = true
vim.opt.encoding      = "utf-8"
vim.opt.expandtab     = true
vim.opt.scrolloff     = 7 -- Scroll offset
vim.opt.shiftwidth    = 4 -- Indent in spaces
vim.opt.softtabstop   = 4 -- How many spaces when tab is pressed
vim.opt.tabstop       = 4 -- Tab visibility in spaces
vim.opt.termguicolors = true
vim.opt.wrap          = false

vim.cmd[[colorscheme tokyonight]]

vim.g.trouble_lualine = true

vim.diagnostic.config({ virtual_text = true })
