-- ~/.config/nvim/lua/config/neo-tree.lua

-- Aplicamos transparencia total a las ventanas flotantes de Neo-tree
vim.cmd([[
  highlight NeoTreeNormalFloat guibg=NONE ctermbg=NONE
  highlight NeoTreeFloatBorder guibg=NONE ctermbg=NONE
]])

require("neo-tree").setup({
  popup_border_style = "rounded",

  popup = {
    size = {
      height = "60%", -- Puedes usar porcentajes ("60%") o números enteros de filas (20)
      width = "30%",  -- Puedes usar porcentajes ("30%") o números enteros de columnas (40)
    },
    position = "50%", -- Centrado perfectamente en la pantalla (50% vertical y horizontal)
  },
  -- 1. ELIMINAR EL TÍTULO DEL BORDE FLOTANTE
  -- Configura el comportamiento de las ventanas de tipo popup/float
  window = {
    position = "float",
    popup_border_style = "rounded",
    mappings = {
      ["<space>"] = "toggle_node",
    },
  },

  -- 2. APAGAR EL SELECTOR SUPERIOR (Hará desaparecer el título del árbol)
  source_selector = {
    winbar = false,   -- Desactiva la barra de título superior en ventanas normales
    statusline = false, -- Desactiva en la línea de estado
  },

  -- 3. ELIMINAR EL CONTENIDO DE LA CABECERA INTERNA
  renderers = {
    header = {}, -- Mantiene vacía la estructura de texto interna superior
  },

  filesystem = {
    -- Fuerza a que la ventana flotante del explorador NO renderice títulos adicionales
    components = {
      -- Esto asegura que el nodo raíz no intente forzar un título superior flotante
      root_name = function()
        return {}
      end,
    },
    filtered_items = {
      hide_dotfiles = false,
      hide_by_name = {
        ".git",
        ".venv",
        "node_modules",
        "__pycache__",
      },
    },
  },

  default_component_configs = {
    indent = {
      with_expanders = true,
    },
  },
})
