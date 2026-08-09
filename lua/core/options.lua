-- ✅ TODO esto va en core/
-- Son opciones NATIVAS de Neovim

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.mouse = "a"

-- Colocando una fuente (solo sirve en interfaces en terminales nop)
vim.opt.guifont = "JetBrainsMono Nerd Font:h90:l"

-- La columna para mostrar los errores siempre estara ahi
vim.opt.signcolumn = "yes"

-- Permitir archivos de configuracion locales por proyecto (.nvim.lua)
vim.opt.exrc = true
vim.opt.secure = true -- Pregunta antes de ejecutar .nvim.lua desconocido

-- Borde derecho para saber cuando toco la pared
vim.opt.colorcolumn = "80"
