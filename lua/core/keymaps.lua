-- lua/core/keymaps.lua
vim.keymap.set("n", "<C-s>", ":w<CR>")  -- Guardar
vim.keymap.set("n", "sv", ":vsplit<CR>") -- Split vertical

-- El explorador ahora es oil.nvim (ver lua/plugins/editor/oil.lua)

-- ~/.config/nvim/lua/core/keymaps.lua

-- Crear divisiones (Splits) de forma rápida
vim.keymap.set("n", "<leader>vv", ":vsplit<CR>", { desc = "Dividir pantalla verticalmente (Mitad)" })
vim.keymap.set("n", "<leader>ss", ":split<CR>", { desc = "Dividir pantalla horizontalmente" })

-- Navegar entre ventanas divididas usando Alt + h/j/k/l (Ideal para pantallas muy divididas)
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Ir a la ventana izquierda" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Ir a la ventana de abajo" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Ir a la ventana de arriba" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Ir a la ventana derecha" })

-- Redimensionar ventanas fácilmente (Control + Flechas) para ajustar los tamaños de las divisiones
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Incrementar altura" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrementar altura" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrementar ancho" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Incrementar ancho" })

-- Cerrar la ventana dividida actual
vim.keymap.set("n", "<leader>cc", ":close<CR>", { desc = "Cerrar ventana actual (Split)" })

