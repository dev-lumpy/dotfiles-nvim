-- lua/core/keymaps.lua
vim.keymap.set("n", "<C-s>", ":w<CR>")  -- Guardar
vim.keymap.set("n", "<C-a>", "gg0vG$", { desc = "Seleccionar todo" })
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copiar al portapapeles" })
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Pegar del portapapeles" })
vim.keymap.set("n", "sv", ":vsplit<CR>") -- Split vertical
vim.keymap.set("n", "q!", ":qall!<CR>", { desc = "Sale absolutamente de todo" })

-- El explorador ahora es oil.nvim (ver lua/plugins/editor/oil.lua)

-- ~/.config/nvim/lua/core/keymaps.lua

-- Crear divisiones (Splits) de forma rápida
vim.keymap.set("n", "<leader>vv", ":vnew<CR>", { desc = "Dividir pantalla verticalmente (Mitad)" })
vim.keymap.set("n", "<leader>vh", ":new<CR>", { desc = "Dividir pantalla horizontalmente" })

-- Navegar entre ventanas divididas usando Alt + h/j/k/l (Ideal para pantallas muy divididas)
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Ir a la ventana izquierda" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Ir a la ventana de abajo" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Ir a la ventana de arriba" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Ir a la ventana derecha" })

-- Scroll de la pantalla con Shift + h/j/k/l (el cursor se mantiene anclado)
vim.keymap.set("n", "J", "3<C-e>", { desc = "Scroll abajo (3 líneas)" })
vim.keymap.set("n", "K", "3<C-y>", { desc = "Scroll arriba (3 líneas)" })
vim.keymap.set("n", "L", "3zl", { desc = "Scroll derecha (3 columnas)" })
vim.keymap.set("n", "H", "3zh", { desc = "Scroll izquierda (3 columnas)" })

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

-- Android / ADB
vim.keymap.set("n", "<leader>ad", ":!adb devices<CR>", { desc = "Listar dispositivos" })
vim.keymap.set("n", "<leader>ai", ":!./gradlew assembleDebug && adb install -r app/build/outputs/apk/debug/app-debug.apk<CR>", { desc = "Build + instalar APK" })
vim.keymap.set("n", "<leader>ar", ":!adb shell am start -n com.example.asistencia/.MainActivity<CR>", { desc = "Lanzar app" })
vim.keymap.set("n", "<leader>al", ":!adb logcat -b crash<CR>", { desc = "Logs de crash" })

-- Mostrar todos los atajos con which-key
vim.keymap.set("n", "<leader>?", function()
  require("which-key").show()
end, { desc = "Mostrar todos los atajos" })

-- Terminal toggle (ocultar/mostrar sin perder estado)
-- Si esta visible: cierra. Si no: pregunta posicion (h/j/k/l) y abre.
local term_buf = nil
local positions = {
  h = "topleft vsplit",
  j = "botright split",
  k = "topleft split",
  l = "botright vsplit",
}
vim.keymap.set("n", "<leader>tt", function()
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == term_buf then
        vim.api.nvim_win_close(win, true)
        return
      end
    end
  end
  print("terminal: h=izq  j=abajo  k=arriba  l=der")

  -- 🆕 NUEVO: Detectar si presiona ESC
  local key = vim.fn.getchar()
  if key == 27 then  -- 27 es el código numérico de ESC
    return
  end
  local key_char = vim.fn.nr2char(key)

  local split_cmd = positions[key_char] or "botright vsplit"
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    vim.cmd(split_cmd)
    vim.api.nvim_win_set_buf(0, term_buf)
    vim.cmd("startinsert")
  else
    vim.cmd(split_cmd .. " | terminal")
    term_buf = vim.api.nvim_get_current_buf()
    vim.cmd("startinsert")
  end
end, { desc = "Toggle terminal" })

-- Escapar de la terminal al modo normal (en vez de <C-\><C-n>)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Salir de terminal" })

