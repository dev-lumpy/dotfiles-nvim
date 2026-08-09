-- ~/.config/nvim/lua/config/telescope.lua

-- Aplicamos transparencia total a las ventanas flotantes de Telescope
vim.cmd([[
  highlight TelescopeNormal guibg=NONE ctermbg=NONE
  highlight TelescopeBorder guibg=NONE ctermbg=NONE
  highlight TelescopePromptBorder guibg=NONE ctermbg=NONE
  highlight TelescopeResultsBorder guibg=NONE ctermbg=NONE
  highlight TelescopePreviewBorder guibg=NONE ctermbg=NONE
]])

local telescope = require("telescope")

telescope.setup({
  defaults = {
    -- Estilo visual redondeado y limpio
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    prompt_prefix = "  ",
    selection_caret = "  ",
    
    -- Diseño de la ventana flotante
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        preview_width = 0.55, -- 55% de la ventana para ver el código antes de abrirlo
        results_width = 0.8,
      },
      width = 0.85,
      height = 0.80,
      preview_cutoff = 120,
    },
  },
})

-- ============================================
-- ATAJOS DE TECLADO (Keymaps)
-- ============================================
local builtin = require("telescope.builtin")

-- Abre el buscador de archivos del proyecto (Fuzzy Finder)
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Buscar archivos" })

-- Busca cualquier palabra dentro de todos tus archivos (Live Grep)
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Buscar texto en archivos" })

-- Busca dentro de los archivos que tienes abiertos actualmente (Buffers)
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buscar buffers abiertos" })

-- Busca en tu historial de comandos recientes
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Buscar ayuda de Neovim" })

