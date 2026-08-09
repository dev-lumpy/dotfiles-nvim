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

-- Ver logs del LSP (diagnóstico rápido)
vim.keymap.set("n", "<leader>ll", function()
  vim.cmd("edit " .. vim.lsp.log.get_filename())
end, { desc = "Abrir LSP log" })

-- Copiar mensajes de :messages a un buffer temporal
vim.keymap.set("n", "<leader>lm", function()
  vim.cmd("enew | put =execute('messages')")
  vim.bo.buftype = "nofile"
end, { desc = "Messages en buffer" })

-- Terminal toggle (ocultar/mostrar sin perder estado)
local term_buf = nil
vim.keymap.set("n", "<leader>tt", function()
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == term_buf then
        vim.api.nvim_win_close(win, true)
        return
      end
    end
    vim.cmd("botright split")
    vim.api.nvim_win_set_buf(0, term_buf)
    vim.cmd("startinsert")
  else
    vim.cmd("botright split | terminal")
    term_buf = vim.api.nvim_get_current_buf()
    vim.cmd("startinsert")
  end
end, { desc = "Toggle terminal" })

-- Escapar de la terminal al modo normal (en vez de <C-\><C-n>)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Salir de terminal" })

