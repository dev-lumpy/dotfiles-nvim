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

-- Controlando para que se abra a la derecha o abajo el split
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Margen de scroll: evita que el cursor pise el contexto pegajoso (treesitter-context)
vim.opt.scrolloff = 4

-- Sin wrap: permite el scroll horizontal (Shift + h/l)
vim.opt.wrap = false

-- Permite mover el cursor a columnas "virtuales" (scroll horizontal en líneas vacías/cortas)
vim.opt.virtualedit = "all"

-- Colocando una fuente (solo sirve en interfaces en terminales nop)
vim.opt.guifont = "JetBrainsMono Nerd Font:h90:l"

-- La columna para mostrar los errores siempre estara ahi
vim.opt.signcolumn = "yes"

-- Permitir archivos de configuracion locales por proyecto (.nvim.lua)
vim.opt.exrc = true
vim.opt.secure = true -- Pregunta antes de ejecutar .nvim.lua desconocido

-- Borde derecho para saber cuando toco la pared
vim.opt.colorcolumn = "80"

-- Barra de estado siempre visible (ayuda a separar la terminal del código)
vim.opt.laststatus = 2

-- Separador visible entre splits
vim.opt.fillchars = { vert = "│" }
vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("WinSeparatorColor", { clear = true }),
    callback = function()
        vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#585b70" })
    end,
})
